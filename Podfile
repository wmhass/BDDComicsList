# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'



abstract_target 'App' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    target 'BDDComicsList' do
        inherit! :search_paths
        # Pods for BDDComicsList
        
    end

    abstract_target 'Tests' do
        pod 'Quick'
        pod 'Nimble'
        target 'BDDComicsListiOSTests' do
            inherit! :search_paths
            pod 'Quick'
            pod 'Nimble'
            # Pods for testing
        end
        
        target 'BDDComicsListMacOSTests' do
            inherit! :search_paths
            pod 'Quick'
            pod 'Nimble'
            # Pods for testing
        end
        
        target 'BDDComicsListUITests' do
            inherit! :search_paths
            pod 'Quick'
            pod 'Nimble'
            # Pods for testing
        end
    end
end
