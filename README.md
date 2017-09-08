# SeleniumStatistics

This gem will collect counts and times for each wire call your code makes.

## Usage

When gem is required, statistics will be collected for each wire call.
To access current results, call ```SeleniumStatistics.print_results```

Results can be ported to a file using ```SeleniumStatistics.logger.output = file_name```

Additional debugging information can be obtained by setting 
```SeleniumStatistics.logger = :info``` or ```SeleniumStatistics.logger = :debug```

## Contributing

1. Fork it ( https://github.com/titusfortner/selenium_statistics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2016-2017 Titus Fortner. See LICENSE for details.
