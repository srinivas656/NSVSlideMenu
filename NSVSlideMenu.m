//
//  NSVSlideMenu.m
//  NSVSlidMenu
//
//  Created by srinivas on 6/2/16.
//  Copyright © 2016 Microexcel. All rights reserved.
//

#import "NSVSlideMenu.h"

@interface NSVSlideMenu ()<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *profileImageView ;
    UILabel *profileName ;
    UILabel *profileMobile ;
    UILabel *profilePosition ;
    NSMutableArray *_profileElements ;
    NSString *_displayElement ;
}@end

@implementation NSVSlideMenu

+(UIColor *)applicationGreenColor{
    
    return  [UIColor colorWithRed:122.0 / 255.0
                            green:201.0 / 255.0
                             blue:67.0 / 255.0
                            alpha:1.0];
}

+(UIColor *)applicationBlueColor{
    
    return  [UIColor colorWithRed:5.0 / 255.0
                            green:177.0 / 255.0
                             blue:186.0 / 255.0
                            alpha:1.0];
}

+(UIColor *)applicationDarkGrayColor{
    
    return  [UIColor colorWithRed:77.0 / 255.0
                            green:77.0 / 255.0
                             blue:77.0 / 255.0
                            alpha:1.0];
}

+(UIColor *)applicationlightGrayColor{
    
    return  [UIColor colorWithRed:220.0 / 255.0
                            green:220.0 / 255.0
                             blue:220.0 / 255.0
                            alpha:1.0];
}
+(void)circleImageView:(UIImageView *)img {
    img.layer.cornerRadius = img.frame.size.height/2 ;
    img.layer.borderColor =  [UIColor whiteColor].CGColor;
    img.layer.borderWidth = 2 ;
    img.layer.masksToBounds = YES ;
}

- (id)initWithId:(UIViewController *)vController
{
    self = [super initWithFrame:CGRectMake(-250,0,200,vController.view.bounds.size.height
                                           )];
    if (self) {
        [self createView:self.frame];
    }
    return self;
}

-(void)createView:(CGRect)frame{
    
   // ProfileView
    self.backgroundColor = [UIColor clearColor];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width,64)];
    [self addSubview:navBar];
    
    UIView *profileView = [[UIView alloc] initWithFrame:CGRectMake(0,navBar.frame.origin.y+navBar.frame.size.height,frame.size.width,200)];
    profileView.backgroundColor = [NSVSlideMenu applicationBlueColor];;
    
    // Profile Image
    profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(profileView.bounds.size.width/2-50,20,100,100)];
    [NSVSlideMenu circleImageView:profileImageView];
    profileImageView.backgroundColor = [NSVSlideMenu applicationGreenColor];
    
    profileName = [[UILabel alloc] initWithFrame:CGRectMake(10,profileImageView.bounds.origin.y+profileImageView.bounds.size.height+20,profileView.bounds.size.width-20,21)];
    profileName.backgroundColor = [UIColor clearColor];
    profileName.font = [UIFont boldSystemFontOfSize:18.0f];
    profileName.textColor = [UIColor whiteColor];
    
    
    profileMobile = [[UILabel alloc] initWithFrame:CGRectMake(10,profileName.frame.origin.y+profileName.frame.size.height+5,profileView.frame.size.width-20,21)];
    profileMobile.backgroundColor = [UIColor clearColor];
    profileMobile.font = [UIFont systemFontOfSize:16.0f];
    profileMobile.textColor = [NSVSlideMenu applicationDarkGrayColor];
    
    profilePosition = [[UILabel alloc] initWithFrame:CGRectMake(10,profileMobile.frame.origin.y+profileMobile.frame.size.height+5,profileMobile.frame.size.width-20,21)];
    profilePosition.backgroundColor = [UIColor clearColor];
    profilePosition.font = [UIFont systemFontOfSize:16.0f];
    profilePosition.textColor = [NSVSlideMenu applicationDarkGrayColor];
    
    profileName.textAlignment = NSTextAlignmentCenter ;
    profileMobile.textAlignment = NSTextAlignmentCenter ;
    profilePosition.textAlignment = NSTextAlignmentCenter ;

    [profileView addSubview:profileImageView];
    [profileView addSubview:profileName];
    [profileView addSubview:profileMobile];
    [profileView addSubview:profilePosition];
    [self addSubview:profileView];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:CGRectMake(0,profileView.frame.origin.y+profileView.frame.size.height,frame.size.width,frame.size.height-profileView.frame.origin.y+profileView.frame.size.height)];
    tbView.delegate = self ;
    tbView.dataSource = self ;
    [self addSubview:tbView];
    

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(closeMenu)];
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Profile"];
    navigItem.rightBarButtonItem = item;
    navBar.items = [NSArray arrayWithObjects:navigItem,nil];
    
    
}
-(void)setProfileImage:(UIImage *)profileImage{
    profileImageView.image = profileImage ;
}
-(void)setprofileName:(NSString *)proName{
    profileName.text = proName ;
}
-(void)setprofileMobile:(NSString *)proMobile{
    profileMobile.text = proMobile ;
}
-(void)setprofilePosition:(NSString *)proPosition{
    profilePosition.text = proPosition ;
}
-(void)setprofileElements:(NSMutableArray *)proElements andWithDisplayKey:(NSString *)displayElement{
    _profileElements = proElements ; _displayElement = displayElement ;
}
-(void)showMenu{
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.frame = CGRectMake(0,0,200,self.bounds.size.height);
                         self.layer.shadowColor = [[UIColor blackColor] CGColor];
                         self.layer.shadowOffset = CGSizeMake(0.0f,0.0f);
                         self.layer.shadowOpacity = 0.7f;
                         self.layer.shadowRadius = 4.0f;
                         CGRect shadowRect = CGRectInset(self.bounds, 0, 4);  // inset top/bottom
                         self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:shadowRect] CGPath];
                     }
                     completion:nil];
}

-(void)closeMenu{
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.frame = CGRectMake(0,0,-250,self.bounds.size.height);
                     }
                     completion:nil];
}


#pragma mark - UITableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _profileElements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        cell.textLabel.textColor = [NSVSlideMenu applicationDarkGrayColor];
    }
    id data = [_profileElements objectAtIndex:indexPath.row];
    
    if ([data isKindOfClass:[NSString class]]) {
        cell.textLabel.text = data ;
    }else if ([data isKindOfClass:[NSDictionary class]]){
        cell.textLabel.text = [data valueForKey:_displayElement];
    }else{
        cell.textLabel.text = @"set display key";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    return cell;
}

#pragma mark - UITableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didSelecteProfileElements:[_profileElements objectAtIndex:indexPath.row] andIndex:indexPath.row];
}


@end
