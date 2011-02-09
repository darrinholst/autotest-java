$stdin.each_line do |l|
  tests = failures = 0

  match = /Tests run: (\d+),  Failures: (\d+)/.match(l)

  if(match)
    tests, failures = match[1], match[2]
  end

  match = /OK \((\d+) tests\)/.match(l)

  if(match)
    tests = match[1]
  end

  if(tests.to_i > 0)
    puts "#{tests} tests, 0 assertions, #{failures} failures, 0 errors" if tests.to_i > 0
  else
    puts l
  end
end
