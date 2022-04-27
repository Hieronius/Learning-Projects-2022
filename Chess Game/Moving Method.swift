
import Foundation
import Cocoa

func moveFigure(figure: inout ChessFigure, newColumnCoordinate: ColumnCoordinate, newRowCoordinate: RowCoordinate) -> ChessFigure {
    figure.columnPosition = newColumnCoordinate
    figure.rowPosition = newRowCoordinate
    print("\(figure) right now in position - \(newColumnCoordinate)\(newRowCoordinate)")
    print("Turn for second player")
    return figure
}
