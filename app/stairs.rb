def down_stairs(x,y)

    puts """
    A set of stairs leads down into the darkness.
    They look pretty safe, what do you do?
    """
    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "go"
      puts "You make your way to the bottom "
      puts "without any problems. Good job!"
      x += 1
      start(x,y)
    else
      raptor_kill = """
      You trip and fall, breaking both ankles.
      You lay sputtering curses for a minute, then
      a raptor jumps onto your belly and spills your
      intestines all over the floor...gross.
      """
    the_end(raptor_kill)
    end
end

def up_stairs(x,y,raptor_kill)

    puts "A set of stairs leads back up to where you came"
    puts "from.  They still look safe, what do you do?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "go"
      puts "You make your way up the stairs"
      puts "without any problems.  Good job!"
      x -= 1
      start(x,y)
    else
      raptor_kill = """
      You trip and fall, breaking both ankles.
      You lay sputtering curses for a minute, then
      a raptor jumps onto your belly and spills your
      intestines all over the floor...gross.
      """
    the_end(raptor_kill)
    end
end
