
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "has_many_through_mongodb/version"

Gem::Specification.new do |spec|
  spec.name          = "has_many_through_mongodb"
  spec.version       = HasManyThroughMongodb::VERSION
  spec.authors       = ["Lalit Kumar Maurya"]
  spec.email         = ["lalit.maurya@engineer.ai"]

  spec.summary       = %q{Custom way to define has_many :through association.}
  spec.description   = %q{Mongoid gem does not provide the has_many :through association.
    It's right becuase as a No SQL database MongodDB does not support these things.
    But sometime required these association by building custom methods. So I had wrapped these moethods into this gems.}
  spec.homepage      = "https://github.com/lalitlogical/has_many_through_mongodb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
