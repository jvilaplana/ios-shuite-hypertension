//
//  HistoryPressuresTableController.h
//  BPcontrol
//
//  Created by Adrian on 19/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryPressuresTableController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;
@property (strong, nonatomic) NSMutableArray *array;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;

@property (strong, nonatomic) IBOutlet UILabel *headerSemaphore;
@property (strong, nonatomic) IBOutlet UILabel *headerSystolic;
@property (strong, nonatomic) IBOutlet UILabel *headerDiastolic;
@property (strong, nonatomic) IBOutlet UILabel *headerPulse;




@end
