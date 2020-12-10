class MealRepository < BaseRepository

	def find_by_id(meal_id)
		@array.find{|meal| meal.id == meal_id.to_i}
	end
end