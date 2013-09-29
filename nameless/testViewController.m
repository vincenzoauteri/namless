//
//  testViewController.m
//  nameless
//
//  Created by Vincenzo Auteri on 9/27/13.
//  Copyright (c) 2013 Vincenzo Auteri. All rights reserved.
//

#import "testViewController.h"
#import "LocationModel.h"

@interface testViewController () <LocationModelDelegate>
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (strong,nonatomic) LocationModel *locationModel;

@end

@implementation testViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.lab.text = [NSString stringWithFormat:NSLocalizedString(@"worldKey", Nil)];
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    if (!motionManager.isDeviceMotionAvailable) {
        NSLog(@"No Device available");
    } else {
        NSLog(@"Motion Device available!");
    }
    self.locationModel = [[LocationModel alloc] init];
    [self.locationModel setDelegate:self];
    [self.locationModel.locationManager startUpdatingLocation];
    [self.locationModel.locationManager startUpdatingHeading];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) locationError:(NSError *)error {
    self.locationLabel.text = [error description];

}
- (void) locationUpdate:(NSArray *)locations {
    //NSLog(@"Total locations %d",[locations count]);
    for (CLLocation *location in locations) {
        //NSLog(@"Location %@",[location description]);
        self.locationLabel.text = [location description];
    }
    
}

- (void) headingUpdate:(CLHeading *)heading  {
        self.headingLabel.text = [heading description];
}

@end
