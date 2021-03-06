//
//  DBManager.h
//  BPcontrol
//
//  Created by Adrian Carrera on 18/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(void)initWithDatabase;
+(DBManager*)getSharedInstance;
-(NSArray *)loadDataFromDB:(NSString *)query;
-(NSMutableArray*)getAllVideos:(NSString *)query;
-(void)executeQuery:(NSString *)query;

@end