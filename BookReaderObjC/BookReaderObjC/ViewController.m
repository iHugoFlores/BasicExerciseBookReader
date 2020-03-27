//
//  ViewController.m
//  BookReaderObjC
//
//  Created by Field Employee on 3/27/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController () <UIPageViewControllerDataSource>
@property NSArray *arrPageTitle;
@property NSArray *arrPagePhoto;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _arrPageTitle = @[@"This is The App", @"This is a View", @"This is a second view"];
    _arrPagePhoto = @[@"voight", @"apple", @"Cyberia"];
    
    self.dataSource = self;

    [self setViewControllers:@[[self getViewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:false completion:nil];

}

- (PageContentViewController *) getViewControllerAtIndex:(NSInteger)index {
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];

    pageContentViewController.strTitle = _arrPageTitle[index];
    pageContentViewController.strPhotoName = [NSString stringWithFormat:@"%@", _arrPagePhoto[index]];
    pageContentViewController.pageIndex = (int) index;
    printf("Title = %s\n", [pageContentViewController.strTitle UTF8String]);
    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    PageContentViewController *pageContent = (PageContentViewController *)viewController;
    int index = pageContent.pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index += 1;
    if (index == _arrPageTitle.count){
        return nil;
    }
    
    return [self getViewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    PageContentViewController *pageContent = (PageContentViewController *)viewController;
    int index = pageContent.pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index -= 1;
    
    return [self getViewControllerAtIndex:index];
}

@end
