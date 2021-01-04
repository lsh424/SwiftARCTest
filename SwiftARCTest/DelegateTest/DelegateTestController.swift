//
//  DelegateTestController.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/04.
//

import UIKit

protocol SomeDelegate: AnyObject {
    func didTapThing()
}

class DelegateTestController: UIViewController, SomeDelegate {
    
    deinit{
        print("DelegateTestController 메모리 해제")
    }
    
    @IBOutlet weak var delegateTestView: DelegateTestView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTestView.delegate = self
    }
    
    func didTapThing() {
        
    }
}


