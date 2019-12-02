class ShowHost < ApplicationRecord
  belongs_to :radio_show
  belongs_to :radio_host

  def self.register radio_show, host
  	show_host = ShowHost.new
  	show_host.radio_show = radio_show
  	host_found = RadioHost.find(host).first
  	show_host.radio_host = host_found
  	show_host.save!
  end
end
