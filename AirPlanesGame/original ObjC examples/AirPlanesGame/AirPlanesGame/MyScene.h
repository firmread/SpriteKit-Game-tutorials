//
//  MyScene.h
//  AirPlanesGame
//

//  Copyright (c) 2013 Jorge Costa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MyScene : SKScene<UIAccelerometerDelegate>{
    CGRect screenRect;
    CGFloat screenHeight;
    CGFloat screenWidth;
    double currentMaxAccelX;
    double currentMaxAccelY;
}

@property (strong, nonatomic) CMMotionManager *motionManager;
@property SKSpriteNode *plane;
@property SKSpriteNode *planeShadow;
@property SKSpriteNode *propeller;

@end
