//
//  User.m
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "User.h"

@implementation User

static User * shared = nil;

@synthesize dianaSystolicIndex;
@synthesize dianaDiastolicIndex;
@synthesize UUID;
@synthesize username;
@synthesize firstSurname;
@synthesize secondSurname;
@synthesize identityCard;
@synthesize birthDate;
@synthesize email;
@synthesize lastUpdate;
@synthesize active;
@synthesize creationDate;
@synthesize notes;
@synthesize mobileNumber;
@synthesize mobileNumberPrefix;
@synthesize town;
@synthesize isInSession;


+(User*)sharedManager{
    @synchronized([User class])
    {
        if (!shared)
            return [[self alloc] init];
        
        return shared;
    }
    
    return nil;
}


+(id)alloc
{
    @synchronized([User class])
    {
        NSAssert(shared == nil, @"Attempted to allocate a second instance of a singleton.");
        shared = [super alloc];
        return shared;
    }
    
    return nil;
}

-(id)init {
    self = [super init];
    
    if (self != nil) {
    }
    return self;
}

@end
