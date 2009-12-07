require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('shipsurance', '0.1.4') do |p|
  p.description              = "Integration gem for the ShipSurance gem"
  p.url                      = "http://www.ordercup.com"
  p.author                   = "Tim Matheson"
  p.email                    = "tim.matheson@ordercup.com"
  p.ignore_pattern           = ["tmp/*","script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
