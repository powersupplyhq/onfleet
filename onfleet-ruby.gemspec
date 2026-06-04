# -*- encoding: utf-8 -*-
# stub: onfleet-ruby 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "onfleet-ruby".freeze
  s.version = "0.1.5".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Wargnier".freeze]
  s.date = "2016-04-08"
  s.description = "To interact with Onfleet's API".freeze
  s.email = "nick@stylelend.com".freeze
  s.files = [".gitignore".freeze, ".rspec".freeze, ".rubocop.yml".freeze, ".rubocop_todo.yml".freeze, ".ruby-version".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "lib/onfleet-ruby.rb".freeze, "lib/onfleet-ruby/actions/create.rb".freeze, "lib/onfleet-ruby/actions/delete.rb".freeze, "lib/onfleet-ruby/actions/find.rb".freeze, "lib/onfleet-ruby/actions/get.rb".freeze, "lib/onfleet-ruby/actions/list.rb".freeze, "lib/onfleet-ruby/actions/query_metadata.rb".freeze, "lib/onfleet-ruby/actions/save.rb".freeze, "lib/onfleet-ruby/actions/short_get.rb".freeze, "lib/onfleet-ruby/actions/update.rb".freeze, "lib/onfleet-ruby/address.rb".freeze, "lib/onfleet-ruby/admin.rb".freeze, "lib/onfleet-ruby/destination.rb".freeze, "lib/onfleet-ruby/errors/authentication_error.rb".freeze, "lib/onfleet-ruby/errors/connection_error.rb".freeze, "lib/onfleet-ruby/errors/invalid_request_error.rb".freeze, "lib/onfleet-ruby/errors/onfleet_error.rb".freeze, "lib/onfleet-ruby/onfleet_object.rb".freeze, "lib/onfleet-ruby/organization.rb".freeze, "lib/onfleet-ruby/recipient.rb".freeze, "lib/onfleet-ruby/task.rb".freeze, "lib/onfleet-ruby/team.rb".freeze, "lib/onfleet-ruby/util.rb".freeze, "lib/onfleet-ruby/vehicle.rb".freeze, "lib/onfleet-ruby/webhook.rb".freeze, "lib/onfleet-ruby/worker.rb".freeze, "onfleet-ruby.gemspec".freeze, "spec/onfleet/admin_spec.rb".freeze, "spec/onfleet/destination_spec.rb".freeze, "spec/onfleet/organization_spec.rb".freeze, "spec/onfleet/recipient_spec.rb".freeze, "spec/onfleet/task_spec.rb".freeze, "spec/onfleet/team_spec.rb".freeze, "spec/onfleet/webhook_spec.rb".freeze, "spec/onfleet/worker_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/http_requests/shared_examples.rb".freeze]
  s.homepage = "http://rubygems.org/gems/onfleet-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Onfleet ruby api".freeze
  s.test_files = ["spec/onfleet/admin_spec.rb".freeze, "spec/onfleet/destination_spec.rb".freeze, "spec/onfleet/organization_spec.rb".freeze, "spec/onfleet/recipient_spec.rb".freeze, "spec/onfleet/task_spec.rb".freeze, "spec/onfleet/team_spec.rb".freeze, "spec/onfleet/webhook_spec.rb".freeze, "spec/onfleet/worker_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/http_requests/shared_examples.rb".freeze]

  s.installed_by_version = "3.5.22".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2".freeze])
  s.add_runtime_dependency(%q<rest-client>.freeze, [">= 2.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rspec-its>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.55".freeze])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.4".freeze])
end
