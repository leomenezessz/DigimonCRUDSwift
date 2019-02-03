//
//  Digimon.swift
//  DigimonRealmCRUD
//
//  Created by Leonardo da Silva Menezes on 02/02/19.
//  Copyright © 2019 Leonardo da Silva Menezes. All rights reserved.
//

import Foundation

struct Digimon {
   var name : String
    var type : String
    var level : String
    var image : String
    
    init(name : String, type : String, level : String, image : String) {
        self.name = name
        self.type = type
        self.level = level
        self.image = image
    }
}
