//
//  MenuViewController.h
//  BPcontrol
//
//  Created by Adrian on 11/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWUITableViewCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel *label;

@end

@interface ProfileTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImage;

@end

@interface MenuViewController : UITableViewController<UITableViewDelegate>

@end
