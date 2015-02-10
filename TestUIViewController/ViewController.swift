//
//  ViewController.swift
//  TestUIViewController
//
//  Created by Yan Xia on 2/9/15.
//  Copyright (c) 2015 yxia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    private var pageController:UIPageViewController!
//    private var currentPageIndex: Int = 0
    private var viewControllers = NSMutableArray()
    private let contentImages = ["666-0.png","666-1.png","666-2.png","666-3.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        pageController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        pageController.delegate = self
        pageController.dataSource = self
        

        for index in 0...3{
            let pageContentController = storyboard?.instantiateViewControllerWithIdentifier("PageContentController") as PageContentController
            viewControllers.addObject(pageContentController)
            pageContentController.index = index
            pageContentController.imageName = contentImages[index]
        }
        
        pageController.setViewControllers([viewControllers.objectAtIndex(0)], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        
//        currentPageIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageContentController = viewController as PageContentController
        if pageContentController.index > 0 {
            return viewControllers[pageContentController.index-1] as? UIViewController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageContentController = viewController as PageContentController
        if pageContentController.index < 3 {
            return viewControllers[pageContentController.index+1] as? UIViewController
        }
        return nil
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

