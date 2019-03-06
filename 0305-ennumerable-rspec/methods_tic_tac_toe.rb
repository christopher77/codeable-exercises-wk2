class TicTacToe
    attr_reader :step, :array_no_opciones, :array_opciones, :array_move
    def initialize (length_board)
        @array_move_winner = []
        @num_board = length_board
        @array_move = Array.new(@num_board**2,"")
        @array_opciones = (1..(@num_board**2)).to_a
        @array_no_opciones = []
        @step = 0
        creation_solution
    end

    def creation_solution
        index_final = @num_board**2 - 1

        arr_vertical = Array.new(@num_board) { Array.new }
        con_v = 0

        arr_horizontal = []

        arr_diagonal = Array.new(2) { Array.new }
        
        for i in 0..index_final
            #Creando soluciones del michi horizontales
            arr_horizontal.push(i)

            #Creando soluciones del michi verticales
            arr_vertical[con_v].push(i)
            con_v += 1

            #Creando soluciones del michi diagonales
            arr_diagonal[0].push(i) if i % (@num_board + 1) == 0
            arr_diagonal[1].push(i) if i > 0 && i < index_final && (i % (@num_board - 1) == 0)

            if (i+1) % @num_board == 0
                @array_move_winner.push(arr_horizontal)
                arr_horizontal=[]
                con_v = 0
            end
        end
        @array_move_winner = @array_move_winner + arr_vertical + arr_diagonal
    end

    def creation_board 
        num_arr = @array_move.length - 1
        tablero = ""
        for i in (0..num_arr)
            posicion = "  " + (i+1).to_s
            move = false
            case @array_move[i]
                when "1"
                    posicion = "  x".blue
                    move = true
                when "0"
                    posicion = "  o".red
                    move = true
            end
            
            if i < num_arr
                if (i + 1) % @num_board == 0
                    posicion += "\n" + "-" * (@num_board * 6 - 1) +"\n"
                else
                    posicion += " "
                    if !move
                        (i+1)>9 ? posicion += "|" : posicion += " |"
                    else
                        posicion += " |"
                    end
                end
            end
            tablero += posicion
        end
        tablero
    end

    def validate_winner (last_player)
        num_elem_winner = @array_move_winner.length - 1
        for i in 0..num_elem_winner
            list = @array_move.select.with_index{|n,m| @array_move_winner[i].include?(m)}
            if ( list  == Array.new(@num_board,"1") || list == Array.new(@num_board,"0"))
                return last_player
            end
        end
        return ""
    end

    def after_move(position_board, player)
        @array_move[position_board-1] = player
        @array_no_opciones << position_board
        @step += 1
        creation_board
    end
end