# Uncomment the next line to define a global platform for your project
platform :ios, '11.2'

inhibit_all_warnings!

target 'RCTest' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Clean, simple Keychain access.
    # pod 'KeychainAccess'
    
    # Decoding of the access codes sent by the backend.
    # pod 'JWTDecode', '~> 2.1'
    
    # Let views work around the keyboard
    # pod 'IHKeyboardAvoiding'

    # Camera and photo selection with cropping
    # pod 'YPImagePicker'

    # User instrumentation
    # pod 'Amplitude-iOS', '~> 4.0'

    # Subscriptions with RevenueCat
    pod "Purchases"

    # Phone number formatting and entry
    # pod 'PhoneNumberKit'

    # S3 (or equivalent) storage upload
    # pod 'AWSS3'

    # Deep linking with attribution
    # pod 'Branch'

    target 'RCTestTests' do
        inherit! :search_paths
        # Pods for testing
        
        # Old method of HTTP stubbing. To be removed.
        # pod 'OHHTTPStubs/Swift'

        # Real stubbing of HTTP interaction. Doesn't work in UI test targets.
        # pod 'Hippolyte'
    end
end

target 'RCTestUITests' do
    # Pods for UI testing

    # Launch URLs to test deep-linking
    # pod 'GhostHand'
end

pods_with_specific_swift_versions = {
  # 'IHKeyboardAvoiding' => '4.2',
}

post_install do |installer|
    # Disable Code Coverage for Pods projects
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.2'
        end
    end

    # Workaround for Cocoapods issue #7606 https://github.com/CocoaPods/CocoaPods/issues/7606
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end

    installer.pods_project.targets.each do |target|
      if pods_with_specific_swift_versions.key? target.name
        swift_version = pods_with_specific_swift_versions[target.name]
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = swift_version
        end
      end
    end
end
