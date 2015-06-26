//
//  VideoCell.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface VideoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet YTPlayerView *youtubePlayer;

-(void)playVideoWithId:(NSString*)videoId;
@end
