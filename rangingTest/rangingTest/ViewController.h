//
//  ViewController.h
//  rangingTest
//
//  Created by Iván González on 6/7/15.
//  Copyright (c) 2015 MOCAPlatform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locManager;

@end

