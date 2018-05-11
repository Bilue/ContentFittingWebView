Pod::Spec.new do |spec|
  spec.name         = 'ContentFittingWebView'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/Bilue/ContentFittingWebView'
  spec.authors      = { 'Rhys Powell' => 'rhys@bilue.com.au' }
  spec.summary      = 'ARA WKWebView subclass which sizes itself to fit its contents.'
  spec.source       = { :git => 'https://github.com/Bilue/ContentFittingWebView.git', :tag => 'v1.0.0' }
  spec.source_files = 'ContentFittingWebView/**'
  spec.framework    = 'ContentFittingWebView'
end
