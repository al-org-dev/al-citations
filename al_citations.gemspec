Gem::Specification.new do |spec|
  spec.name          = "al_citations"
  spec.version       = "0.1.0"
  spec.authors       = ["al-folio"]
  spec.email         = ["your-email@example.com"]
  spec.summary       = "al-folio plugin for fetching citation counts from Google Scholar and InspireHEP"
  spec.description   = "al-folio plugin that allows you to fetch and display citation counts from Google Scholar and InspireHEP in your al-folio site"
  spec.homepage      = "https://github.com/al-org-dev/al-citations"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.0"
  spec.add_dependency "activesupport"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end