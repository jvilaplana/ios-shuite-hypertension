//
//  CentersViewController.m
//  BPcontrol
//
//  Created by Adrian on 4/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "CentersViewController.h"
#import "Resources.h"

@interface CentersViewController ()

@end

@implementation CentersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UINavigationBar appearance] setBarTintColor:GRAYBP];
        self.navigationBar.topItem.title = @"title text";
    // Do any additional setup after loading the view.
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
