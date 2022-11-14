class Player
    
    #if these positions are occupied by the player they have won
    WINNING_POSITIONS = [
        [1,2,3], [4,5,6], [7,8,9],
        [1,5,9], [3,5,7], [1,4,7],
        [2,5,6], [3,6,9]
    ]

    #intialization function
    def initialize(sign)
        @sign = sign
        #array which stores all the positions on the board the player occupies
        @positions = Array.new
    end

    #check if player has won
    def check_won
        WINNING_POSITIONS.each do |a|
            if (a & @positions) == a
                return true
            else
                return false
            end
        end
    end
    #add position to position array
    attr_accessor :positions

    def move(position) 
        temp = self.positions
        temp << position.to_i
        self.positions = temp
    end
end
        
grid = {1 => 1, 2=> true, 3=> true, 4=> true, 5=> true, 6=> true, 7=> true, 8=> true, 9=> true}

player1 = Player.new("X")
player2 = Player.new("O")
puts "Welcome to TicTacToe!"

 while true
    #begin code for player 1 moves
    pos = gets.chomp 
    player1.move(pos)
   
    p1 = player1.check_won
    moves = player1.positions
    if player1.check_won 
        puts "Player 1 has won!!!"
        exit
    else
        grid[pos] = false
    end
    #end code for player 1 moves

    #begin code for player 2 moves. 
    pos = gets.chomp 
    p2 = player2.check_won
    if player2.check_won 
        puts "Player 1 has won!!!"
        exit
    else
        grid[pos] = false
    #end code for player 2 moves. 
    end
end
