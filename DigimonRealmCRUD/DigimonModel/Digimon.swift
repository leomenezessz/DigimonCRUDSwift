//
//  Digimon.swift
//  DigimonRealmCRUD
//
//  Created by Leonardo da Silva Menezes on 02/02/19.
//  Copyright © 2019 Leonardo da Silva Menezes. All rights reserved.
//

import Foundation
import RealmSwift

class Digimon : Object {
    @objc dynamic var  id = UUID().uuidString
    @objc dynamic var name : String = ""
    @objc dynamic var type : String = ""
    @objc dynamic var level : String = ""
    @objc dynamic var image : NSData?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
