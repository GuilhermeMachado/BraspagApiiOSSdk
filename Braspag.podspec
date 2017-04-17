Pod::Spec.new do |s|
  s.name             = 'Braspag Api'
  s.version          = '0.2.0'
  s.summary          = 'SDK de integração com a API da Braspag.'

  s.homepage         = 'https://github.com/Braspag/BraspagApiiOSSdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/GuilhermeMachado/BraspagApiiOSSdk', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Braspag/Classes/**/*'

  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'Mantle', '~> 2.0'
end
