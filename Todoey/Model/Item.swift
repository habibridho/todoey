//
//  Item.swift
//  Todoey
//
//  Created by Habib Ridho on 20/02/18.
//  Copyright © 2018 Habib Ridho. All rights reserved.
//

import Foundation

class Item: Codable {
    
    var title : String = ""
    var done : Bool = false
    
    init(title: String) {
        self.title = title
    }
    
}
