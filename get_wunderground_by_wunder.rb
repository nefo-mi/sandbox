#!/usr/bin/env ruby
# encoding : utf-8

require 'wunderground'
require 'json'
require 'ostruct'

api_key = ENV['WUNDERGROUND_API_KEY']

w = Wunderground.new(api_key, language: 'JP')
result = w.conditions_for('Japan', 'Okinawa')
current = OpenStruct.new(result['current_observation'])

puts "weather: #{current.weather} temp: #{current.temp_c}℃"
