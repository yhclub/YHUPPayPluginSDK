
Pod::Spec.new do |s|

  s.name         = "YHUPPayPluginSDK"
  s.version      = "0.1.4"
  s.summary      = "银联-手机控件"

  s.description  = "手机控件支付开发包(iOS版) 3.3.11"

  s.homepage     = "https://github.com/XmYlzYhkj/YHUPPayPluginSDK"

  s.license      = "MIT"

  s.author       = { "XmYhkj" => "yhkj_xm@163.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/XmYlzYhkj/YHUPPayPluginSDK.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/*.h"

  s.requires_arc = true

  s.frameworks       = 'SystemConfiguration', 'CoreMotion','CFNetwork', 'CoreTelephony', 'QuartzCore', 'CoreText', 'CoreGraphics', 'UIKit', 'Foundation'

  s.libraries        = 'z', 'c++', 'sqlite3'

  s.vendored_libraries = "Classes/*.a"
  

end
