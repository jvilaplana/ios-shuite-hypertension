//
//  TelephoneViewController.h
//  BPcontrol
//
//  Created by Adrian on 7/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVProgressHUD.h>

@interface TelephoneViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *enterTelepohoneDescription;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *prefixTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonToCode;

- (IBAction)buttonToCode:(id)sender;

@end
