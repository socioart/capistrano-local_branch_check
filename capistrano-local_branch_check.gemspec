lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/local_branch_check/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-local_branch_check"
  spec.version       = Capistrano::LocalBranchCheck::VERSION
  spec.authors       = ["labocho"]
  spec.email         = ["labocho@penguinlab.jp"]

  spec.summary       = %q{Add checking local git branch before all Capistrano tasks}
  spec.description   = %q{Add checking local git branch before all Capistrano tasks}
  spec.homepage      = "https://github.com/socioart/capistrano-local_branch_check"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/socioart/capistrano-local_branch_check"
  spec.metadata["changelog_uri"] = "https://github.com/socioart/capistrano-local_branch_check/blob/master/CHAGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
