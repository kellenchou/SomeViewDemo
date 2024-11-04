//
// MainViewController.swift
// SomeViewDemo
//
// Created by KellenChou on 2024/11/2
// Copyright © 2024 ZKL. All rights reserved.
//
    

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var leftToolBar: LeftToolBar = {
        let leftBar = LeftToolBar.init()
        return leftBar
    }()
    
    lazy var rightToolView: RightToolView = {
        let rightView = RightToolView.init()
        return rightView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        setupAction()
        
        print("=======top======")
        print(UIDevice.vg_safeDistanceTop())
        print("=======botom======")
        print(UIDevice.vg_safeDistanceBottom())
        print("=======left======")
        print(UIDevice.vg_safeDistanceLeft())
        print("=======right======")
        print(UIDevice.vg_safeDistanceRight())
    }
    
    func setupAction() {
        leftToolBar.btnClickClosure = { btnType in
            switch btnType {
            case .LeftToolBarBtnTypeSetting :
                    print("setting")
                
            case .LeftToolBarBtnTypeShow :
                    print("show")
            }
        }
        
        leftToolBar.btnClickClosure2 = { btnType in
            switch btnType {
            case .LeftToolBarBtnTypeSetting1 :
                    print("setting1")
                
            case .LeftToolBarBtnTypeSetting2 :
                    print("setting2")
                
            case .LeftToolBarBtnTypeSetting3 :
                    print("setting3")
                
            case .LeftToolBarBtnTypeSetting4 :
                    print("setting4")
                
            case .LeftToolBarBtnTypeSetting5 :
                    print("setting5")
            }
        }
        
        rightToolView.btnClickClosure = { btnType in
            switch btnType {
            case .RightToolViewBtnType1 :
                    print("right1")
                    print(kScreenWidth)
                
            case .RightToolViewBtnType2 :
                    print("right2")
                
            case .RightToolViewBtnType3 :
                    print("right3")
                
            case .RightToolViewBtnType4 :
                    print("right4")
                
            case .RightToolViewBtnType5 :
                    print("right5")
            }
        }
    }
    
    func setupUI() {
        self.view.backgroundColor = .green
        
        self.view.addSubview(leftToolBar)
        leftToolBar.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.top.bottom.equalTo(self.view)
            make.left.equalTo(self.view.snp.left).offset(UIDevice.vg_safeDistanceLeft())
        }
        
        self.view.addSubview(rightToolView)
        rightToolView.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.top.bottom.equalTo(self.view)
            make.right.equalTo(self.view.snp.right).offset(-UIDevice.vg_safeDistanceRight())
        }
    }

}
