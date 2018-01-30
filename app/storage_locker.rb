def storage_locker

  puts "You see a row of storage lockers."
  puts "What do you do?"
  print "> "

  choice = $stdin.gets.chomp

  if choice.include? "open"
    puts """
    You find mostly worker clothing and
    personal effects, but more importantly
    a shotgun, loaded and ready to go!

    Do you take it?
    >
    """
    weapon_choice = $stdin.gets.chomp

    if weapon_choice.include? "yes"
      puts "Excellent choice!"
    else
      puts "Lame, good luck without it!"
    end
  end
end
