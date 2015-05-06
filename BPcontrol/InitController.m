//
//  InitController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 3/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "InitController.h"
#import "Resources.h"

@interface InitController (){
    NSArray *myImages;
    NSTimer  *updateBCK;
}
@end

@implementation InitController

- (void)viewDidLoad {
    
    [self executeImageTask];
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"logo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imgView setImage:img];

    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    self.navigationController.navigationBar.backgroundColor = GRAYBP;
    
    [self.patientAccessButton setTintColor:[UIColor whiteColor]];
    [self.patientAccessButton setBackgroundColor:ORANGEBUTTON];
    [self.patientAccessButton setTitle:NSLocalizedString(@"ButtonAreaAccess", nil) forState:UIControlStateNormal];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)executeImageTask{
    
        
     myImages =[NSArray arrayWithObjects:@"arnau3.jpg",@"foto00.jpg",@"foto22.jpg",@"foto33.jpg",@"foto44.jpg",@"smaria3.jpg",nil];
        
      updateBCK = [NSTimer scheduledTimerWithTimeInterval:(10.0) target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
        
        
    [updateBCK fire];
    

}


-(void)changeImage{
    
    static int i=0;
    
    if (i == [myImages count]){
        i=0;
    }
    
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationDuration:0.6];
    [self.images setImage:[UIImage imageNamed:[myImages objectAtIndex:i]]];
    [UIImageView commitAnimations];
    i++;
    
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
