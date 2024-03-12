Gem::Specification.new do |spec|
  spec.name          = "base-service-ruby"
  spec.version       = "0.1.0"
  spec.authors       = ["icanmakeitbetter"]
  spec.email         = ["dmitry.sychev@materialplus.io"]
  spec.summary       = %q{Base Service Model}
  spec.description   = %q{A small class to encapsulate results from service objects, poros etc}
  spec.homepage      = "https://github.com/Material-Dev/base-service-ruby"
  spec.license       = "MIT"

  spec.files         = Dir['{lib}/**/*'] + ['README.md', 'LICENSE.md']

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'shoulda'
  spec.add_development_dependency 'byebug'
end
