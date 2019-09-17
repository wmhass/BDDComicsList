# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BDDComicsList' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BDDComicsList
  
  abstract_target 'Tests' do
      pod 'Quick'
      pod 'Nimble'
      inherit! :search_paths

      target 'BDDComicsListiOSTests' do
          inherit! :search_paths
          # Pods for testing
      end
      
      target 'BDDComicsListMacOSTests' do
          inherit! :search_paths
          # Pods for testing
      end
      
      target 'BDDComicsListUITests' do
          inherit! :search_paths
          # Pods for testing
      end
  end

end
