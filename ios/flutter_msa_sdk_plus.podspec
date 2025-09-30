#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_msa_sdk_plus.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_msa_sdk_plus'
  s.version          = '0.0.1'
  s.summary          = 'MSA SDK for Flutter - OAID functionality for Chinese Android devices.'
  s.description      = <<-DESC
MSA SDK for Flutter - OAID functionality for Chinese Android devices.
This plugin provides OAID (Open Advertising ID) functionality for Android devices.
                       DESC
  s.homepage         = 'https://github.com/your-org/flutter_msa_sdk_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
