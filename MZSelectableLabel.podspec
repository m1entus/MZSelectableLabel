Pod::Spec.new do |s|
  s.name     = 'MZSelectableLabel'
  s.version  = '0.1.2'
  s.license  = 'MIT'
  s.summary  = 'A simple to use drop in replacement for UILabel for iOS 7 that provides automatic detection of colors.'
  s.homepage = 'https://github.com/m1entus/MZSelectableLabel'
  s.authors  = 'Michał Zaborowski'
  s.source   = { :git => 'https://github.com/m1entus/MZSelectableLabel.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'MZSelectableLabel/*.{h,m}'
  s.platform = :ios, '7.0'
  s.frameworks = 'UIKit'
end
