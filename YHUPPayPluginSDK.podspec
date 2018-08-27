
Pod::Spec.new do |s|

  s.name         = "YHUPPayPluginSDK"
  s.version      = "3.3.11"
  s.summary      = "银联-手机控件"

  s.description  = "手机控件支付开发包(iOS版)3.3.11"

  s.homepage     = "https://github.com/XmYlzYhkj/YHUPPayPluginSDK"

  s.license      = "MIT"

  s.author       = { "XmYhkj" => "yhkj_xm@163.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/XmYlzYhkj/YHUPPayPluginSDK.git", :tag => "1.8.2" }

  s.source_files  = "Classes", "Classes/*.h"

  s.requires_arc = true

  s.frameworks       = 'SystemConfiguration', 'CoreTelephony','CFNetwork'

  s.libraries        = 'libz'

  s.vendored_libraries = "Classes/*.a"
  

end
