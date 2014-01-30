//
//  main.m
//  Huebert
//
//  Created by Andrew Clissold on 1/18/14.
//  Copyright (c) 2014 Andrew Clissold. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        #ifdef ANDROID
        [UIScreen mainScreen].currentMode =
            [UIScreenMode emulatedMode:UIScreenAspectFitEmulationMode];
        #endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
