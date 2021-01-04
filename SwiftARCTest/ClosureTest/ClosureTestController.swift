//
//  ClosureTestController.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/04.
//

import UIKit

class Service {
    static let shared = Service() // Singleton
        
    func fetchData(completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "https://www.google.com") else {return}
        URLSession.shared.dataTask(with: url) { (_, _, _) in
            completion(nil)
        }
    }
}

class ClosureTestController: UIViewController {
    
    deinit{
        print("ClosureTestController 메모리 해제 \n")
    }
    
    var testClosure: ((Data?, Error?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //[weak self] 미선언시 강한 참조 순환 발생으로 메모리 해제 안됨.
//        Service.shared.fetchData { (err) in
//            if let err = err {
//                print(err)
//                return
//            }
//            self.showAlert()
//        }
        
        Service.shared.fetchData { [weak self] (err) in
            if let err = err {
                print(err)
                return
            }
            self?.showAlert()
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
    }
}










