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
    let isPrepared: Bool
    
    init(id: String = UUID().uuidString,Name: String, DateOfBirth: Date, BitAboutThem: String,isPrepared:Bool){
        self.id = id
        self.Name = Name
        self.DateOfBirth = DateOfBirth
        self.BitAboutThem = BitAboutThem
        self.isPrepared = isPrepared
    }
    
    func prepared()-> Friend{
        return Friend(id: id, Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, isPrepared: !isPrepared)
    }
}
