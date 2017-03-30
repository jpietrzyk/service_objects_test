require './service_behavior'

require './main_service'
require './dependent_service'

require 'immutable-struct'
require './result.rb'

p MainService.new.process!('Main stuff and some other dependent things')
