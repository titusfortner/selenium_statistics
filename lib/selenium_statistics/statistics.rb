module SeleniumStatistics

  extend self

  attr_reader :time, :executions

  @commands = {}
  @executions = 0
  @time = 0

  Selenium::WebDriver::Remote::Bridge::COMMANDS.keys.each do |command|
    define_method("#{command}=") do |time|
      @commands[command] ||= {}

      @commands[command][:time] ||= 0
      @commands[command][:count] ||= 0

      @commands[command][:time] += time
      @commands[command][:count] += 1
      @commands[command][:average] =  @commands[command][:time] / @commands[command][:count]

      @executions += 1
      @time += time

      if ENV['DEBUG'] == 'true'
        puts "Executed #{command} in #{time} sec"
      end
    end

    define_method(command) do
      @commands[command]
    end

    @test_start = Time.now
  end

  def results(sort=nil)
    sort ||= :count
    @test_time = Time.now - @test_start

    @commands.each { |_k, v| v[:average_total] = v[:time]/@test_time}
    @commands.sort_by { |_k, v| v[sort] }.reverse.to_h
  end

  def print_results(sort=nil)
    str = "Executed a total of #{executions} commands in #{time.round(1)} seconds\n"

    results(sort).each do |k,v|
      str << "\t#{k}: \n\t\t\t#{v[:count]} executions;"
      str << "\ttotal of #{v[:time].round(1)} sec;"
      str << "\tavg of #{v[:average].round(3)} sec/cmd;"
      str << "\t#{(100*v[:average_total]).round(2)}% of total\n"
    end

    puts str
  end

  def reset!
    @commands = {}
    @time = 0
    @executions = 0
    @test_start = Time.now
  end
end
