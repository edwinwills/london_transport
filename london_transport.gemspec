Gem::Specification.new do |s|
  s.name        = 'london_transport'
  s.version     = '1.0.0'
  s.date        = '2017-04-04'
  s.summary     = 'Wrapper for the TFL API'
  s.description = 'Uses the TFL API to return simple, useful station/stop data based around a long/lat pair'
  s.authors     = ['Edwin Wills']
  s.email       = 'edwin@edwinwills.com'
  s.homepage    = 'http://rubygems.org/gems/london_transport'
  s.license     = 'MIT'

  s.files       = Dir['{lib}/**/*', '*.md']

  s.add_dependency 'oj', '>= 2.13', '< 3.0'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'webmock', '~> 1'
  s.add_development_dependency 'vcr', '~> 2'
end
