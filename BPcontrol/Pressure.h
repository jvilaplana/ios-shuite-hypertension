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
@property NSInteger systolic;
@property NSInteger diastolic;
@property NSInteger pulse;
@property int semaphore;

+(Pressure*)averageOfPressuresMorning:(NSArray*)morningArray withAfternoonPressures:(NSArray*)afternoonArray;

@end
