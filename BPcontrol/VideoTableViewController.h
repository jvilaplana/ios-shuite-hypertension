//
//  VideoTableViewController.h
//  BPcontrol
//
//  Created by Adrian on 25/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *revealButton;
@property (strong, nonatomic) NSMutableArray *videosArray;

@end
