class Workout
  attr_reader :id, :date
  def initialize(id, data)
    @id = id
    @date = data[id][:date]
    @exercise = data [id][:exercises]
  end

  #############################
#      TYPE
#############################

def find_categories
  category = []
    @exercise.each do |row|
    category << row[:category]
 end

total = category.count

if category.count{|x| x == "strength"}.to_f/total.to_f >= 0.50
  return "strength"
elsif category.count{|x| x == "cardio"}.to_f/total.to_f >= 0.50
  return "cardio"
else
  return "others"
end

end

#############################
#      DURATION
#############################

def duration
  total_time = 0
  @exercise.each do |row|
      total_time += row[:duration_in_min]
    end
    total_time
  end

#############################
#      CALORIES BURNED
#############################
def calc_cals
  total_cals = 0
  @exercise.each do |row|
      calories = 0
    if row[:intensity] == "high"
      calories = row[:duration_in_min] * 10
      elsif row[:intensity] == "medium"
        calories = row[:duration_in_min] * 8
      elsif row[:intensity] == "low" || row[:category] == "strength"
        calories = row[:duration_in_min] * 5
      else
        calories = row[:duration_in_min] * 6
      end
      total_cals += calories
    end
   total_cals
  end

end

