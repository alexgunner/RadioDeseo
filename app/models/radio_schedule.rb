class RadioSchedule < ApplicationRecord
	has_many :show_schedules

	def show_days
		week_days = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
		result = []
		show_days = days.to_s(2)
		week_days.each_with_index do |day, index|
			if show_days[index] == "1"
				result.push day
			end
		end
		result
	end
end
