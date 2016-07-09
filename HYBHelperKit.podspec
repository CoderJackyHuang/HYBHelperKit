Pod::Spec.new do |s|

  s.name         = "HYBHelperKit"
  s.version      = "0.0.1"
  s.summary      = "日常开发必不可少的神器之一，UIBlockKit、UIMakerKit、UIHelperKit、CommonKit、FoundationKit、Controllers、Constants等集于一身的神器！"

  s.description  = <<-DESC
                   日常开发必不可少的神器之一，UIBlockKit、UIMakerKit、UIHelperKit、CommonKit、FoundationKit、Controllers等集于一身的神器，简化日常开发，提高开发效率！
                   DESC

  s.homepage     = "https://github.com/CoderJackyHuang/HYBHelperKit"
  s.license      = "MIT"
  s.author             = { "huangyibiao" => "huangyibiao@163.com" }
  # s.social_media_url   = "http://twitter.com/huangyibiao"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "", :://github.com/CoderJackyHuang/HYBHelperKittag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
