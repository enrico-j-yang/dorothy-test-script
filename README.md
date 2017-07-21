# 前装HUD测试脚本

## 环境配置

### 安装Python3

测试脚本由python编写，为避免版本兼容问题，请安装python3版本

Windows平台请到https://www.python.org/downloads/ 下载安装3.6版本

MacOS平台可以通过brew install python3安装

### 安装pip包管理工具

pip包管理工具可以比较方便地安装python各种模块，安装说明请查看以下网址

https://pip.pypa.io/en/stable/installing/

### 安装behave

测试脚本使用python下的BDD工具behave编写，只是运行脚本，可以通过pip安装behave 1.2.5版本。

>pip install behave

由于1.2.5版本在Pycharm环境下调试有bug。测试人员修改调试脚本，需要取github上behave最新代码进行安装。

>pip install git+https://github.com/behave/behave

### 安装python串口模块pyserial

>pip install pyserial

### 安装USBCAN驱动

此驱动只支持windows平台

http://www.zlg.cn/data/upload/software/Can/USBCAN_E_U_drive.zip

## 脚本设置

### 连接USBCAN，真实发送数据
此模式适用于连接产品真实测试

请修改environment.py文件中SerialPort的对象生成参数为以下形式
```
context.can_serial = SerialPort(context.log_control)
```
### 连接USBCAN，自收自发
此模式适用于只连接USBCAN，不连接产品的测试脚本调试
请修改environment.py文件中SerialPort的对象生成参数为以下形式
```
context.can_serial = SerialPort(context.log_control, mock_enable=False, send_mock=True)
```
### 不连接USBCAN
此模式适用于不连接USBCAN，只在电脑上调试脚本
请修改environment.py文件中SerialPort的对象生成参数为以下形式
```
context.can_serial = SerialPort(context.log_control, mock_enable=True, send_mock=True)
```
## 运行脚本

### 运行全部场景（用例）
>behave --no-logcapture --no-capture -k

### 以标签名批量运行场景（用例）

>behave --no-logcapture --no-capture -k -t tagname

其中tagname为标签名字，大小写敏感

## 脚本发送数据确认

运行完测试脚本后，会生成dorothy_test.log的日志文件，日志的等级请修改environment.py的日志设置的level
```
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    filename='dorothy_test.log',
                    filemode='w')
```
level可以选择，ERROR,WARNING,INFO,DEBUG

当level设置为DEBUG时，日志里会有形如
>inc0.01-limit_speed-msg_id280-msg_data[255, 255, 0, 255, 0, 0, 0, 0]

的数据打印。

* 其中inc0.01表示周期0.01秒发送的包
* limit_speed是包名（限速巡航）
* msg_id280表示CAN_ID是280（0x118）
* msg_data里是8个字节的数据，其中的值为10进制
