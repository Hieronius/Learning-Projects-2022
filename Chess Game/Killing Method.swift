

import Foundation
import Cocoa

func firugeKill(newFigure: inout ChessFigure, oldFigure: inout ChessFigure, newColumnCoordinate: ColumnCoordinate, newRowCoordinate: RowCoordinate) -> ChessFigure? {
    
    if newColumnCoordinate == oldFigure.columnPosition &&
        newRowCoordinate == oldFigure.rowPosition &&
        newFigure.color != oldFigure.color {
        
        oldFigure.columnPosition = nil
        oldFigure.rowPosition = nil
        oldFigure.type = nil
        oldFigure.color = nil
        
        newFigure.columnPosition = newColumnCoordinate
        newFigure.rowPosition = newRowCoordinate
        
        print("\(type(of: newFigure.self)) killed \(type(of: oldFigure.self))")
        print("Turn for next player")
    }
    return newFigure
}
