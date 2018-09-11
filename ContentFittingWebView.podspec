Pod::Spec.new do |spec|
  spec.name         = 'ContentFittingWebView'
  spec.version      = '1.0.2'
  spec.platform     = :ios, '8.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/Bilue/ContentFittingWebView'
  spec.authors      = { 'Rhys Powell' => 'rhys@bilue.com.au' }
  spec.summary      = 'A WKWebView subclass which sizes itself to fit its contents.'
  spec.source       = { :git => 'https://github.com/Bilue/ContentFittingWebView.git', :tag => 'v1.0.2' }
  spec.source_files = 'ContentFittingWebView/**/*.swift'
  spec.swift_version = '4.2'
  spec.ios.framework = 'UIKit'
  spec.ios.framework = 'WebKit'
end
