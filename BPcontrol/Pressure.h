//
//  Pressure.h
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pressure : NSObject

@property NSDate* date;
@property NSString* systolic;
@property NSString* diastolic;
@property NSString* pulse;
@property int semaphore;

@end
