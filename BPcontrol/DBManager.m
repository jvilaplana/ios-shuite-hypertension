//
//  DBManager.m
//  BPcontrol
//
//  Created by Adrian Carrera on 18/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "DBManager.h"

static DBManager *sharedInstance = nil;
static sqlite3 *BPdatabase = nil;
static NSString* path = @"";

@interface DBManager()

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;

@end

@implementation DBManager

+(NSString*) copyDatabaseIfNeeded {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath = [self getDBPath];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if(!success) {
      NSString* databasePath  = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"db.sqlite"];
      success = [fileManager copyItemAtPath:databasePath toPath:dbPath error:&error];
      if (!success)
          NSAssert1(0, @"Failed to create writable database", [error localizedDescription]);
        return databasePath;
    }
    
    return dbPath;
}

+ (NSString *) getDBPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"db.sqlite"];
}

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        path = [DBManager copyDatabaseIfNeeded];
        [sharedInstance initWithDatabase];
    }
    return sharedInstance;
}

-(void)initWithDatabase{
    
    if (sqlite3_open([path UTF8String] , &BPdatabase) == SQLITE_OK){
        char *errMsg;
        const char *sql_stmt = "CREATE TABLE IF NOT EXISTS  youtubeVideo(id INTEGER PRIMARY KEY, useruuid TEXT, link TEXT, description TEXT)";
                
        if (sqlite3_exec(BPdatabase, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
            NSLog(@"Error initializating db");
        }
            
        sqlite3_close(BPdatabase);
        }
}


-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable{

    
//        NSString *databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
//        
//        // Initialize the results array.
//        if (self.arrResults != nil) {
//            [self.arrResults removeAllObjects];
//            self.arrResults = nil;
//        }
//        self.arrResults = [[NSMutableArray alloc] init];
//        
//        // Initialize the column names array.
//        if (self.arrColumnNames != nil) {
//            [self.arrColumnNames removeAllObjects];
//            self.arrColumnNames = nil;
//        }
//        self.arrColumnNames = [[NSMutableArray alloc] init];
//        
//        
//        // Open the database.
//        BOOL openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
//        if(openDatabaseResult == SQLITE_OK) {
//            // Declare a sqlite3_stmt object in which will be stored the query after having been compiled into a SQLite statement.
//            sqlite3_stmt *compiledStatement;
//            
//            // Load all data from database to memory.
//            BOOL prepareStatementResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL);
//            if(prepareStatementResult == SQLITE_OK) {
//                // Check if the query is non-executable.
//                if (!queryExecutable){
//                    // In this case data must be loaded from the database.
//                    
//                    // Declare an array to keep the data for each fetched row.
//                    NSMutableArray *arrDataRow;
//                    
//                    // Loop through the results and add them to the results array row by row.
//                    while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
//                        // Initialize the mutable array that will contain the data of a fetched row.
//                        arrDataRow = [[NSMutableArray alloc] init];
//                        
//                        // Get the total number of columns.
//                        int totalColumns = sqlite3_column_count(compiledStatement);
//                        
//                        // Go through all columns and fetch each column data.
//                        for (int i=0; i<totalColumns; i++){
//                            // Convert the column data to text (characters).
//                            char *dbDataAsChars = (char *)sqlite3_column_text(compiledStatement, i);
//                            
//                            // If there are contents in the currenct column (field) then add them to the current row array.
//                            if (dbDataAsChars != NULL) {
//                                // Convert the characters to string.
//                                [arrDataRow addObject:[NSString  stringWithUTF8String:dbDataAsChars]];
//                            }
//                            
//                            // Keep the current column name.
//                            if (self.arrColumnNames.count != totalColumns) {
//                                dbDataAsChars = (char *)sqlite3_column_name(compiledStatement, i);
//                                [self.arrColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
//                            }
//                        }
//                        
//                        // Store each fetched data row in the results array, but first check if there is actually data.
//                        if (arrDataRow.count > 0) {
//                            [self.arrResults addObject:arrDataRow];
//                        }
//                    }
//                }
//                else {
//                    // This is the case of an executable query (insert, update, ...).
//                    
//                    // Execute the query.
//                    BOOL executeQueryResults = sqlite3_step(compiledStatement);
//                    if (executeQueryResults == SQLITE_DONE) {
//                        // Keep the affected rows.
//                        self.affectedRows = sqlite3_changes(sqlite3Database);
//                        
//                        // Keep the last inserted row ID.
//                        self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
//                    }
//                    else {
//                        // If could not execute the query show the error message on the debugger.
//                        NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
//                    }
//                }
//            }
//            else {
//                // In the database cannot be opened then show the error message on the debugger.
//                NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
//            }
//            
//            // Release the compiled statement from memory.
//            sqlite3_finalize(compiledStatement);
//            
//        }
//        
//        // Close the database.
//        sqlite3_close(sqlite3Database);
}

-(NSArray *)loadDataFromDB:(NSString *)query{

    [self runQuery:[query UTF8String] isQueryExecutable:NO];
    
    return (NSArray *)self.arrResults;
}

-(void)executeQuery:(NSString *)query{
    
    if (sqlite3_open([path UTF8String], &BPdatabase) == SQLITE_OK){
        char *errMsg;
        const char *sql_stmt = [query UTF8String];
        
        if (sqlite3_exec(BPdatabase, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
            NSLog(@"Error executing query");
        }

        sqlite3_close(BPdatabase);
        
    }

}

@end
