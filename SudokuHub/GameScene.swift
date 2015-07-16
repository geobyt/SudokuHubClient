//
//  GameScene.swift
//  SudokuHub
//
//  Created by George on 7/11/15.
//  Copyright (c) 2015 George. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    var level: Level!
    
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let numberTilesLayer = SKNode()
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.frame.size
        addChild(background)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns) / 2,
            y: -TileHeight * CGFloat(NumRows) / 2)
        
        numberTilesLayer.position = layerPosition
        gameLayer.addChild(numberTilesLayer)
    }
    
    func addSpritesForNuberTiles(numberTiles: Set<NumberTile>)
    {
        for numberTile in numberTiles
        {
            let sprite = SKSpriteNode(imageNamed: numberTile.numberType.spriteName)
            sprite.position = pointForColumn(numberTile.column, row:numberTile.row)
            sprite.size = CGSize(width: TileWidth, height: TileHeight)
            numberTilesLayer.addChild(sprite)
            numberTile.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint
    {
        var xPos: CGFloat = CGFloat(column) * TileWidth + TileWidth / 2
        xPos = xPos + CGFloat(column / 3) * 2
        
        var yPos: CGFloat = CGFloat(row) * TileHeight + TileHeight / 2
        yPos = yPos + CGFloat(row / 3) * 2
        
        return CGPoint(
            x: xPos,
            y: yPos)
    }
}
