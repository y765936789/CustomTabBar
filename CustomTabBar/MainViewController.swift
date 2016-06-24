//
//  MainViewController.swift
//  CustomTabBar
//
//  Created by 叶一帆 on 16/6/24.
//  Copyright © 2016年 叶一帆. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NextPage", style: .Plain, target: self, action: #selector(self.click))
    }
    
    func click() {
        let detail = DetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        app.myTabBarVC?.hiddenTabbar()
        
        // 设置转场动画
        let animation = CATransition()
        animation.type = "cube"
        animation.duration = 1
        animation.subtype = kCATransitionFromRight
        self.navigationController?.view.layer.addAnimation(animation, forKey: nil)
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        app.myTabBarVC?.showTabBar()
        
    }

}
