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
  s.social_media_url   = "http://www.huangyibiao.com/"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderJackyHuang/HYBHelperKit.git", :tag => "v#{s.version}" }
  s.source_files  = "HYBHelperKitSources/HYBHelperKit.h"
  s.public_header_files = 'HYBHelperKitSources/HYBHelperKit.h'
  s.requires_arc = true
 s.dependency "Masonry", "~> 1.0.1"

end
