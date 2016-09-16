# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'i18n/tasks/angular/version'

Gem::Specification.new do |s|
  s.name          = 'i18n-tasks-angular'
  s.version       = I18n::Tasks::Angular::VERSION
  s.authors       = ['Tomasz Pajor']
  s.email         = ['tomek@polishgeeks.com']
  s.license       = 'MIT'
  s.summary       = <<-TEXT
Manage localization and translation with the awesome power of static analysis)
TEXT
  s.description   = <<-TEXT
i18n-tasks helps you find and manage missing and unused translations that are created with angular-translate and angular-translate-once.
TEXT
  s.homepage      = 'https://github.com/hightower/i18n-tasks-angular'

  s.files = `git ls-files -z`.split("\x0")
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w(lib)

  s.add_dependency 'i18n-tasks'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'pry'
end
