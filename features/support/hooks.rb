Before do
  puts "\n Next Scenario"
end

After do |s|
  if s.failed? && ENV.include?('EXIT_WHEN_FAIL') && ENV['EXIT_WHEN_FAIL'] == 1
    Cucumber.wants_to_quit = true
  end
end

Before('@updating','~@correct') do
  puts "\n Checking with wrong input"
end