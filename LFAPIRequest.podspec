Pod::Spec.new do |s|
  s.name         = "LFAPIRequest"
  s.version      = "0.0.1"
  s.summary      = "Liufan API Library."

  s.description  = "流泛科技有限公司，用于API请求的库，主要用于第三方登录"

  s.homepage     = "https://github.com/sebarina/LFAPIRequest"

  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
           © 2015 Liufan Technology
    LICENSE
  }

  s.author             = { "sebarina.xl" => "sebarina.xl@alibaba-inc.com" }

  s.platform     = :ios, "8.4"

  #  When using multiple platforms
  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/sebarina/LFAPIRequest.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "LFAPIRequest/*.swift"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  s.requires_arc = true

end
