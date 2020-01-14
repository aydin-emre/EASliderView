#
# Be sure to run `pod lib lint EASliderView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EASliderView'
  s.version          = '0.1.2'
  s.summary          = 'EASliderView is a slider view which includes dots.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'EASliderView is a slider view which includes dots from start to end with equal intervals according to the number of columns.'

  s.homepage         = 'https://github.com/aydin-emre/EASliderView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aydin-emre' => 'ea@ea.tc' }
  s.source           = { :git => 'https://github.com/aydin-emre/EASliderView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'EASliderView/Classes/**/*'
  s.resources = 'EASliderView/Assets/**/*.*'
#  s.resource_bundles = {
#      'EASliderView' => ['EASliderView/Assets/**/*.*']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
