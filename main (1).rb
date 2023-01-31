class Player

  def initialize(name, sign)
    @name = name
    @sign = sign
  end
  
  def choice
    puts @name + " " + @sign + " " + "make your choice: "
    gets.to_i
  end  
end

def print_board(arr)
  puts "\n" + arr.slice(0, 3).join(' ')
  puts arr.slice(3, 3).join(' ')
  puts arr.slice(6, 3).join(' ') + "\n\n"
end

def pick_spot(spot, spot_locations)
  choice = 0
    until choice <= 9 && choice > 0 do
      choice = spot
      
      if choice > 9 || choice == 0
        puts ("\nYour choice was not an option on the board\n\n")
        choice = 0
      elsif spot_locations[choice - 1] == 'X' || spot_locations[choice - 1] == 'O'
        puts ("\nThat spot is already taken!\n\n")
        choice = 0
      end
      
    end
  choice
end

def check_for_win(arr)
  win = false
  col1 = [arr[0], arr[3], arr[6]]
  col2 = [arr[1], arr[4], arr[7]]
  col3 = [arr[2], arr[5], arr[8]]

  columns = [
    col1.join(''),
    col2.join(''),
    col3.join('')
  ]
  
  diag1 = [arr[0], arr[4], arr[8]]
  diag2 = [arr[2], arr[4], arr[6]]
  
  if arr.slice(0, 3).all? { |sign| sign == 'X'}
    win = true
  elsif arr.slice(3, 3).all? { |sign| sign == 'X'}
    win = true
  elsif arr.slice(6, 3).all? { |sign| sign == 'X'}
    win = true
  elsif arr.slice(0, 3).all? { |sign| sign == 'O'}
    win = true
  elsif arr.slice(3, 3).all? { |sign| sign == 'O'}
    win = true
  elsif arr.slice(6, 3).all? { |sign| sign == 'O'}
    win = true
  elsif columns.any?('XXX')
    win = true
  elsif columns.any?('OOO')
    win = true
  elsif diag1.all?('X')
    win = true
  elsif diag2.all?('X')
    win = true
  elsif diag1.all?('O')
    win = true
  elsif diag2.all?('O')
    win = true
  end
  win
end

def game_start
  arra = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  player1 = Player.new("Player 1", "(X)")
  player2 = Player.new("Player 2", "(O)")

  puts "\n##### TIC-TAC-TOE #####"
  print_board(arra)

  game_over = false
  count = 0
  until count == 9 do
    #first person choice
    spot = pick_spot(player1.choice, arra)
    arra[spot - 1] = 'X' 
    print_board(arra)
    count += 1
    game_over = check_for_win(arra)
    
    #second person choice
    if count != 9 && game_over == false
      spot = pick_spot(player2.choice, arra)
      arra[spot - 1] = 'O'
      print_board(arra)
      count += 1
      game_over = check_for_win(arra)
    end

    if game_over
      puts "Game Over"
      break
    end
    
    if count == 9
      puts "No more turns left"
    end
  end

end

game_start