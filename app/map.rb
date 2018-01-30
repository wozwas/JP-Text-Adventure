# either create an entry for each room
# designating its contents and wall locations,
# or create specific rooms, then rules around wall
# placements.  E.G. if X is 0, you can't go west
require_relative "../main.rb"
# File.expand_path("../main.rb",File.dirname(__FILE__))

def map_status(current_x,current_y)
  position_real = true
  current_position = [current_x, current_y]
  if (current_position[0] < 1 || current_position[0] > 5) || (current_position[1] < 1 || current_position[1] > 5)
    position_real = false
    puts "You've hit a wall, try another direction."
    start()
  else
    puts "X = #{current_position[0]}"
    puts "Y = #{current_position[1]}"
    start()
  end
end

map_status(4,3)
