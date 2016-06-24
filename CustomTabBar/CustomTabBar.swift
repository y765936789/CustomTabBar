//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by 叶一帆 on 16/6/24.
//  Copyright © 2016年 叶一帆. All rights reserved.
//

import UIKit
// 声明一个协议，传递给调用者-(void)selectedMyTabBar:(MyTabBar *)tabbar from:(NSInteger)from to:(NSInteger)to;

protocol CustomTabBarDelegate : NSObjectProtocol{
    func selectedCustomtabBar(tabbar:CustomTabBar,from:NSInteger,to:NSInteger)
}

class CustomTabBar: UIView {
    
    // 声明一个代理属性
    var delegate:CustomTabBarDelegate!
    // 记录当前点击的按钮
    var selectedBtn:UIButton!
    
    
    // 通过添加图片的方式来创建button-(void)addButtonWithImage:(UIImage *)image selectedImg:(UIImage *)selectedImg;
    func addButton(image:UIImage,selectedImg:UIImage) -> Void {
        // 创建button
        let button = UIButton(type:.Custom)
        
        button.setImage(image, forState: .Normal)
        button.setImage(selectedImg, forState: .Selected)
        
        
        // 设置点击事件
        button.addTarget(self, action: #selector(self.click(_:)), forControlEvents:.TouchUpInside)
        
        self.addSubview(button)
        if self.subviews.count == 1 {
            self.click(button)
        }
        
        
    }
    // 点击事件
    func click(button:UIButton) -> Void {
        button.selected = true
        if self.selectedBtn == nil {
            self.selectedBtn = button
            return
        }
        self.selectedBtn.selected = false
        if self.delegate != nil {
            self.delegate.selectedCustomtabBar(self, from: self.selectedBtn.tag, to: button.tag)
        }
        self.selectedBtn = button
    }
    
    // 要显示的时候调用
    override func layoutSubviews() {
        let count = self.subviews.count
        for i in 0..<count {
            let button = self.subviews[i]
            button.tag = i
            // 设置button的frame
            let width = self.bounds.size.width / CGFloat(count)
            let x = CGFloat(i) * width
            let y:CGFloat = 0
            let height = self.bounds.size.height
            button.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    self.backgroundColor = UIColor(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, alpha: 0.9)
    }

    
}
