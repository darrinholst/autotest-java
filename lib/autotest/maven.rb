require 'autotest'

class Autotest::Maven < Autotest
  def initialize # :nodoc:
    super

    clear_mappings

    add_mapping(/^target\/classes\/.*\.class$/) do |filename, match|
      impl = File.basename(filename, '.class')
      files_matching(/^target\/test-classes\/.*#{impl}Test\.class$/)
    end

    add_mapping(/^target\/test-classes\/.*Test.class$/) do |filename, match|
      filename
    end
  end
  
  def make_test_cmd files_to_test
    cmd = ""
    files = reorder(files_to_test).keys
    
    unless(files.empty?)
    end
    
    cmd
end
