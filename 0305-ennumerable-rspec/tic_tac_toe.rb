require 'colorize'
require_relative 'methods_tic_tac_toe'

#Juego
puts "Bievenido al juego #️⃣  🐱  !!\n\n"
puts "----------------------------------"
length_board = 0
loop do
    puts "Elige el tamaño de tu tablero (3-9)"
    length_board = gets.chomp.to_i
    break if length_board >= 3 && length_board <= 9
    puts "Ingrese un valor correcto\n"
end
obj = TicTacToe.new(length_board)
spaces_board = length_board**2

puts "\n\nEmpecemos a jugar\n\n"
msj_inicio = "Elige un número del tablero para hacer tu jugada\n\n"
board = obj.creation_board
puts msj_inicio + board + "\n\n"
jugada = 0
loop do
    jugada = gets.chomp.to_i
    break if jugada > 0 && jugada <(spaces_board+1)
    puts "Ingrese un valor correcto\n" + msj_inicio + board
end
board = obj.after_move(jugada, "1")
puts "\n" + board + "\n\n"
msj_computador = "El computador esta jugando\n\n"
msj_persona = "Continua tu jugada, elige un número del tablero\n\n"
result = ""
for n in (1..((spaces_board - 1)/2))
    system "clear"
    puts msj_computador
    jugada_computador = (obj.array_opciones - obj.array_no_opciones).sample
    board = obj.after_move(jugada_computador, "0")
    puts "\n" + msj_persona + board + "\n\n"
    if obj.step >= (length_board * 2 - 1)
        result = obj.validate_winner("0")
        if result != ""
            puts "El ganador es el computador!!! 😓  😓  Intentalo la proxima vez"
            break
        end
    end
    jugada = 0
    loop do
        jugada = gets.chomp.to_i
        if obj.array_no_opciones.include?(jugada)
            puts "Esa posición esta usada\n"
        elsif jugada > 0 && jugada <(spaces_board+1)
            break
        end
        puts "Ingrese un valor correcto\n" + msj_persona + board
    end
    board = obj.after_move(jugada, "1")
    puts "\n" + board + "\n\n"
    if obj.step >= (length_board * 2 - 1)
        result = obj.validate_winner("1")
        if result != ""
            puts "El ganador eres tú!!! 🎉  🙌  🙌  🎉"
            break
        end
    end
end
puts "Empataron!! 🤷‍♂️  🤷‍♂️" if (obj.step == spaces_board) && (result == "")