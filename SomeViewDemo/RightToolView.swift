//
// RightToolView.swift
// SomeViewDemo
//
// Created by KellenChou on 2024/11/2
// Copyright © 2024 ZKL. All rights reserved.
//
    

import UIKit

enum RightToolViewBtnType: Int {
    case RightToolViewBtnType1 = 1
    case RightToolViewBtnType2
    case RightToolViewBtnType3
    case RightToolViewBtnType4
    case RightToolViewBtnType5
}

typealias RightToolViewBtnClickClosure = (RightToolViewBtnType) -> Void

class RightToolView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    var btnClickClosure: RightToolViewBtnClickClosure?
    
    @objc func btnClick(sender: UIButton) {
        print("btnClick: \(sender.tag)")
        
        btnClickClosure?(RightToolViewBtnType(rawValue: sender.tag)!)
    }

    func setupUI() {
        let btnNames = ["右边1", "右边2", "右边3", "右边4", "右边5",];
        var lastBtn: UIButton?
        for i in 0 ... btnNames.count-1 {
            let btn = UIButton.init(type: .custom)
            btn.setTitle(btnNames[i], for: .normal)
            btn.backgroundColor = UIColor.randomColor
            btn.tag = i+1
            btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            
            addSubview(btn)
            if i == 0 {
                btn.snp.makeConstraints { make in
                    make.top.left.right.equalTo(self)
                }
            } else {
                btn.snp.makeConstraints { make in
                    make.left.right.height.equalTo(lastBtn!)
                    make.top.equalTo(lastBtn!.snp.bottom)
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
