//
//  PageViewController.swift
//  Project_NoA
//
//  Created by かーくん on 2018/10/26.
//  Copyright © 2018 加藤景也. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func getFirst() -> FirstView {
        return storyboard!.instantiateViewController(withIdentifier: "First") as!FirstView
    }
    func getSecond() -> SecondView {
        return storyboard!.instantiateViewController(withIdentifier: "Second") as! SecondView
    }
    func getThird() -> ThirdView {
        return storyboard!.instantiateViewController(withIdentifier: "Third") as!ThirdView
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ThirdView.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondView.self) {
            // 2 -> 1
            return getFirst()
        }else{
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FirstView.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondView.self) {
            // 2 -> 3
            return getThird()
        }else{
            // 3 -> end of the road
            return nil
        }
    }
}
