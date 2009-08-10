# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autotest-java}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darrin Holst"]
  s.date = %q{2009-08-10}
  s.email = %q{darrinholst@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "autotest-java.gemspec",
     "lib/autotest-java.rb",
     "lib/autotest/discover.rb",
     "lib/autotest/junit_to_testunit_formatter.rb",
     "lib/autotest/maven.rb",
     "test/autotest-java_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/darrinholst/autotest-java}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-java}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{run java tests with autotest}
  s.test_files = [
    "test/autotest-java_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
