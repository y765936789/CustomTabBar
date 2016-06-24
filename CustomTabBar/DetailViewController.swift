//
//  DetailViewController.swift
//  CustomTabBar
//
//  Created by 叶一帆 on 16/6/24.
//  Copyright © 2016年 叶一帆. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "第二页"
        self.view.backgroundColor = UIColor.blueColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Cancel, target: self, action: #selector(self.back))
    }
    
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
        // 设置返回的转场动画
        let animation = CATransition()
        animation.type = "cube"
        animation.duration = 1
        animation.subtype = kCATransitionFromLeft
        self.navigationController?.view.layer.addAnimation(animation, forKey: nil)
        
        
        
    }

}
