//
//  LocationModel.m
//  nameless
//
//  Created by Vincenzo Auteri on 9/28/13.
//  Copyright (c) 2013 Vincenzo Auteri. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel

@synthesize locationManager=_locationManager;

-(id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init] ;
        self.locationManager.delegate = self;
    }
      NSLog(@"Location manager Initialised");
    return self;
}


-(void) locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    [self.delegate locationUpdate:locations];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.delegate locationError:error];
    NSLog(@"Error %@",[error description]);
}

-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading   {
    [self.delegate headingUpdate:newHeading];
}


@end
