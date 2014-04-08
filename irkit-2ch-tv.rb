#!/usr/bin/env ruby
require 'irkit'
require 'nokogiri'
require 'httparty'

page = Nokogiri.parse HTTParty.get("http://bc2ch.net/").body

tr = page.xpath('//table[@class="sitetotal"]//td[@class="station"]')
channels = tr.map{|i| i.text }
p channels
ch = channels.first

unless irkit = IRKit::Device.find.first
  puts "IRKit not found"
end

unless ir_data = IRKit::App::Data["IR"][ch]
  puts %Q{IR-Data "#{ch}" not found}
  exit 1
end

irkit.post_messages ir_data
