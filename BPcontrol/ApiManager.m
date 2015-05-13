//
//  ApiManager.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ApiManager.h"
#import "User.h"

#pragma mark Singleton Methods

#define SEND_TLF_URL @"/hypertensionPatient/restValidateMobile/"
#define SEND_CODE_URL @"/hypertensionPatient/restValidateCode/"
#define GET_USER_INFO @"/hypertensionPatient/restShow/"

@implementation ApiManager{
    
    NSString *sendTlfNumber,*sendCodeNumber,*getUserInfo;
    UIAlertView *alert;
}

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
        
        [self initURLs];
        _manager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

-(void)initURLs{
    sendTlfNumber =  [NSString stringWithFormat:@"%@%@",URL_BASE,SEND_TLF_URL];
    sendCodeNumber = [NSString stringWithFormat:@"%@%@",URL_BASE,SEND_CODE_URL];
    getUserInfo = [NSString stringWithFormat:@"%@%@",URL_BASE,GET_USER_INFO];
}

#pragma mark WebService calls

-(void)sendTlfToSHUITE:(NSString *)telephone prefix:(NSString *)prefix withCompletionBlock:(CompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@",sendTlfNumber,prefix,telephone];
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([[responseObject valueForKeyPath:@"status.cod"] isEqualToString:@"200"]) {
            completionBlock(nil, [responseObject valueForKey:@"content"]);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:[[responseObject valueForKeyPath:@"status.cod"] integerValue] userInfo:nil], nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completionBlock(error, nil);
    }];

}

-(void)sendCodeToSHUITE:(NSString *)code telephone: (NSString*)tlf prefix:(NSString*)prefix withCompletionBlock:(CompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@?code=%@",sendCodeNumber,prefix,tlf,code];
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject objectForKey:@"uuid"]!=nil) {
            completionBlock(nil, responseObject);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:[[responseObject valueForKeyPath:@"status.cod"] integerValue] userInfo:nil], nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completionBlock(error, nil);
    }];

}

-(void)getUserInfo:(NSString *)UUID withCompletionBlock:(CompletionBlock)completionBlock
    
    NSString *url = [NSString stringWithFormat:@"%@%@",getUserInfo,UUID];
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject objectForKey:@"patient"]!=nil) {
                       completionBlock(nil, responseObject);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:[[responseObject valueForKeyPath:@"status.cod"] integerValue] userInfo:nil], nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completionBlock(error, nil);
    }];

    
}

-(void)customDialogConnectionError{
   
    if(alert == nil){
        alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"NoConnection",nil)
                                                        message:NSLocalizedString(@"ConnectionProblems",nil)
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                 otherButtonTitles:nil];

    }
    
    [alert show];
   }




@end
