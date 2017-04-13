Gem::Specification.new do |s|
  s.name          = 'logstash-filter-syslog2json'
  s.version       = '0.1.0'
  s.licenses      = ['Apache License (2.0)']
  s.summary       = 'Syslog to json'
  s.description   = 'Convert unstructured syslog to structured json string.'
  s.homepage      = 'https://github.com/gazer2kanlin'
  s.authors       = ['Kyle K. Lin']
  s.email         = 'gazer.kanlin@gmail.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils', '~> 0'
  s.add_runtime_dependency 'jar-dependencies', '~> 0'
end
