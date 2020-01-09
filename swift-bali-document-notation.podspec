Pod::Spec.new do |s|
  s.name             = "bali-document-notation"
  s.version          = "2.0.0"
  s.summary          = "Supports Bali Document Notation™ compliant document creation."

  s.description      = <<-DESC
  This library provides tools for created documents using the Bali Document Notation™.
                       DESC

  s.homepage         = "https://github.com/craterdog-bali/swift-bali-document-notation"
  s.license          = 'MIT License'
  s.author           = { "Derk Norton" => "derk.norton@gmail.com", "Aren Dalloul" => "adalloul3108@gmail.com" }
  s.source           = { :git => "https://github.com/craterdog-bali/swift-bali-document-notation.git", :tag => s.version.to_s }

  s.ios.deployment_target = '12.4'
  s.osx.deployment_target = '10.14'
  s.swift_version = '5.1'

  s.requires_arc = true

  s.source_files = 'Source/*.swift'
end
