#!/usr/bin/env ruby

# Download the total
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get "http://uk.virginmoneygiving.com/fundraiser-web/fundraiser/showFundraiserProfilePage.action?userUrl=jonwood"
total = page.search("dl dd:first").text.strip.gsub(/\302\243/, "")

# Write it
File.open(File.join(File.dirname(__FILE__), "..", "tmp", "total.txt"), "w") { |f| f.print(total) }
