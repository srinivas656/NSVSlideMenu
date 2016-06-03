# NSVSlideMenu
NSVSlideMenu is a Slide Menu with beautiful animation , Configure with Profile Presentation

**Integration In your Project**

Just Drag & Drop NSVSSlideMenu into your project 

**Declaration**

 NSVSlideMenu *nsvSlidemenu ;
 
**Implementation** 

 nsvSlidemenu = [[NSVSlideMenu alloc] initWithId:self];
    nsvSlidemenu.delegate = self ;
    [nsvSlidemenu setProfileImage:[UIImage imageNamed:@"profile"]];
    [nsvSlidemenu setprofileName:@"srinivas"];
    [nsvSlidemenu setprofileMobile:@"040-388339"];
    [nsvSlidemenu setprofilePosition:@"Sr.Sfotware Engineer"];
    [nsvSlidemenu setprofileElements:[NSMutableArray arrayWithObjects:@"About",@"Pictures",@"Others",@"LogOut", nil]andWithDisplayKey:nil];
    [self.navigationController.view addSubview:nsvSlidemenu];

**Delegate**
-(void)didSelecteProfileElements:(id)Element andIndex:(int)indx{
}

**MenuPresetation Method**

-(void)showMenu ;

-(void)closeMenu ;




