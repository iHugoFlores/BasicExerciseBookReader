//
//  PageContentViewController.m
//  BookReaderObjC
//
//  Created by Field Employee on 3/27/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myLabel.text = _strTitle;
    _imgView.image = [UIImage imageNamed:_strPhotoName];
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
