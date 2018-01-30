def current_room(x,y)
  current_position = [x, y]

  if current_position[0] == 0 && current_position[1] == 0
    puts "You're at the start, what direction do you go?"
  elsif current_position[0] == 1 && current_position[1] == 1
    #add rooms following this convention
  else
    puts "You're in a dark hallway, where do you go?"
  end

end

current_room(2,0)
