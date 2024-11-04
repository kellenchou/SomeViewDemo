//
// LeftToolBar.swift
// SomeViewDemo
//
// Created by KellenChou on 2024/11/2
// Copyright © 2024 ZKL. All rights reserved.
//
    

import UIKit

enum LeftToolBarBtnType: Int {
    case LeftToolBarBtnTypeSetting = 1
    case LeftToolBarBtnTypeShow
}

typealias LeftToolBarBtnClickClosure = (LeftToolBarBtnType) -> Void

enum LeftToolBarBtnType2: Int {
    case LeftToolBarBtnTypeSetting1 = 1
    case LeftToolBarBtnTypeSetting2
    case LeftToolBarBtnTypeSetting3
    case LeftToolBarBtnTypeSetting4
    case LeftToolBarBtnTypeSetting5
}

typealias LeftToolBarBtnClickClosure2 = (LeftToolBarBtnType2) -> Void

class LeftToolBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupUI()
        
        setupUI2()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    var btnClickClosure: LeftToolBarBtnClickClosure?
    var btnClickClosure2: LeftToolBarBtnClickClosure2?

    
    lazy var settingBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("设置", for: .normal)
        btn.backgroundColor = UIColor.randomColor
        btn.tag = LeftToolBarBtnType.LeftToolBarBtnTypeSetting.rawValue
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()
    
//    @objc func settingBtnClick(btn: UIButton) {
//        print("settingBtnClick")
//    }
    
    lazy var showBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("显示", for: .normal)
        btn.backgroundColor = UIColor.randomColor
        btn.tag = LeftToolBarBtnType.LeftToolBarBtnTypeShow.rawValue
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc func btnClick(sender: UIButton) {
        print("btnClick: \(sender.tag)")
        
        btnClickClosure?(LeftToolBarBtnType(rawValue: sender.tag)!)
    }
    
    @objc func btnClick2(sender: UIButton) {
        print("btnClick2: \(sender.tag)")
        
        btnClickClosure2?(LeftToolBarBtnType2(rawValue: sender.tag)!)
    }


    func setupUI() {
        self.backgroundColor = .blue;
        
        addSubview(settingBtn)
        settingBtn.snp.makeConstraints { make in
            make.left.top.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        addSubview(showBtn)
        showBtn.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(settingBtn.snp_bottomMargin)
            make.height.equalTo(settingBtn)
        }
    }
    
    func setupUI2() {
        let btnNames = ["设置1", "设置2", "设置3", "设置4", "设置5",];
        var lastBtn: UIButton?
        for i in 0 ... btnNames.count-1 {
            let btn = UIButton.init(type: .custom)
            btn.setTitle(btnNames[i], for: .normal)
            btn.backgroundColor = UIColor.randomColor
            btn.tag = i+1
            btn.addTarget(self, action: #selector(btnClick2), for: .touchUpInside)
            
            addSubview(btn)
            if i == 0 {
                btn.snp.makeConstraints { make in
                    make.top.left.right.equalTo(self)
                }
            } else {
                btn.snp.makeConstraints { make in
                    make.left.right.height.equalTo(lastBtn!)
                    make.top.equalTo(lastBtn!.snp_bottomMargin)
                }
                
                if i == btnNames.count-1 {
                    btn.snp.makeConstraints { make in
                        make.bottom.equalTo(self)
                    }
                }
            }
            
            lastBtn = btn
        }
    }
}
