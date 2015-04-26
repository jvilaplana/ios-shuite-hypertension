//
//  ApiManager.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ApiManager.h"
#import <AFNetworking.h>

#pragma mark Singleton Methods

@implementation ApiManager

+ (id)sharedManager {
    static ApiManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
        //_manager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

@end
