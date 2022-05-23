//
//  Friend.swift
//  Birthdays
//
//  Created by Lewis Gray on 20/05/2022.
//

import Foundation
import SwiftUI

struct Friend:Identifiable, Codable{
    let id: String
    let Name: String
    let DateOfBirth: Date
    let BitAboutThem: String
    let Age: Int
    
    init(id: String = UUID().uuidString,Name: String, DateOfBirth: Date, BitAboutThem: String,Age:Int){
        self.id = id
        self.Name = Name
        self.DateOfBirth = DateOfBirth
        self.BitAboutThem = BitAboutThem
        self.Age = Age
    }
    
    
    
}
