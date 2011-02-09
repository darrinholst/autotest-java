require 'autotest'

class Autotest::Maven < Autotest
  attr_accessor :classpath

  def initialize # :nodoc:
    super
    cache_classpath
    add_mappings

    self.failed_results_re = /^\d+\) (.*)\((.*)\)/
  end

  def make_test_cmd files_to_test
    cmd = ""
    classes = reorder(files_to_test).map{|k,v| path_to_classname(k)}

    unless(classes.empty?)
      cmd = "#{java} -classpath \"#{classpath}\" #{test_runner} #{classes.join(' ')} | #{results_formatter}"
    end

    cmd
  end

  def extra_class_map
    Hash[
      *self.find_order.grep(/^target\/test-classes/).map { |f|
        [path_to_classname(f), f]
      }.flatten
    ]
  end

  def path_to_classname(path)
    path.gsub(/.*classes\//, '').gsub(/\.class/, '').gsub(/\//, '.')
  end

  def cache_classpath
    puts "extracting classpath from the maven, please stand by"
    result = `mvn -o dependency:build-classpath`
    match = result.match(/.*\.jar/)
    raise "Unable to glean classpath from #{result}" unless match
    self.classpath = ['target/classes', 'target/test-classes', match[0]].join(File::PATH_SEPARATOR) if match
  end

  def add_mappings
    clear_mappings

    add_mapping(/^target\/classes\/.*\.class$/) do |filename, match|
      impl = File.basename(filename, '.class')
      files_matching(/^target\/test-classes\/.*#{impl}Test\.class$/)
    end

    add_mapping(/^target\/test-classes\/.*Test.class$/) do |filename, match|
      filename
    end
  end

  def java
    "java"
  end

  def test_runner
    "org.junit.runner.JUnitCore"
  end

  def results_formatter
    "ruby #{File.join(File.dirname(__FILE__), 'junit_to_testunit_formatter.rb')}"
  end
end
