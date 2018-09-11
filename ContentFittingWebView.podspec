#
# Be sure to run `pod lib lint ContentFittingWebView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ContentFittingWebView'
  s.version          = '1.1.0'
  s.summary          = 'A WKWebView subclass which sizes itself to fit its contents.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A WKWebView subclass which sizes itself to fit its contents. Useful if you want
to position a view directly beneath web content using AutoLayout.
                       DESC

  s.homepage         = 'https://github.com/Bilue/ContentFittingWebView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rhys Powell' => 'rhys@rpowell.me' }
  s.source           = { :git => 'https://github.com/Bilue/ContentFittingWebView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.1'

  s.source_files = 'Sources/ContentFittingWebView/**/*'

  s.frameworks = 'UIKit', 'WebKit'
end
