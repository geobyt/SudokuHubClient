//
//  GameViewController.swift
//  SudokuHub
//
//  Created by George on 7/11/15.
//  Copyright (c) 2015 George. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController
{
    var scene: GameScene!
    
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    override func shouldAutorotate() -> Bool
    {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        level = Level()
        scene.level = level
        
        // Present the scene.
        skView.presentScene(scene)
        
        beginGame()
    }
    
    func beginGame()
    {
        createGameBoard()
    }
    
    func createGameBoard() {
        let newNumberTiles = level.createBoard()
        scene.addSpritesForNuberTiles(newNumberTiles)
    }
    
}
