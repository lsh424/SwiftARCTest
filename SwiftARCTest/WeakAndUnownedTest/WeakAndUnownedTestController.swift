//
//  WeakAndUnownedTestController.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/04.
//

import UIKit

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized \n") }
}

class WeakAndUnownedTestController: UIViewController {
    
    var lee: Person?
    var unit4A: Apartment?
    
    var john: Customer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 약한 참조(Weak References) Test
        
        lee = Person(name: "LEE") // Person 인스턴스 참조 +1
        unit4A = Apartment(unit: "4A") // Apartment 인스턴스 참조 +1
        
        lee!.apartment = unit4A // Apartment 인스턴스 참조 +1, Apartment 인스턴스 참조 = 2
        unit4A!.tenant = lee // Person 인스턴스 참조 +0 , Person 인스턴스 참조 = 1
        
        
        
        lee = nil // Person 인스턴스 참조 = 0, 메모리 해제 and Person 인스턴스의 Apartment 인스턴스 참조도 사라짐 -> Apartment 인스턴스 참조 = 1
        
        unit4A = nil // Apartment 인스턴스 참조 = 0, 메모리 해제
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n")
        
        // 미소유 참조(Unowned References) Test
        
        john = Customer(name: "John Appleseed") // Customer 인스턴스 참조 + 1
        john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!) // CreditCard 인스턴스 참조 + 1, CreditCard 인스턴스 참조 = 1, Customer 인스턴스 참조 + 0 (미소유 참조이기 때문), Customer 인스턴스 참조 = 1
        
        john = nil // Customer 인스턴스 참조 = 0 메모리 해제, CreditCard 인스턴스 참조 = 0, 메모리 해제
    }
}
