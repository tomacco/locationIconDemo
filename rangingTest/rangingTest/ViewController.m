//
//  ViewController.m
//  rangingTest
//
//  Created by Iván González on 6/7/15.
//  Copyright (c) 2015 MOCAPlatform. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *beaconLabel;
@property (weak, nonatomic) IBOutlet CustomView *arrow;
@property (nonatomic, assign) BOOL isRanging;
@property (weak, nonatomic) IBOutlet UIButton *rangeButton;
@property (strong, nonatomic) CLBeaconRegion* regionToMonitor;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //create region
    self.regionToMonitor = [[CLBeaconRegion alloc] initWithProximityUUID: [[NSUUID alloc] initWithUUIDString:@"f7826da6-4fa2-4e98-8024-bc5b71e0893e"] identifier:@"DaBeacon"];
    
    self.isRanging = NO;
    [self.rangeButton setTitle:@"Start Ranging" forState:UIControlStateNormal];
    self.beaconLabel.text = @"Press button to start";
    self.arrow.layer.hidden = YES;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Beacon code
- (void)registerBeaconRegionWithregion:(CLBeaconRegion*) region {
    
    self.locManager = [[CLLocationManager alloc] init];
    [self.locManager setDelegate:self];
    [self.locManager requestAlwaysAuthorization];
    
   
    // Register the beacon region with the location manager.
    [self.locManager startRangingBeaconsInRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region {
    
    if ([beacons count] > 0) {
        CLBeacon *nearestExhibit = [beacons firstObject];
        self.beaconLabel.text = [nearestExhibit.major stringValue];
        [self.locManager startRangingBeaconsInRegion:region];
    }
    else {
        self.beaconLabel.text = @"-";
    }
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region {
    self.beaconLabel.text = region.identifier;

}

- (IBAction)startOrStopRanging:(UIButton *)sender {
    if (!self.isRanging) {
        self.isRanging = YES;
        [self.rangeButton setTitle:@"Stop Ranging" forState:UIControlStateNormal];
        [self registerBeaconRegionWithregion:self.regionToMonitor];
        self.arrow.layer.hidden = NO;
        [self.arrow addUntitled1Animation];
        self.beaconLabel.text = @"Starting... (ensure Bluetooth is turned on)";
    }
    else{
        self.arrow.layer.hidden = YES;
        self.isRanging = NO;
        [self.rangeButton setTitle:@"Start Ranging" forState:UIControlStateNormal];
        [self.locManager stopRangingBeaconsInRegion:self.regionToMonitor];
        [self.locManager stopMonitoringForRegion:self.regionToMonitor];
        [self.arrow removeAnimationsForAnimationId:@"Untitled1"];
        self.beaconLabel.text = @"Press button to start";
    }
}



@end
