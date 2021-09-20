//
//  Item.swift
//  Todoey
//
//  Created by Bogdan Dediu on 16.09.2021.
//  Copyright © 2021 bogdan dediu. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var colorHex: String = ""
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
