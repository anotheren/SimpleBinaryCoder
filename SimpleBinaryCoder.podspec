Pod::Spec.new do |spec|

  spec.name         = 'SimpleBinaryCoder'
  spec.version      = '1.0'
  spec.license      = { :type => 'Apache License 2.0' }
  spec.homepage     = 'https://github.com/anotheren/SimpleBinaryCoder'
  spec.author       = { 'liudong' => 'liudong.edward@gmail.com' }
  spec.summary      = 'A Simple Binary Coder for iOS/macOS/tvOS/watchOS'
  spec.source       = { :git => 'https://github.com/anotheren/SimpleBinaryCoder.git',
                        :tag => spec.version }
  spec.swift_version = '4.1'

  spec.ios.deployment_target     = '8.0'
  spec.osx.deployment_target     = '10.10'
  spec.tvos.deployment_target    = '9.0'
  spec.watchos.deployment_target = '2.0'

  spec.source_files = "Sources/**/*.swift"

end
