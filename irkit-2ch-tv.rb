#!/usr/bin/env ruby
require 'irkit'
require 'nokogiri'

page = Nokogiri.parse HTTParty.get("http://bc2ch.net/").body

tr = page.xpath('//table[@class="sitetotal"]//td[@class="station"]')
channels = tr.map{|i| i.text }
p channels

irkit = IRKit::Device.find.first
ir_data = IRKit::Data["IR"][channels.first]
irkit.post_messages ir_data
