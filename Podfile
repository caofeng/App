# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

def thirdLib()
  
  pod 'SnapKit'
  pod 'MJRefresh'
  pod 'Alamofire'
  pod 'FDFullscreenPopGesture'
  pod 'HandyJSON'
  pod 'MBProgressHUD'

end

workspace 'App'

target 'App' do
  
  project './App.xcodeproj'

  thirdLib()
  
  target 'Common' do
    project './App/Modules/Common/Common.xcodeproj'
    thirdLib()
  end
  
  target 'Network' do
    project './App/Modules/Network/Network.xcodeproj'
    thirdLib()
  end

end

#disable some warnings
post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          #disable some warnings of Pods
          config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
  end
end

#install! 'cocoapods', :generate_multiple_pod_projects => true
