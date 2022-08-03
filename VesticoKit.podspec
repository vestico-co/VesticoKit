#
# Be sure to run `pod lib lint VesticoKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VesticoKit'
  s.version          = '1.0.0'
  s.summary          = 'A framework to integrate Vestico into iOS apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A framework to integrate Vestico into fashion & beauty iOS apps.
                       DESC

  s.homepage         = 'https://github.com/vestico-co/VesticoKit'
  s.license          = { :type => 'LGPV', :file => 'LICENSE' }
  s.author           = { 'Vestico Ltd.' => 'info@vestico.co' }
  s.source           = { :http => 'https://github.com/vestico-co/VesticoKit/raw/main/VesticoKit.zip' }
  s.social_media_url = 'https://www.instagram.com/vestico__/'
  
  s.platform                = :ios
  s.ios.deployment_target = '13.0'

  s.ios.vendored_frameworks = 'VesticoKit.xcframework'
  
end
