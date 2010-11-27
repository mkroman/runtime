#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/../library'
require 'runtime'

# FIXME
at '07:10 pm' do
  puts "the time is now 07:10 pm"
end

_in 3.seconds do |i|
  exit 1
end

loop do
  sleep 1
end
