//
//  DelegateTestView.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/05.
//

import UIKit

class DelegateTestView: UIView {
    
    deinit{
        print("DelegateTestView 메모리 해제")
    }
    
    // 메모리 누수 발생
    //var delegate: SomeDelegate?
    
    // 메모리 누수 발생 x
    weak var delegate: SomeDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}




