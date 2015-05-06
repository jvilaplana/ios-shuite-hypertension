//
//  TelephoneViewController.m
//  BPcontrol
//
//  Created by Adrian on 7/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "TelephoneViewController.h"
#import "Resources.h"

@interface TelephoneViewController ()

@end

@implementation TelephoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"RegisterStep1", nil);
    self.enterTelepohoneDescription.text = NSLocalizedString(@"SendTlfRegister", nil);
    [self.buttonToCode setTintColor:[UIColor whiteColor]];
    [self.buttonToCode setBackgroundColor:ORANGEBUTTON];
    [self.buttonToCode setTitle:NSLocalizedString(@"PhonebuttonAccess", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonToCode:(id)sender {
}
@end
