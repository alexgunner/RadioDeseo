class RadioShow < ApplicationRecord
	has_many :show_schedules
	has_many :show_hosts

	def has_host host_id
		result = true
		if show_hosts.find_by(radio_host_id: host_id).nil?
			result = false
		end
		result
	end

	def hosts
		hosts = []
		show_hosts.each do |host|
			hosts.push RadioHost.find(host.radio_host_id)
		end
		hosts
	end
end
