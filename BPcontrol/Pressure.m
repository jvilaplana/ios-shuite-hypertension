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
@synthesize semaphore;

-(id)init
{
    self = [super init];
    if (self) {
        semaphore = -1;
    }
    return self;
}

@end
