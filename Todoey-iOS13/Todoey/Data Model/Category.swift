//
//  Category.swift
//  Todoey
//
//  Created by Bogdan Dediu on 16.09.2021.
//  Copyright © 2021 bogdan dediu. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colorHex: String = ""
    let items = List<Item>()
}
