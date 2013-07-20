#!/usr/bin/env ruby
# encoding : utf-8

require 'rest-client'
require 'json'
require 'ostruct'

api_key = ENV['WUNDERGROUND_API_KEY']

api_url = "http://api.wunderground.com/api/#{api_key}"
conditions = "/conditions/lang:JP/q/Japan/Okinawa.json"

res = RestClient.get api_url + conditions
parsed_json = JSON.parse(res)

current = OpenStruct.new(parsed_json['current_observation'])

puts "weather: #{current.weather} temp: #{current.temp_c}℃"
