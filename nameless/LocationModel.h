//
//  LocationModel.h
//  nameless
//
//  Created by Vincenzo Auteri on 9/28/13.
//  Copyright (c) 2013 Vincenzo Auteri. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocationModelDelegate
@required
-(void) locationUpdate:(NSArray *) locations;
-(void) locationError:(NSError *) error;
-(void) headingUpdate:(CLHeading *) heading;
@end


@interface LocationModel : NSObject <CLLocationManagerDelegate>


@property(strong,nonatomic) CLLocationManager  *locationManager;
@property(strong,nonatomic) id delegate;

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading;


@end
