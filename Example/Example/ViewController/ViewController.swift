//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/10/22.
//

import UIKit
import WWOrderedSet

final class ViewController: UIViewController {
    
    private let orderedSet = WWOrderedSet<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderedSet.add("386")
        orderedSet.add("156")
        orderedSet.add("251")
        
        orderedSet.add("251")
        orderedSet.add("156")
        orderedSet.add("386")
        
        orderedSet.remove("251")
        
        print(orderedSet.array)
        print(orderedSet.contains("386"))
    }
}
