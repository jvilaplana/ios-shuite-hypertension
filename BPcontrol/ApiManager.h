//
//  ApiManager.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resources.h"

#define URL_BASE @"http://app2.hesoftgroup.eu"

@interface ApiManager : NSObject

+ (id)sharedManager;

//@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

//-(void)getBackendJsonWithCompletionBlock:(CompletionBlock)completionBlock;

//-(void)getUrlStringToStreamFromEpisodeUrlString:(NSString*)episodeUrlString withCompletiobBlock:(CompletionBlock)completionBlock;

@end
