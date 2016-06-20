//
//  GameScene.swift
//  AirPlanesGame
//
//  Created by Reed Tothong on 6/19/16.
//  Copyright (c) 2016 Reed Tothong. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let plane = SKSpriteNode(imageNamed:"PLANE 8 N")
		plane.setScale(0.6)
		plane.zPosition = 2
		plane.position = CGPointMake(frame.width/2, 15 + plane.size.height/2)
		addChild(plane)
		
		let background = SKSpriteNode(imageNamed: "airPlanesBackground")
		background.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
		addChild(background)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
//        
//        let location = theEvent.locationInNode(self)
//        
//        let sprite = SKSpriteNode(imageNamed:"Spaceship")
//        sprite.position = location;
//        sprite.setScale(0.5)
//        
//        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//        sprite.runAction(SKAction.repeatActionForever(action))
//        
//        self.addChild(sprite)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
