//
//  Pressure.m
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "Pressure.h"

@implementation Pressure

@synthesize date;
@synthesize systolic;
@synthesize diastolic;
@synthesize pulse;
@synthesize semaphore;

-(id)init
{
    self = [super init];
    if (self) {
        semaphore = -1;
    }
    return self;
}

+(Pressure*)averageOfPressuresMorning:(NSArray*)morningArray withAfternoonPressures:(NSArray*)afternoonArray{
    
    Pressure *mfirst = (Pressure*)[morningArray objectAtIndex:0];
    Pressure *msecond = (Pressure*)[morningArray objectAtIndex:1];
    
    int mSystolicAvg =(int)(((int)[mfirst systolic] + (int)[msecond systolic])/2);
    int mDiastolicAvg =(int)(((int)[mfirst diastolic] + (int)[msecond diastolic])/2);
    int mPulseAvg =(int)(((int)[mfirst pulse] + (int)[msecond pulse])/2);
    
    Pressure *afirst = (Pressure*)[morningArray objectAtIndex:0];
    Pressure *asecond = (Pressure*)[morningArray objectAtIndex:1];
    
    int aSystolicAvg =(int)(((int)[afirst systolic] + (int)[asecond systolic])/2);
    int aDiastolicAvg =(int)(((int)[afirst diastolic] + (int)[asecond diastolic])/2);
    int aPulseAvg =(int)(((int)[afirst pulse] + (int)[asecond pulse])/2);
    
    int totalSystolicAvg = (int)((mSystolicAvg + aSystolicAvg)/2);
    int totalDiastolicAvg = (int)((mDiastolicAvg + aDiastolicAvg)/2);
    int totalPulseAvg = (int) ((mPulseAvg + aPulseAvg)/2);
    
    Pressure* avgPressure = [[Pressure alloc]init];
    [avgPressure setSystolic:totalSystolicAvg];
    [avgPressure setDiastolic:totalDiastolicAvg];
    [avgPressure setPulse:totalPulseAvg];
    
    return avgPressure;
}

@end
