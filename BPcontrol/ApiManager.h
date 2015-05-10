//
//  ApiManager.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Resources.h"

#define URL_BASE @"http://app2.hesoftgroup.eu"
#define ERROR_DOMAIN @"BPcontrol"

@interface ApiManager : NSObject

+ (id)sharedManager;

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

-(void)initURLs;

-(void)customDialogConnectionError;

-(void)sendTlfToSHUITE:(NSString*) telephone prefix:(NSString*)prefix withCompletionBlock:(CompletionBlock)completionBlock;

-(void)sendCodeToSHUITE:(NSString *)code telephone: (NSString*)tlf prefix:(NSString*)prefix withCompletionBlock:(CompletionBlock)completionBlock;
@end
