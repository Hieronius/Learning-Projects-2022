
import Foundation
import Cocoa

// Тип шахматной фигуры
enum ChessmanType {
    case king, castle, bishop, pawn, knight, queen
}

enum ChessManColor {
    case black, white
}

class Chessman {
    // тип фигуры
    let type: ChessmanType
    // цвет фигуры
    let color: ChessManColor
    // Координаты фигуры
    var coordinates: (String, Int)? = nil
    // Символ, соответствующий фигуре
    let figureSymbol: Character
    
    // Инициализатор
    init(type: ChessmanType, color: ChessManColor, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
    
    // Дополнительный инициализатор
    init(type: ChessmanType, color: ChessManColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    
    // установка координат
    func setCoordinates(char c: String, num n: Int) {
        coordinates = (c,n)
    }
    // Взятие фигуры
    func kill() {
        coordinates = nil
    }
}

class GameDesk {
    var desk: [Int: [String: Chessman]] = [:]
    
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    
    subscript(alpha: String, number: Int) -> Chessman? {
        get {
            return self.desk[number]![alpha]
        }
    }
    
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."Z"
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}
var game = GameDesk()

// Создаем экземпляр класса
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")

// Запуск экземпляра класса в main.swift
// kingWhite.setCoordinates(char: "E", num: 1)

var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{2655}", coordinates: ("A", 6))

// Записать сюда сабскрипт из книги Усова и проанализировать с помощью задачника Самойлова.
game.setChessman(chess: queenBlack, coordinates: ("A", 3))

game["A", 3]?.coordinates // ("A", 3)
game["C", 5] //nil


