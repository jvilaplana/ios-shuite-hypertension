//
//  InitController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 3/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "InitController.h"

@interface InitController ()

@end

@implementation InitController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //do something like background color, title, etc you self
    NSLog(@"Paso po aqui");
    //navbar.backgroundColor = [UIColor greenColor];
    //[self.view addSubview:navbar];
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
