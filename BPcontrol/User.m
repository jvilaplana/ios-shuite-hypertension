//
//  User.m
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize UUID;
@synthesize name;
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


+(id)sharedManager{
    static User *sharedUser=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedUser = [[self alloc]init];
    });
    
    return sharedUser;
}

-(id)init{
    if (self = [super init]) {
        isInSession = false;
    }
    
    return self;
    }

@end
