//
//  ViewController.swift
//  UIPageViewControllerDemo
//
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource
{
    var arrPageTitle: NSArray = NSArray()
    var arrPagePhoto: NSArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["This is The App", "This is Second", "This is Third"];
        arrPagePhoto = ["apple.png", "Swift.png", "objc.png"];
        
        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }

// MARK:- UIPageViewControllerDataSource Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        
        index-=1;
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound){
            return nil;
        }
        
        index+=1;
        if (index == arrPageTitle.count){
            return nil;
        }
        return getViewControllerAtIndex(index: index)
    }

// MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController

        pageContentViewController.strTitle = "\(arrPageTitle[index])"
        pageContentViewController.strPhotoName = "\(arrPagePhoto[index])"
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
}

