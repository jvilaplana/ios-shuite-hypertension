//
//  PressuresViewController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "PressuresViewController.h"
#import "Resources.h"

@interface PressuresViewController ()

@end

@implementation PressuresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresTitle", nil);
    
    self.headerPressures.text = NSLocalizedString(@"Pressuresmsg", nil);
    self.headerPressures.textColor = MENUTEXT;
    self.morningHeader.textColor = MENUTEXT;
    self.morningHeader.text = NSLocalizedString(@"Pressuressfirsttimetext", nil);
    
    [self configureView];
    

}

-(void) configureView{
    
    [self changeButtomStyle];
    
}

-(void) changeButtomStyle{

    [self addStyleToButton:self.saveButton];
    [self addStyleToButton:self.sendButton];
    
}

-(void) addStyleToButton:(UIButton*) button{
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:ORANGEBUTTON];
    [button setTitle:NSLocalizedString(@"PhonebuttonAccess", nil) forState:UIControlStateNormal];
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

@end
