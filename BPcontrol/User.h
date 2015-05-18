//
//  User.h
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString* UUID;
@property NSString* name;
@property NSString* firstSurname;
@property NSString* secondSurname;
@property NSString* identityCard;
@property NSString* birthDate;
@property NSString* email;
@property NSString* lastUpdate;
@property bool active;
@property NSString* creationDate;
@property NSString* notes;
@property NSString* town;
@property NSString* mobileNumber;
@property NSString* mobileNumberPrefix;
@property bool isInSession;
@property int dianaSystolicIndex;
@property int dianaDiastolicIndex;

+(id) sharedManager;

@end
