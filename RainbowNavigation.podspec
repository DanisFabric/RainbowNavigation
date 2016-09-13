Pod::Spec.new do |s|
  s.name             = "RainbowNavigation"
  s.version          = "1.1.0"
  s.summary          = "An easy way to change the backgroundColor of UINavigationBar"
  s.homepage         = "https://github.com/danisfabric/RainbowNavigation"
  s.license          = 'MIT'
  s.author           = { "DanisFabric" => "danisfabric@gmail.com" }
  s.source           = { :git => "https://github.com/danisfabric/RainbowNavigation.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'RainbowNavigation/*'

end
