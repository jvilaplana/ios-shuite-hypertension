//
//  User.h
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong,nonatomic) NSString* UUID;
@property (strong,nonatomic) NSString* username;
@property (strong,nonatomic) NSString* firstSurname;
@property (strong,nonatomic) NSString* secondSurname;
@property (strong,nonatomic) NSString* identityCard;
@property (strong,nonatomic) NSString* birthDate;
@property (strong,nonatomic) NSString* email;
@property (strong,nonatomic) NSString* lastUpdate;
@property bool active;
@property (strong,nonatomic) NSString* creationDate;
@property (strong,nonatomic) NSString* notes;
@property (strong,nonatomic) NSString* town;
@property (strong,nonatomic) NSString* mobileNumber;
@property (strong,nonatomic) NSString* mobileNumberPrefix;
@property bool isInSession;
@property int dianaSystolicIndex;
@property int dianaDiastolicIndex;

+(id) sharedManager;

@end
