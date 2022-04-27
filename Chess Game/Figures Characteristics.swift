
import Foundation
import Cocoa

public enum FigureType {
    case pawn
    case horse
    case queen
    case king
    case tower
    case priest
}

public enum FigureColor {
    case white
    case black
}

public struct ChessFigure {
    var type: FigureType?
    var color: FigureColor?
    var columnPosition: ColumnCoordinate?
    var rowPosition: RowCoordinate?
}
