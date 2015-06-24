//
//  ApiManager.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ApiManager.h"
#import "User.h"
#import "Pressure.h"
#import "User.h"

#pragma mark Singleton Methods

#define SEND_TLF_URL @"/hypertensionPatient/restValidateMobile/"
#define SEND_CODE_URL @"/hypertensionPatient/restValidateCode/"
#define GET_USER_INFO @"/hypertensionPatient/restShow/"
#define GET_USER_IMAGE @"/hypertensionPatient/restDownloadProfileImage/"
#define POST_MEASUREMENTS @"/hypertensionBloodPressure/restSave"
#define GET_PRESSURES @"/hypertensionBloodPressure/restList/"

@implementation ApiManager{
    
    NSString *sendTlfNumber,*sendCodeNumber,*getUserInfo,*getUserImage,*postPressures,*getPressures;
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
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

-(void)initURLs{
    sendTlfNumber =  [NSString stringWithFormat:@"%@%@",URL_BASE,SEND_TLF_URL];
    sendCodeNumber = [NSString stringWithFormat:@"%@%@",URL_BASE,SEND_CODE_URL];
    getUserInfo = [NSString stringWithFormat:@"%@%@",URL_BASE,GET_USER_INFO];
    getUserImage = [NSString stringWithFormat:@"%@%@",URL_BASE,GET_USER_IMAGE];
    postPressures = [NSString stringWithFormat:@"%@%@",URL_BASE,POST_MEASUREMENTS];
    getPressures = [NSString stringWithFormat:@"%@%@",URL_BASE,GET_PRESSURES];
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

-(void)getUserInfo:(NSString *)UUID withCompletionBlock:(CompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",getUserInfo,UUID];
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject objectForKey:@"patient"]!=nil) {
//            [[User sharedManager]bpm[[responseObject objectForKey:@"dbp"] integerValue]];
//            [[User sharedManager] setDianaSystolicIndex:[[responseObject objectForKey:@"sbp"] integerValue]];
            [[User sharedManager] setDianaSystolicIndex:[[responseObject objectForKey:@"sbp"] integerValue]];
            [[User sharedManager] setDianaDiastolicIndex:[[responseObject objectForKey:@"dbp"] integerValue]];
            completionBlock(nil, responseObject);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:[[responseObject valueForKeyPath:@"status.cod"] integerValue] userInfo:nil], nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completionBlock(error, nil);
    }];

    
}

-(void) getUserImage:(NSString *)UUID withCompletionBlock:(CompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",getUserImage,UUID];
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject!=nil) {
            completionBlock(nil, responseObject);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:500 userInfo:nil], nil);
        }

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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

-(void) postPressuresToSHUITEWhitMorning:(NSArray*)morning withAfternoon:(NSArray*)afternoon withCompletionBlock:(CompletionBlock) completionBlock{
    
    Pressure* mfirst = [morning objectAtIndex:0];
    Pressure* msecond = [morning objectAtIndex:1];
    Pressure* mthird = [morning objectAtIndex:2];
    
    Pressure* afirst = [afternoon objectAtIndex:0];
    Pressure* asecond = [afternoon objectAtIndex:1];
    Pressure* athird = [afternoon objectAtIndex:2];
    
    NSString *UUID = [[User sharedManager] UUID];
    
    NSDictionary *params = @{@"systole1m": [NSString stringWithFormat:@"%i",(int)[mfirst systolic]] ,
                             @"systole2m":[NSString stringWithFormat:@"%i",(int)[msecond systolic]],
                             @"systole3m":[NSString stringWithFormat:@"%i",(int)[mthird systolic]],
                             @"diastole1m": [NSString stringWithFormat:@"%i",(int)[mfirst diastolic]] ,
                             @"diastole2m":[NSString stringWithFormat:@"%i",(int)[msecond diastolic]],
                             @"diastole3m":[NSString stringWithFormat:@"%i",(int)[mthird diastolic]],
                             @"pulse1m": [NSString stringWithFormat:@"%i",(int)[mfirst pulse]],
                             @"pulse2m":[NSString stringWithFormat:@"%i",(int)[msecond pulse]],
                             @"pulse3m":[NSString stringWithFormat:@"%i",(int)[mthird pulse]],
                             @"systole1n": [NSString stringWithFormat:@"%i",(int)[afirst systolic]] ,
                             @"systole2n":[NSString stringWithFormat:@"%i",(int)[asecond systolic]],
                             @"systole3n":[NSString stringWithFormat:@"%i",(int)[athird systolic]],
                             @"diastole1n": [NSString stringWithFormat:@"%i",(int)[afirst diastolic]] ,
                             @"diastole2n":[NSString stringWithFormat:@"%i",(int)[asecond diastolic]],
                             @"diastole3n":[NSString stringWithFormat:@"%i",(int)[athird diastolic]],
                             @"pulse1n": [NSString stringWithFormat:@"%i",(int)[afirst pulse]],
                             @"pulse2n":[NSString stringWithFormat:@"%i",(int)[asecond pulse]],
                             @"pulse3n":[NSString stringWithFormat:@"%i",(int)[athird pulse]],
                             @"uuid":UUID};

    
     _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:postPressures parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject!=nil) {
            completionBlock(nil, responseObject);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:404 userInfo:nil], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       completionBlock(error, nil);
    }];
    
}

-(void) getUserPressures:(NSString *)UUID withCompletionBlock:(CompletionBlock)completionBlock{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",getPressures,UUID];

    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject!=nil) {
            completionBlock(nil, [self parsePressures:(NSDictionary*)responseObject]);
        }else{
            completionBlock([NSError errorWithDomain:ERROR_DOMAIN code:404 userInfo:nil], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(error, nil);
    }];

}

-(NSMutableArray*) parsePressures:(NSDictionary*)dictionary{
    
    NSMutableArray *arrayPressures = [[NSMutableArray alloc] init];
    Pressure *p;
    for(id tmp in dictionary){
        p = [[Pressure alloc] init];
        [p setSystolic:[[tmp objectForKey:@"systole"] integerValue]];
        [p setDiastolic:[[tmp objectForKey:@"diastole"] integerValue]];
        if ([tmp objectForKey:@"pulse"] != [NSNull null]) {
            [p setPulse:[[tmp objectForKey:@"pulse"] integerValue]];

        }
        [p setDate:[self convertWSdateToNormalDate:[tmp objectForKey:@"dateTaken"]]];
        [self calculateDianaLimit:p];
        [arrayPressures addObject:p];
    }
    return arrayPressures;
}

-(NSString*)convertWSdateToNormalDate:(NSString*)dateToken{
    
    NSArray *chunks = [dateToken componentsSeparatedByString: @"T"];
    NSArray * dateParts = [[chunks objectAtIndex:0] componentsSeparatedByString:@"-"];
    
    return [NSString stringWithFormat:@"%@-%@-%@",
            [dateParts objectAtIndex:2],[dateParts objectAtIndex:1],[dateParts objectAtIndex:0]];
}

-(void)calculateDianaLimit:(Pressure*)pressures{
    
    
    int systolic,diastolic,status;
    
    if ((int)[pressures systolic] == 0){
        systolic = 120;
    }else{
        systolic=(int)[pressures systolic];
    }
    
    if ((int)[pressures diastolic] == 0){
        diastolic = 80;
    }else{
        diastolic=(int)[pressures diastolic];
    }
    if (systolic>(int)[[User sharedManager] dianaSystolicIndex] || diastolic > (int)[[User sharedManager] dianaDiastolicIndex]){
        status = 2;
    }else if (((int)[[User sharedManager] dianaSystolicIndex]-systolic)<=5 ||
              ((int)[[User sharedManager] dianaDiastolicIndex]-diastolic) <=5 ){
        status = 1;
    }else{
        status = 0;
    }
    
    [pressures setSemaphore:status];
    
}




@end
