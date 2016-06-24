//
//  CustomTabBarController.swift
//  CustomTabBar
//
//  Created by 叶一帆 on 16/6/24.
//  Copyright © 2016年 叶一帆. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController,CustomTabBarDelegate {
    
    var myView:CustomTabBar?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI(){
        // 移除视同自带的tabbar
        self.tabBar.removeFromSuperview()
        // 初始化自定义的tabbar
        self.myView = CustomTabBar()
        self.myView!.frame = CGRect(x: 0.0, y: UIScreen.mainScreen().bounds.size.height - self.tabBar.bounds.size.height, width: UIScreen.mainScreen().bounds.size.width, height: self.tabBar.bounds.size.height)
        // 添加到当前view上
        self.view.addSubview(self.myView!)
        // 设置代理
        self.myView!.delegate = self
        self.tabBarController?.tabBar.delegate = self
    // 根据图片按照顺序添加按钮
        self.addButtons()
    // 添加对应的controller
        self.addViewControllers()
     }
    
    func addViewControllers() {
        let vcNames:Array<String> = ["MainViewController","ClassifyViewController","DynamicViewController","MeViewController"]
        let vcTitles = ["首页","分类","动态","我"]
        var navs:[UINavigationController] = []
        for i in 0..<vcNames.count {
            let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
            let vcClass:AnyClass = NSClassFromString(nameSpace + "." + vcNames[i])!
            let vc = (vcClass as! UIViewController.Type).init()
            vc.title = vcTitles[i]
            
            // 设置背景色为随机颜色
            vc.view.backgroundColor = UIColor(red: CGFloat (arc4random()) % 256 / 255.0, green: CGFloat (arc4random()) % 256 / 255.0, blue: CGFloat (arc4random()) % 256 / 255.0, alpha: 1)
            
            let nav:UINavigationController = UINavigationController(rootViewController: vc)
            navs.append(nav)
        }
        self.viewControllers = navs
}
    
    
    func addButtons() {
        // 正常状态下的图片
        let normalImgs:Array<String> = ["home_gray","find_gray","message_gray","me_gray"];
        // 选中状态下的图片
        let selectedImages = ["home_black","find_black","message_black","me_black"];
        for i in 0..<normalImgs.count {
            self.myView!.addButton(UIImage(named: normalImgs[i])!, selectedImg: UIImage(named: selectedImages[i])!)
        }
    }
    
    
    
    func selectedCustomtabBar(tabbar:CustomTabBar,from:NSInteger,to:NSInteger){
        self.selectedIndex = to
    }
    
    func hiddenTabbar(){
        UIView.animateWithDuration(1) {
            self.myView!.frame = CGRect(x: 0.0, y: UIScreen.mainScreen().bounds.size.height, width: UIScreen.mainScreen().bounds.size.width, height: self.tabBar.bounds.size.height)
        }
    }
    
    func showTabBar(){
        UIView.animateWithDuration(1) {
            self.myView!.frame = CGRect(x: 0.0, y: UIScreen.mainScreen().bounds.size.height - self.tabBar.bounds.size.height, width: UIScreen.mainScreen().bounds.size.width, height: self.tabBar.bounds.size.height)
        }
    }
    

}
