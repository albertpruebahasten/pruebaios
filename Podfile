# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'PT Hasten' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PT Hasten
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'ImageLoader'
  pod 'RealmSwift'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['ImageLoader'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
    if ['Alamofire'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end

