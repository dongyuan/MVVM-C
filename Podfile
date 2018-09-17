platform :ios, '12.0'
inhibit_all_warnings!

target 'MVVMC' do
  use_frameworks!

  # Pods for MVVMC
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxFlow'
  pod 'R.swift'
  pod 'SwiftLint'
  pod 'Moya/RxSwift'
  pod 'Action'

  target 'MVVMCTests' do
    inherit! :search_paths
    pod 'RxBlocking'
    pod 'RxTest'
  end

  target 'MVVMCUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end
