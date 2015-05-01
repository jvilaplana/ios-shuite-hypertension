//
//  Message.m
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize date;
@synthesize seen;
@synthesize content;
@synthesize isUser;

-(id)init{

    if (self=[super init]) {
        isUser = false;
        seen = false;
    }
    
    return self;
}

@end
