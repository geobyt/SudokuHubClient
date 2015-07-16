//
//  NumberTile.swift
//  SudokuHub
//
//  Created by George on 7/11/15.
//  Copyright (c) 2015 George. All rights reserved.
//

import SpriteKit

enum NumberType: Int, Printable
{
    case Unknown = 0, num1, num2, num3, num4, num5, num6, num7, num8, num9
    
    var spriteName: String
    {
            let spriteNames = [
                "num1",
                "num2",
                "num3",
                "num4",
                "num5",
                "num6",
                "num7",
                "num8",
                "num9"]
            
            return spriteNames[rawValue - 1]
    }
    
    var description: String
    {
        return spriteName
    }
}

func == (lhs: NumberTile, rhs: NumberTile) -> Bool
{
    return lhs.column == rhs.column && lhs.row == rhs.row
}

class NumberTile: Printable, Hashable
{
    var column: Int
    var row: Int
    let numberType: NumberType
    var sprite: SKSpriteNode?
    
    var hashValue: Int
    {
        return self.column * 9 + self.row
    }
    
    init(column: Int, row: Int, numberType: NumberType)
    {
        self.column = column
        self.row = row
        self.numberType = numberType
    }
    
    var description: String
    {
        return "type:\(numberType) square:(\(column),\(row))"
    }
}
