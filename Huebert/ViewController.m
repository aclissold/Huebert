//
//  ViewController.m
//  Huebert
//
//  Created by Andrew Clissold on 1/18/14.
//  Copyright (c) 2014 Andrew Clissold. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (strong, nonatomic) CMMotionManager* motionManager;
@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;

@end

@implementation ViewController

const float kRate = 0.2f;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.motionManager = [CMMotionManager new];

    [self.motionManager setAccelerometerUpdateInterval:kRate];
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                             withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error)
     {

         NSLog(@"y: %f, x: %f", accelerometerData.acceleration.y, accelerometerData.acceleration.x);
         float theta = atan2f(accelerometerData.acceleration.x, accelerometerData.acceleration.y) + M_PI;
         NSLog(@"theta: %f", theta);
         float hue = theta / (2 * M_PI);

         [UIView animateWithDuration:kRate animations:
          ^{
              [self.view setBackgroundColor:[UIColor colorWithHue:hue
                                                       saturation:1
                                                       brightness:1
                                                            alpha:1]];
          }];
     }];
}

@end
