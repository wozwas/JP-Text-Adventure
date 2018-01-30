require_relative "app/switch_room.rb"
require_relative "app/storage_locker.rb"
require_relative "app/stairs.rb"

def the_end(msg)
  puts msg
  exit(0)
end

def dead_end()
  puts """
  You've hit a dead end.  You hear a low
  growling coming from somewhere deeper
  in the bunker. Better try another way.
  """
end

def railing()
  puts """
  You see a railing, and beyond the floor
  falls away into darkness. There must be
  a way to get down there...
  """
end

def map_status(x,y)
  if x < 1
    puts "You've hit a wall, try another direction."
    x = 1
    start(x,y)
  elsif x > 5
    puts "You've hit a wall, try another direction."
    x = 5
    start(x,y)
  elsif y < 1
    puts "You've hit a wall, try another direction."
    y = 1
    start(x,y)
  elsif y > 5
    y = 5
    puts "You've hit a wall, try another direction."
    start(x,y)
  else
    current_room(x,y)
  end
end

def current_room(x,y)
  current_position = [x, y]

  if current_position[0] == 1 && current_position[1] == 1
    puts "You're back where you started."
    start(x,y)
  elsif current_position[0] == 5 && current_position[1] == 3
    storage_locker()
    start(x,y)
  elsif (current_position[0] == 3 && current_position[1] == 3) || (current_position[0] == 3 && current_position[1] == 4) || (current_position[0] == 3 && current_position[1] == 5)
    railing()
    start(x,y)
  elsif (current_position[0] == 2 && current_position[1] == 2) || (current_position[0] == 2 && current_position[1] == 1)
    down_stairs(x,y)
    start(x,y)
  elsif (current_position[0] == 3 && current_position[1] == 2) || (current_position[0] == 3 && current_position[1] == 1)
    up_stairs(x,y)
    start(x,y)
  elsif current_position[0] == 5 && current_position[1] == 5
    switch_room()
  else
    puts "You're in a dark hallway."

    start(x,y)
  end

end

def start(x,y)
  current_position = [x,y]
  inventory = ["Flashlight", "Radio"]
  puts "\nWhat do you do? "
  print "> "

  choice = $stdin.gets.chomp

  return the_end("Mr. Hammond, I've decided not to endorse your park.") if (choice.include? "exit")
  return the_end("Turns out there was a raptor in here the whole time, and he hates loud noises.  You've been eaten, please try again.") if (choice.include? "yell")

  if choice.include? "north"
    current_position[1] += 1
    x, y = current_position
    map_status(x,y)
  elsif choice.include? "south"
    current_position[1] -= 1
    x = current_position[0]
    y = current_position[1]
    map_status(x,y)
  elsif choice.include? "east"
    current_position[0] += 1
    x = current_position[0]
    y = current_position[1]
    map_status(x,y)
  elsif choice.include? "west"
    current_position[0] -= 1
    x = current_position[0]
    y = current_position[1]
    map_status(x,y)
  elsif choice.include? "location"
    puts "You're currently at X-#{x} and Y-#{y}."
    start(x,y)
  elsif choice.include? "help"
    puts open("help.txt").read
    start(x,y)
  elsif choice.include? "warp"
    map_status(5,5)
  else
    puts "Sorry, I don't understand that, please try again."
    start(x,y)
  end
end

x = 1
y = 1

puts open("intro-text.txt").read
start(x,y)
