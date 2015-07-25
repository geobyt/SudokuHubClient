//
//  NumberChooser.swift
//  SudokuHub
//
//  Created by George on 7/25/15.
//  Copyright (c) 2015 George. All rights reserved.
//

import SpriteKit

class NumberChooser
{
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    var location: CGPoint
    var size: CGSize
    var backgroundSprite: SKSpriteNode?
    
    var numberTiles = [NumberTile]()
    
    init()
    {
        self.location = CGPoint()
        self.size = CGSize()
        backgroundSprite = SKSpriteNode(imageNamed: "Tile")
        
        for i in 0...8
        {
            let numTile = NumberTile(column: i % 3, row: i / 3, numberType: NumberType(rawValue: i + 1)!)
            
            numberTiles.append(numTile)
        }
    }
    
    convenience init(location: CGPoint, size: CGSize)
    {
        self.init()
        
        self.location = location
        self.size = size
        
        self.backgroundSprite!.position = location
        self.backgroundSprite!.size = size
        
        for i in 0...8
        {
            var numTile = numberTiles[i] as NumberTile
            
            let xPos = self.location.x - (self.size.width / 2) + (TileWidth * CGFloat(numTile.column)) + TileWidth / 2
            let yPos = self.location.y - (self.size.height / 2) + (TileHeight * CGFloat(2 - numTile.row)) + TileHeight / 2
            
            let sprite = SKSpriteNode(imageNamed: numTile.numberType.spriteName)
            sprite.position = CGPoint(x: xPos, y: yPos)
            sprite.size = CGSize(width: TileWidth, height: TileHeight)
            
            numTile.sprite = sprite
            
            numberTiles[i] = numTile
        }
    }
    
    func isLocationInsideChooser(location: CGPoint) -> Bool
    {
        if location.x >= (self.location.x - size.width / 2)
            && location.x <= (self.location.x + size.width / 2)
            && location.y >= (self.location.y - size.height / 2)
            && location.y <= (self.location.y + size.height / 2)
        {
            return true
        }
        else
        {
            return false
        }
    }
}
