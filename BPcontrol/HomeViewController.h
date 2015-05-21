//
//  HomeViewController.h
//  BPcontrol
//
//  Created by Adrian Carrera on 11/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *gridButtons;
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end
