//
//  NSVSlideMenu.h
//  NSVSlidMenu
//
//  Created by srinivas on 6/2/16.
//  Copyright © 2016 Microexcel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NSVMenuDelegate <NSObject>

-(void)didSelecteProfileElements:(id)Element andIndex:(int)indx;

@end

@interface NSVSlideMenu : UIView
@property (nonatomic,weak)id <NSVMenuDelegate>delegate ;
- (id)initWithId:(UIViewController *)vController ;
-(void)setProfileImage:(UIImage *)profileImage ;
-(void)setprofileName:(NSString *)proName ;
-(void)setprofileMobile:(NSString *)proMobile ;
-(void)setprofilePosition:(NSString *)proPosition ;
-(void)setprofileElements:(NSMutableArray *)proElements andWithDisplayKey:(NSString *)displayElement ;





-(void)showMenu ;
@end
