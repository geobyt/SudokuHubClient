//
//  Level.swift
//  SudokuHub
//
//  Created by George on 7/11/15.
//  Copyright (c) 2015 George. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level
{
    private var numberTiles = Array2D<NumberTile>(columns: NumColumns, rows: NumRows)
    
    init(filename: String)
    {
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename)
        {
            if let numbersArray: AnyObject = dictionary["board"]
            {
                for (row, rowArray) in enumerate(numbersArray as! [[Int]])
                {
                    let numberRow = NumRows - row - 1

                    for (column, value) in enumerate(rowArray)
                    {
                        numberTiles[column, numberRow] = NumberTile(column: column, row: numberRow, numberType: NumberType(rawValue: value)!)
                    }
                }
            }
        }
    }
    
    func numberTileAtColumn(column: Int, row: Int) -> NumberTile?
    {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return numberTiles[column, row]
    }
    
    func createBoard() -> Set<NumberTile>
    {
        //return createInitialBoard()
        var set = Set<NumberTile>()
        
        for row in 0...numberTiles.rows - 1
        {
            for column in 0...numberTiles.columns - 1
            {
                set.insert(numberTiles[row, column]!)
            }
        }
        
        return set
    }
    
    private func createInitialBoard() -> Set<NumberTile>
    {
        var set = Set<NumberTile>()
        
        for row in 0..<NumRows
        {
            for column in 0..<NumColumns
            {
                var numberType = NumberType.num9
                
                let numberTile = NumberTile(column: column, row: row, numberType: numberType)
                numberTiles[column, row] = numberTile
                
                set.insert(numberTile)
            }
        }
        
        return set
    }
}
