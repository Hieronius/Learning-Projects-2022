

import Foundation
import Cocoa

// Black Army
// Pawns

var blackPawn1 = ChessFigure(type: .pawn, color: .black, columnPosition: .a, rowPosition: ._7)

var blackPawn2 = ChessFigure(type: .pawn, color: .black, columnPosition: .b, rowPosition: ._7)

var blackPawn3 = ChessFigure(type: .pawn, color: .black, columnPosition: .c, rowPosition: ._7)

var blackPawn4 = ChessFigure(type: .pawn, color: .black, columnPosition: .d, rowPosition: ._7)

var blackPawn5 = ChessFigure(type: .pawn, color: .black, columnPosition: .e, rowPosition: ._7)

var blackPawn6 = ChessFigure(type: .pawn, color: .black, columnPosition: .f, rowPosition: ._7)

var blackPawn7 = ChessFigure(type: .pawn, color: .black, columnPosition: .g, rowPosition: ._7)

var blackPawn8 = ChessFigure(type: .pawn, color: .black, columnPosition: .h, rowPosition: ._7)

// Black Officers

var blackKing = ChessFigure(type: .king, color: .black, columnPosition: .d, rowPosition: ._8)

var blackQueen = ChessFigure(type: .queen, color: .black, columnPosition: .e, rowPosition: ._8)

var leftSideBlackPriest = ChessFigure(type: .priest, color: .black, columnPosition: .c, rowPosition: ._8)

var rightSideBlackPriest = ChessFigure(type: .priest, color: .black, columnPosition: .f, rowPosition: ._8)

var leftSideBlackHorse = ChessFigure(type: .horse, color: .black, columnPosition: .b, rowPosition: ._8)

var rightSideBlackHorse = ChessFigure(type: .horse, color: .black, columnPosition: .g, rowPosition: ._8)

var leftSideBlackTower = ChessFigure(type: .tower, color: .black, columnPosition: .a, rowPosition: ._8)

var rightSideBlackTower = ChessFigure(type: .tower, color: .black, columnPosition: .h, rowPosition: ._8)




// White army

var whitePawn1 = ChessFigure(type: .pawn, color: .white, columnPosition: .a, rowPosition: ._2)

var whitePawn2 = ChessFigure(type: .pawn, color: .white, columnPosition: .b, rowPosition: ._2)

var whitePawn3 = ChessFigure(type: .pawn, color: .white, columnPosition: .c, rowPosition: ._2)

var whitePawn4 = ChessFigure(type: .pawn, color: .white, columnPosition: .d, rowPosition: ._2)

var whitePawn5 = ChessFigure(type: .pawn, color: .white, columnPosition: .e, rowPosition: ._2)

var whitePawn6 = ChessFigure(type: .pawn, color: .white, columnPosition: .f, rowPosition: ._2)

var whitePawn7 = ChessFigure(type: .pawn, color: .white, columnPosition: .g, rowPosition: ._2)

var whitePawn8 = ChessFigure(type: .pawn, color: .white, columnPosition: .h, rowPosition: ._2)

// Black Officers

var whiteKing = ChessFigure(type: .king, color: .white, columnPosition: .d, rowPosition: ._1)

var whitekQueen = ChessFigure(type: .queen, color: .white, columnPosition: .e, rowPosition: ._1)

var leftSideWhitePriest = ChessFigure(type: .priest, color: .white, columnPosition: .c, rowPosition: ._1)

var rightSideWhitePriest = ChessFigure(type: .priest, color: .white, columnPosition: .f, rowPosition: ._1)

var leftSideWhiteHorse = ChessFigure(type: .horse, color: .white, columnPosition: .b, rowPosition: ._1)

var rightSideWhiteHorse = ChessFigure(type: .horse, color: .white, columnPosition: .g, rowPosition: ._1)

var leftSideWhiteTower = ChessFigure(type: .tower, color: .white, columnPosition: .a, rowPosition: ._1)

var rightSideWhiteTower = ChessFigure(type: .tower, color: .white, columnPosition: .h, rowPosition: ._1)

// Arrays of armys

var blackArmy = [blackPawn1, blackPawn2, blackPawn3, blackPawn4, blackPawn5, blackPawn6, blackPawn7, blackPawn8, blackKing, blackQueen, leftSideBlackHorse, rightSideBlackHorse, leftSideBlackTower, rightSideBlackTower, leftSideBlackPriest, rightSideBlackPriest]

var whiteArmy = [whitePawn1, whitePawn2, whitePawn3, whitePawn4, whitePawn5, whitePawn6, whitePawn7, whitePawn8, whiteKing, whitekQueen, leftSideWhiteHorse, rightSideWhiteHorse, leftSideWhiteTower, rightSideWhiteTower, leftSideWhitePriest, rightSideWhitePriest]

//
