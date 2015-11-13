Pod::Spec.new do |s|
  s.name         = "CJNewsOrder"
  s.version      = "1.0.2"
  s.summary      = "网易新闻订阅功能的结构"
  s.homepage     = "https://github.com/dvlproad/CJNewsOrder"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "913168921@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJNewsOrder.git", :tag => "1.0.21" }
  s.source_files  = "CJNewsOrder/**/*.{h,m}"
  s.resources = "CJNewsOrder/**/*.{png}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.dependency 'FMDB', '~> 2.5'

end
