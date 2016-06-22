//
//  GameScene.swift
//  AirPlanesGame
//
//  Created by Reed Tothong on 6/20/16.
//  Copyright (c) 2016 Reed Tothong. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
	
	var plane:SKSpriteNode!
	var planeShadow:SKSpriteNode!
	var propeller:SKSpriteNode!
	
	var currentMaxAccelX:CGFloat = 0.0
	var currentMaxAccelY:CGFloat = 0.0
	
	var motionManager = CMMotionManager()
	
	var smokeTrail = SKEmitterNode()
	
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
		planeShadow.position = CGPointMake(15, -20)
		plane.addChild(planeShadow)
		
		// add propellor
		propeller = SKSpriteNode(imageNamed:"PLANE PROPELLER 1")
		propeller.position = CGPointMake(0, 85)
		propeller.setScale(0.7)
		propeller.zPosition = 3
		
		// animate propellor forever
		let propeller1 = SKTexture(imageNamed: "PLANE PROPELLER 1")
		let propeller2 = SKTexture(imageNamed: "PLANE PROPELLER 2")
		
		let spin = SKAction.animateWithTextures([propeller1, propeller2], timePerFrame: 0.1)
		let spinForever = SKAction.repeatActionForever(spin)
		
		propeller.runAction(spinForever)
		plane.addChild(propeller)
		
		//http://stackoverflow.com/questions/24233191/how-do-i-correctly-pass-a-block-handler-into-this-function-in-swift
		
		motionManager.accelerometerUpdateInterval = 0.2
		motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()){ (data,error) in
			self.outputAccelerationData(data!.acceleration)
			if (error != nil){
				print("\(error)")
			}
			
		}
		
		//adding smoke trail
		//http://www.ioscreator.com/tutorials/particle-emitter-tutorial-sprite-kit-swift
		let path = NSBundle.mainBundle().pathForResource("trail", ofType: "sks")
		smokeTrail = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
		smokeTrail.position = CGPointMake(0, -plane.size.height+15)
		smokeTrail.zPosition = 4
		plane.addChild(smokeTrail)
    }
	
	func outputAccelerationData(acceleration:CMAcceleration){
		currentMaxAccelX = 0
		currentMaxAccelY = 0
		
		let accelX:CGFloat = CGFloat(acceleration.x)
		let accelY:CGFloat = CGFloat(acceleration.y)
		
		
		if (fabs(accelX) > fabs(currentMaxAccelX)){
			currentMaxAccelX = accelX
		}
		if (fabs(accelY) > fabs(currentMaxAccelY)){
			currentMaxAccelY = accelY
		}
		
	}
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

		
		
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
		
		let maxY = frame.width - plane.size.width/2
		let minY = plane.size.width/2
		
		let maxX = frame.height - plane.size.height/2
		let minX = plane.size.height/2
		
		var newY:CGFloat = 0.0
		var newX:CGFloat = 0.0
		
		if currentMaxAccelX > 0.05 {
			newX = currentMaxAccelX * 10
			plane.texture = SKTexture(imageNamed: "PLANE 8 R")
		}
		else if currentMaxAccelX < -0.05{
			newX = currentMaxAccelX * 10
			plane.texture = SKTexture(imageNamed: "PLANE 8 L")
		}
		else {
			newX = currentMaxAccelX * 10
			plane.texture = SKTexture(imageNamed: "PLANE 8 N")
		}
		
		newY = 6.0 + currentMaxAccelY * 10
		
		newX = min(max(newX + plane.position.x, minY), maxY)
		newY = min(max(newY + plane.position.y, minX), maxX)
		
		plane.position = CGPointMake(newX, newY)
		
    }
}
