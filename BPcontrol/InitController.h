//
//  InitController.h
//  BPcontrol
//
//  Created by Adrian Carrera on 3/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ViewController.h"

@interface InitController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *patientAccessButton;
@property (weak, nonatomic) IBOutlet UIImageView *images;


-(void)executeImageTask;


@end
