//
//  GetThings.swift
//  PeevedPenguins
//
//  Created by mitchell hudson on 5/9/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import Foundation

class GetThings {
    
    var things = ["A", "B", "C"]
    var newThings = [String]()
    var index = 0
    var callback: (([String]) -> Void)?
    
    init(callback: @escaping ([String])-> Void) {
        self.callback = callback
    }
    
    func getAllThings() {
        if index < things.count {
            // Get thing
            let r = TimeInterval(Float(arc4random() % 1000)/1000)
            Timer.scheduledTimer(withTimeInterval: r, repeats: false) { (timer: Timer) in
                print("Finished loading thing : \(self.things[self.index])")
                self.newThings.append(self.things[self.index])
                self.index += 1
                self.getAllThings()
            }
        } else {
            if let callback = callback {
                callback(newThings)
            }
        }
    }
    
    
    func test(a: Int? = nil, b: String, c: Float) {
        
    }
    
}
