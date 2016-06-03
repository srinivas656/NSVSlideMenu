//
//  ViewController.m
//  NSVSlideMenu
//
//  Created by srinivas on 6/2/16.
//  Copyright © 2016 Microexcel. All rights reserved.
//

#import "ViewController.h"
#import "NSVSlideMenu.h"

@interface ViewController ()<NSVMenuDelegate>{
    NSVSlideMenu *nsvSlidemenu ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"NSVSlideMenu";
    
     nsvSlidemenu = [[NSVSlideMenu alloc] initWithId:self];
    nsvSlidemenu.delegate = self ;
    [nsvSlidemenu setProfileImage:[UIImage imageNamed:@"profile"]];
    [nsvSlidemenu setprofileName:@"srinivas"];
    [nsvSlidemenu setprofileMobile:@"040-388339"];
    [nsvSlidemenu setprofilePosition:@"Sr.Sfotware Engineer"];
    [nsvSlidemenu setprofileElements:[NSMutableArray arrayWithObjects:@"About",@"Pictures",@"Others",@"LogOut", nil]andWithDisplayKey:nil];
    [self.navigationController.view addSubview:nsvSlidemenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)menuButtonTouched:(id)sender{
    [nsvSlidemenu showMenu];
}

-(void)didSelecteProfileElements:(id)Element andIndex:(int)indx{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Profile" message:[NSString stringWithFormat:@"Selected Item :%@ \n Selected Index :%d",Element,indx] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

@end
