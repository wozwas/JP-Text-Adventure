
def print_panel()

  switch_panel_options = [
    "Mainenance Shed/Bunker",
    "Visitors Cntr Compound",
    "Visitors Cntr Control Rm",
    "Visitors Cntr Tour",
    "Genetics/Fertilization/Hatchery",
    "Grounds Tour",
    "Grounds Surveilance System",
    "Herbivore Feeding Compound",
    "Carnivore Feeding Compound",
    "Velociraptor Fence",
    "T-Rex Paddock Fence",
    "Perimeter Fence"
  ]

  border_length = switch_panel_options.max_by(&:length).length

  switch_panel_options.each do |i|
    current_length = i.length
    cushion = ((border_length - current_length) / 2) + 1

    puts "#{"*" * (border_length + 4)}" if i == switch_panel_options.first
    puts "*#{(" " * cushion)}#{i}#{(" " * cushion)}*"
    puts "#{"*" * (border_length + 4)}"

  end

end

def pump_time()
  puts "What do you do?"
  print "> "

  switch_flips = 0
  power_ready = false

  while power_ready == false

    choice = $stdin.gets.chomp
    if choice.include? "pump"
      switch_flips += 1
      if switch_flips == 5
        puts "You did it!"
        power_ready = true
      else
        puts "That's #{switch_flips}, keep going!"
        print "> "
      end
    else
      puts "I can't do that, try again."
    end
  end
end

def switch_room()
  puts "You found the switch room!"
  puts "In front of you is a panel with a series of"
  puts "indicator lights, all of which are off, and read:"
  print_panel()
  puts "Over the radio you hear Hammond say, 'You"
  puts "need to pump the primer handle, until the"
  puts "button labeled Push to Close is lit.'"

  pump_time()

  puts "Now what?"
  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "push to close"

    puts """
    You did it!  The lights come on, and
    over the radio you hear John give a sigh of
    relief.  You turn leave, when suddenly there's
    a shriek behind you, and a raptor bursts out
    from behind the cabling!
    """
    exit(0)
  else
    puts "I don't understand that, try again."
  end

end
