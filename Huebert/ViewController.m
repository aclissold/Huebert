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

const float kRate = 0.05f;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.motionManager = [CMMotionManager new];
    [self.motionManager setDeviceMotionUpdateInterval:kRate];
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                            withHandler:
     ^(CMDeviceMotion *deviceMotion, NSError *error)
     {
//         NSString *x = [[NSString alloc] initWithFormat:@"%.02f", deviceMotion.attitude.roll];
//         self.xLabel.text = x;
//         NSString *y = [[NSString alloc] initWithFormat:@"%.02f", deviceMotion.attitude.pitch];
//         self.yLabel.text = y;
//         NSString *z = [[NSString alloc] initWithFormat:@"%.02f", deviceMotion.attitude.yaw];
//         self.zLabel.text = z;

         float hue = deviceMotion.attitude.yaw / M_PI;
         if (hue < 0) { hue *= -1; }

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
