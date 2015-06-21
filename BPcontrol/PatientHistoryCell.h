//
//  PatientHistoryCell.h
//  BPcontrol
//
//  Created by Adrian Carrera on 21/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientHistoryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *semaphore;
@property (strong, nonatomic) IBOutlet UILabel *systolicPressure;
@property (strong, nonatomic) IBOutlet UILabel *diastolicPressure;
@property (strong, nonatomic) IBOutlet UILabel *pulse;


@end
