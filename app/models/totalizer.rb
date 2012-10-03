require 'timeout'
require 'mechanize'

class Totalizer
  def self.update_base_amount
    begin
      Timeout::timeout(15) do
        agent = Mechanize.new
        page = agent.get "http://uk.virginmoneygiving.com/fundraiser-web/fundraiser/showFundraiserProfilePage.action?userUrl=jonwood"
        self.base_amount = page.search("dl dd:first").text.strip.gsub(/^./, '').to_f
      end
    rescue Timeout::Error => e
      puts "Timed out updating base amount!"
    end
  end

  def self.base_amount
    Rails.cache.read("given")
  end

  def self.base_amount=(amount)
    Rails.cache.write("given", amount)
    Pusher['hairy'].trigger('total_updated', total)
  end

  def self.additional
    Rails.cache.read("additional_funds")
  end

  def self.additional=(amount)
    Rails.cache.write("additional_funds", amount)
    Pusher['hairy'].trigger('total_updated', total)
  end

  def self.total
    base_amount + additional
  end
end
