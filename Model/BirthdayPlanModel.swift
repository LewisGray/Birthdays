//
//  BirthdayPlanModel.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import Foundation

import Foundation
import SwiftUI

struct BirthdayPlan:Identifiable, Codable{
    let id: String
    var BirthdayPerson: Friend
    var Plan: String
    var Card_Bought: Bool
    var Present_Bought: Bool
    var isPrepared:String
    
    init(id: String = UUID().uuidString,BirthdayPerson: Friend, Plan: String, Card_Bought: Bool,Present_Bought:Bool){
        self.id = id
        self.BirthdayPerson = BirthdayPerson
        self.Plan = Plan
        self.Card_Bought = Card_Bought
        self.Present_Bought = Present_Bought
        self.isPrepared = "No"
    }
    
    
}
