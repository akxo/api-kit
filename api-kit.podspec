#
# Be sure to run `pod lib lint api-kit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'api-kit'
  s.version          = '0.0.5'
  s.summary          = 'networking framework for making api calls'

  s.description      = 'a lightweight, flexible, and easy to use networking abstraction layer for making http requests'

  s.homepage         = 'https://github.com/akxo/api-kit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'akxo' => 'atrix113@aol.com' }
  s.source           = { :git => 'https://github.com/akxo/api-kit.git', :tag => s.version.to_s }
  s.swift_version = '5.4'

  s.platforms = { :ios => "13.0", :osx => "10.15", :watchos => "6.0", :tvos => "13.0" }

  s.source_files = 'Sources/**/*.swift'
  s.module_name = 'APIKit'
end
