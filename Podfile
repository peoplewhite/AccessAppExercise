platform :ios, '13.0'

target 'Access_App_Exercise_Sean' do
  use_frameworks!
  
  pod 'Alamofire'
  pod 'Moya'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'PKHUD', '~> 5.0'
  pod 'DynamicColor', '~> 4.2.0'
  pod 'SDWebImageSwiftUI'
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
      end
    end
  end
end
