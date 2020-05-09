# UPPayPlugin
银联云闪付SDK 3.0.0


手机支付控件接入指南  


### 1    概述
银联手机支付控件(以下简称支付控件)，主要为合作商户的手机客户端提供安全、便捷的支付服务。用户通过在支付控件中输入银行卡卡号、手机号、密码（借记卡和预付卡）或者CVN2、有效期（信用卡）、验证码等要素完成支付。
(温馨提示: 对于使用中国银联老版支付控件商户可以跳过其他章节，直接对照本文档第5部分对工程进行改造)

### 2    支付流程介绍
通过支付控件进行交易的流程如下图：


流程说明：
（1）用户在客户端中点击购买商品，客户端发起订单生成请求到商户后台；
（2）商户后台收到订单生成请求后，按照《手机控件支付产品接口规范》组织并推送订单信息至银联后台；
（3）银联后台接收订单信息并检查通过后，生成对应交易流水号（即TN），并回复至商户后台（应答要素：交易流水号等）；
（4）商户后台接收到交易流水号（TN），将交易流水号返回至客户端；
（5）客户端通过交易流水号（TN）调用支付控件；
（6）用户在支付控件中输入相关支付信息后，由支付控件向银联后台发起支付请求；
（7）支付成功后，银联后台将支付结果通知给商户后台；
（8）银联后台同时也将支付结果通知支付控件；
（9）支付控件显示支付结果并将支付结果返回至客户端；
注: 本文档主要关注上述流程中（5）（9）部分的实现
iOS版本支付控件适用iOS 6.0及以上版本终端设备。

3    测试帐号

### 4    iOS客户端
本小节涉及到SDK的接口说明、Xcode工程配置及其接口调用细节，需要读者具有一定iOS编程经验。
#### 4.1    SDK说明
商户开发者在获取到银联提供的开发包后请检查SDK文件所在目录YHUPPayPluginSDK/Classes，以下部分提及的文件均在该目录中。银联支付控件静态库，以下简称UPPaymentControl，包含以下4个文件：
UPAPayPlugin.h
UPAPayPluginDelegate.h
UPPaymentControl.h
libPaymentControl.a

#### 4.2    接口说明
##### 1、    支付接口

'''
- (BOOL)startPay:(NSString*)tn fromScheme:(NSString*)schemeStr mode:(NSString*)mode viewController:(UIViewController*)viewController; //返回值 YES：调起支付控件成功；NO：调起支付控件失败；
'''

各个参数定义如下表：
|参数名称|类型|必填|含义|
|----|----|---|
|tn|NSString*|必填项；|交易流水号，商户后台向银联后台提交订单信息后，由银联后台生成并下发给商户后台的交易凭证；| 
|schemeStr|NSString *|必填项; | 商户自定义协议，商户在调用支付接口完成支付后，用于引导支付控件返回而定义的协议，具体请参考4.4第二步中URL Type定义;|
|mode|NSString*|必填项；|接入模式，标识商户以何种方式调用支付控件，该参数提供以下两个可选值："00"代表接入生产环境（正式版本需要）；"01"代表接入开发测试环境（测试版本需要）；|
|viewController|UIViewController*|必填项；|发起调用的视图控制器，商户应用程序调用银联手机支付控件的视图控制器；|
|返回值|BOOL|Y| YES：调起支付控件成功；NO：调起支付控件失败；|

##### 2、检查是否安装银联App的接口

''' - (BOOL)isPaymentAppInstalled '''

此函数无传入参数，主要功能检测用户手机上是否安装银联支付的APP，当用户手机上安装了银联支付APP时候返回YES。


##### 3、返回结果接口

'''
- (void)handlePaymentResult:(NSURL*)url completeBlock:(UPPaymentResultBlock)completionBlock;
'''
 
各参数定义如下表：
|参数名称|类型|必填|含义|
|----|----|---|
| url | NSURL* |必填项；| 支付结果url，传入后由SDK解析并通过completionBlock回调商户客户端；
| completionBlock | Block | 必填项；|商户客户端定义的结果处理方法，此方法包行code、data两个传入参数，本文档4.5第三部分将详细说明；|



#### 4.4    工程配置
##### 1、在工程info.plist设置中添加一个URL Types回调协议(在UPPayDemo工程中使用“UPPayDemo”作为协议)，用于在支付完成后返回商户客户端。请注意URL Schemes需要是唯一的。

##### 3、http请求设置（ats）
在测试环境测试时，需要在工程对应的plist文件中添加NSAppTransportSecurity  Dictionary 并同时设置里面NSAllowsArbitraryLoads 属性值为 YES，具体设置可参照以下截图：

发生产环境可删除此设置。向Apple发布正式版本时请删除此设置。

##### 4、添加协议白名单
在Xcode7.0之后的版本中进行开发，需要在工程对应的plist文件中，添加LSApplicationQueriesSchemes  Array并加入uppaysdk、uppaywallet、uppayx1、uppayx2、uppayx3五个item，具体设置可参考以下截图：

或者直接添加如下代码到plist文件中：
<key>LSApplicationQueriesSchemes</key>
<array>
<string>uppaysdk</string>
<string>uppaywallet</string>
<string>uppayx1</string>
<string>uppayx2</string>
<string>uppayx3</string>
</array>

### 常见问题
请参见https://open.unionpay.com帮助中心-FAQ

#### 官方SDK&Demo
https://open.unionpay.com/tjweb/acproduct/list?apiSvcId=450&index=5
