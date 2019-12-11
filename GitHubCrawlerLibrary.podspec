Pod::Spec.new do |spec|

  spec.name         = "GitHubCrawlerLibrary"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"
  
  spec.description  = <<-DESC
This CocoaPods library help you fetch rakuten repository for provided platform and dept
                   DESC

  spec.homepage     = "https://github.com/tejasdhanuka24291/GitHubCrawlerLibrary"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Tejas, Dhanuka" => "ts-dhanuka.tejas@rakuten.com" }

  
  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/tejasdhanuka24291/GitHubCrawlerLibrary.git", :tag => "#{spec.version}" }
  spec.source_files  = "GitHubCrawlerLibrary/**/*.{h,m,swift}"


end
