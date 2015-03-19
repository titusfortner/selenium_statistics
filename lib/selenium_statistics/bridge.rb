module Selenium

  module WebDriver
    module Remote
      class Bridge

        alias_method :webdriver_execute, :execute

        def execute(*args)
          command = args[0]

          start_time = Time.now
          begin
            return_value = webdriver_execute(*args)
            SeleniumStatistics.send("#{command}=", Time.now - start_time)
          rescue Exception => ex
            SeleniumStatistics.send("#{command}=", Time.now - start_time)
            raise
          end

          return_value
        end

      end
    end
  end
end
