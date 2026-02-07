Gem::Specification.new do |spec|
  spec.name          = "al_citations"
  spec.version       = "0.1.0"
  spec.authors       = ["al-org"]
  spec.email         = ["dev@al-org.dev"]
  spec.summary       = "Citation count tags for Google Scholar and InspireHEP"
  spec.description   = "Jekyll plugin extracted from al-folio that provides Liquid tags to fetch and render citation counts from Google Scholar and InspireHEP."
  spec.homepage      = "https://github.com/al-org-dev/al-citations"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage
  }

  spec.files         = Dir["lib/**/*", "LICENSE", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.9", "< 5.0"
  spec.add_dependency "activesupport", ">= 6.0", "< 8.0"
  spec.add_dependency "nokogiri", ">= 1.13", "< 2.0"

  spec.add_development_dependency "bundler", ">= 2.0", "< 3.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
