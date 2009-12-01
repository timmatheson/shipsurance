RAILS_ENV = "development" unless defined?(RAILS_ENV) #stub for dev
require 'rubygems'
require 'active_support'
require 'extensions/hash'
require 'shipsurance/shipsurance'
require 'shipsurance/base'
require 'shipsurance/claim'
require 'shipsurance/record_shipment'
require 'shipsurance/void_record_shipment'
require 'shipsurance/validation'
require 'shipsurance/person'
require 'shipsurance/address'
require 'shipsurance/response'

