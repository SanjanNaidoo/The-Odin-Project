$grid = {1 => true, 2=> true, 3=> true, 4=> true, 5=> true, 6=> true, 7=> true, 8=> true, 9=> true}

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
            end
        end
        return false
    end
    #add position to position array
    attr_accessor :positions
    attr_reader :sign

    def move(position) 
        temp = self.positions
        temp << position.to_i
        self.positions = temp
    end
end

def print_grid
    z = 1
    for i in 1..3
        puts "------------"
        for j in 1..3
            if $grid[z] == "X" or $grid[z] =="O"
                print(" #{$grid[z]} |")
            else
                print(" #{z} |")
            end
            z+=1
        end
        puts ""
        puts "------------"
    end 
end   
        

player1 = Player.new("X")
player2 = Player.new("O")
puts "Welcome to TicTacToe!"
puts "---------------------\n"
puts "Instructions:\n 1. The board is printed below.\n 2. Each number represents a tile that you can mark. If a tile has a X or 0 on it that means it has been marked by you or your opponent. \n 3. To mark a tile enter the number of the tile. \n 4. Have fun and enjoy!"
print_grid

while true
    #begin code for player 1 moves
    puts "Player 1 please enter the number of the tile you wish to mark:"
    pos = gets.chomp 
    player1.move(pos)
    
    if player1.check_won 
        puts "Player 1 has won!!!"
        exit
    else
        $grid[pos.to_i] = player1.sign 
    end
    print_grid
    #end code for player 1 moves

    #begin code for player 2 moves. 
    puts "Player 2 please enter the number of the tile you wish to mark:"
    pos = gets.chomp 
    player2.move(pos)
    
    p2 = player2.check_won
    if player2.check_won 
        puts "Player 2 has won!!!"
        exit
    else
        $grid[pos.to_i] = player2.sign 
    end
    print_grid
    #end code for player 2 moves. 
end
