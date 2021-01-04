//
//  MainController.swift
//  SwiftARCTest
//
//  Created by seunghwan Lee on 2021/01/04.
//

import UIKit

class MainController: UIViewController {
    
    @IBAction func didPressReferenceTest(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "ReferenceTest", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "referenceTest") as? ReferenceTestController else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didPressWeakAndUnownedTest(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "WeakAndUnownedTest", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "weakAndUnownedTest") as? WeakAndUnownedTestController else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didPressClosureTest(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "ClosureTest", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "closureTest") as? ClosureTestController else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func didPressDelegateTest(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "DelegateTest", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "delegateTest") as? DelegateTestController else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
