//
//  GameScene.swift
//  AirPlanesGame
//
//  Created by Reed Tothong on 6/19/16.
//  Copyright (c) 2016 Reed Tothong. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
	
	var plane:SKSpriteNode!
	var planeShadow:SKSpriteNode!
	var propeller:SKSpriteNode!
	
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
		
		// add background
		let background = SKSpriteNode(imageNamed: "airPlanesBackground")
		background.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
		addChild(background)

		// add plane
		plane = SKSpriteNode(imageNamed:"PLANE 8 N")
		plane.setScale(0.6)
		plane.zPosition = 2
		plane.position = CGPointMake(frame.width/2, 15 + plane.size.height/2)
		addChild(plane)
		
		// add plane shadow
		planeShadow = SKSpriteNode(imageNamed:"PLANE 8 SHADOW")
		planeShadow.zPosition = 1;
		planeShadow.position = CGPointMake(15, -15)
		plane.addChild(planeShadow)
		
		// add propellor
		propeller = SKSpriteNode(imageNamed:"PLANE PROPELLER 1")
		propeller.setScale(0.7)
		propeller.position = CGPointMake(0, 80)
		propeller.zPosition = 3
		
		// animate propellor forever
		let propeller1 = SKTexture(imageNamed: "PLANE PROPELLER 1")
		let propeller2 = SKTexture(imageNamed: "PLANE PROPELLER 2")
		
		let spin = SKAction.animateWithTextures([propeller1, propeller2], timePerFrame: 0.1)
		let spinForever = SKAction.repeatActionForever(spin)
		
		propeller.runAction(spinForever)
		plane.addChild(propeller)
    }
	
	override func keyDown(theEvent: NSEvent) {
		if theEvent.modifierFlags.contains(NSEventModifierFlags.NumericPadKeyMask){
			if let theArrow = theEvent.charactersIgnoringModifiers, keyChar = theArrow.unicodeScalars.first?.value{
				switch Int(keyChar){
				case NSUpArrowFunctionKey:
					plane.position.y += 5
					break
				case NSDownArrowFunctionKey:
					plane.position.y -= 5
					break
				case NSRightArrowFunctionKey:
					plane.position.x += 5
					break
				case NSLeftArrowFunctionKey:
					plane.position.x -= 5
					break
				default:
					break
				}
			}
		} else {
			if let characters = theEvent.characters{
				for character in characters.characters{
					switch(character){
					case "w":
						break
					default:
						print(character)
					}
				}
			}
		}
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
