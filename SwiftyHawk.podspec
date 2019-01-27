#
# Be sure to run `pod lib lint SwiftyHawk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyHawk'
  s.version          = '0.0.1'
  s.summary          = 'Hawk Authentication Implementation for Swift'
  s.swift_version    = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Hawk Authentication Implementation for Swift based on the original implementation
                       DESC

  s.homepage         = 'https://github.com/HungerStation/SwiftyHawk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mmgrt' => 'm.mg@outlook.com' }
  s.source           = { :git => 'https://github.com/HungerStation/SwiftyHawk.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/company/hungerstation-com'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftyHawk/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftyHawk' => ['SwiftyHawk/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
