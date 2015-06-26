//
//  VideoCell.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)playVideoWithId:(NSString*)videoId{
    [self.youtubePlayer loadWithVideoId:videoId];
}

@end
