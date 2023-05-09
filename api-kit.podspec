#
# Be sure to run `pod lib lint api-kit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'api-kit'
  s.version          = '0.0.4'
  s.summary          = 'networking framework for making api calls'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'a lightweight, flexible, and easy to use networking abstraction layer for making http requests'

  s.homepage         = 'https://github.com/akxo/apikit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'akxo' => 'atrix113@aol.com' }
  s.source           = { :git => 'https://github.com/akxo/apikit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.8'

  s.platforms = { :ios => "13.0", :osx => "10.15", :watchos => "6.0", :tvos => "13.0" }

  s.source_files = 'Sources/**/*.swift'
  s.module_name = 'APIKit'
end
