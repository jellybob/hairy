#!/usr/bin/env ruby

# Download the total
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get "http://uk.virginmoneygiving.com/fundraiser-web/fundraiser/showFundraiserProfilePage.action?userUrl=jonwood"
total = page.search("dl dd:first").text.strip

# Write it
File.open(File.join("/tmp", "hairy-total.txt"), "w") { |f| f.print(total) }
