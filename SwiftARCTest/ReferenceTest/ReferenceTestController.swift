//
//  ReferenceTestController.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/04.
//

import UIKit

class Pet {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized \n")
    }
}

class ReferenceTestController: UIViewController {
    
    var reference1: Pet?
    var reference2: Pet?
    var reference3: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reference1 = Pet(name: "Choco") // 인스턴스 생성, 참조 +1
        reference2 = reference1 // 참조 +1
        reference3 = reference1 // 참조 +1,  Person 인스턴스에 대한 참조 = 3
        
        reference1 = nil
        reference2 = nil
        reference3 = nil // 이때 메모리에서 해제, Person 인스턴스에 대한 참조 = 0
    }
}
