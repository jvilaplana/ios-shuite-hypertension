//
//  TabBarController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 1/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "TabBarController.h"
#import "Resources.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

   //[//[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
       ///                                                GRAYPROFILE, UITextAttributeTextColor,
                                                      // nil] forState:UIControlStateHighlighted];
    self.tabBar.selectedImageTintColor = GRAYPROFILE;
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
