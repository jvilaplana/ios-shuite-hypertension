//
//  SendCodeController.h
//  BPcontrol
//
//  Created by Adrian Carrera on 10/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ViewController.h"


@interface SendCodeController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *sendCodeDescription;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *finishRegisterButton;
- (IBAction)sendCodeToSHUITE:(id)sender;


@end
