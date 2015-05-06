//
//  TelephoneViewController.h
//  BPcontrol
//
//  Created by Adrian on 7/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TelephoneViewController : UINavigationController
@property (weak, nonatomic) IBOutlet UILabel *enterTelepohoneDescription;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *prefix;
@property (weak, nonatomic) IBOutlet UIButton *buttonToCode;

- (IBAction)buttonToCode:(id)sender;

@end
