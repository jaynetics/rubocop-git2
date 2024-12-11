require File.join(File.expand_path(__dir__), 'lib', 'rubocop', 'git', 'version')

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-git2'
  spec.version       = RuboCop::Git::VERSION
  spec.authors       = ['Masaki Takeuchi', 'Janosch Müller']
  spec.email         = ['janosch84@gmail.com']
  spec.summary       = 'RuboCop for git diff.'
  spec.description   = 'RuboCop for git diff.'
  spec.homepage      = 'https://github.com/jaynetics/rubocop-git2'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_dependency 'rubocop', '~> 1.0', '>= 1.38.0'
end
