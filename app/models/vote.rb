class Vote < ActiveRecord::Base
  attr_accessible :answer, :ip_address, :user_agent
end
