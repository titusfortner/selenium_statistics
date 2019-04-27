module SeleniumStatistics

  extend self

  attr_reader :time, :executions, :commands

  @commands = {}
  @executions = 0
  @time = 0
  @test_start = Time.now

  def method_missing(command, time = nil)
    command = command.to_s
    command.gsub!('get_element_location_once_scrolled_into_view', 'get_element_location')
    command.gsub!('get_element_value_of_css_property', 'get_element_css_value')

    return @commands[command] unless command =~ /=$/

    command = command.chomp('=')

    @commands[command] ||= {}

    @commands[command][:time] ||= 0
    @commands[command][:count] ||= 0

    @commands[command][:time] += time
    @commands[command][:count] += 1
    @commands[command][:average] =  @commands[command][:time] / @commands[command][:count]

    @executions += 1
    @time += time

    SeleniumStatistics.logger.info "Executed #{command} in #{time} sec"
    SeleniumStatistics.logger.debug "#{command} executed total of #{@commands[command][:count]} times in #{ @commands[command][:time]} seconds"
  end

  def results(sort=nil)
    sort ||= :count
    @test_time = Time.now - @test_start

    @commands.each { |_k, v| v[:average_total] = v[:time]/@test_time}
    @commands.sort_by { |_k, v| v[sort] }.reverse.to_a
  end

  def print_results(sort=nil)
    str = "Executed a total of #{executions} commands in #{time.round(1)} seconds\n\n"

    results(sort).each do |k,v|
      str << "#{k.to_s}:".ljust(27, ' ')
      str << "executions: #{v[:count].to_s.rjust(executions.size, ' ')}; "
      str << "total seconds: #{v[:time].round(1).to_s.rjust(time.round(1).to_s.size, ' ')}; "
      str << "avg sec/cmd: #{v[:average].round(3).to_s.rjust(5, ' ')}; "
      str << "total: #{(100*v[:average_total]).round(2).to_s.rjust(5, ' ')}%\n"
    end

    SeleniumStatistics.logger.warn str
  end

  def reset!
    @commands = {}
    @time = 0
    @executions = 0
    @test_start = Time.now
  end
end
