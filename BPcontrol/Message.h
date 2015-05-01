//
//  Message.h
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property NSString* date;
@property bool seen;
@property NSString* content;
@property bool isUser;
@end
