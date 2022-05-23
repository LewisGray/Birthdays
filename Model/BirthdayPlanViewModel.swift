//
//  BirthdayPlanViewModel.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import Foundation
import UIKit

class BirthdayPlanViewModel: ObservableObject{
    let key: String = "Plan_list"
    @Published var plans: [BirthdayPlan] = [] {
        didSet{
            savePlanList()
        }
    }
    
    init(){
        getPlans()
    }
    func getPlans(){
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedPlans = try? JSONDecoder().decode([BirthdayPlan].self, from: data)
         else {return}
        
        self.plans = savedPlans

    }
    
    func delete(indexSet:IndexSet){
        plans.remove(atOffsets: indexSet)
    }
    func move(from: IndexSet, to:Int){
        plans.move(fromOffsets: from, toOffset: to)
    }
    
    func addBirthdayPlan(BirthdayPerson: Friend){
        let newPlan = BirthdayPlan(BirthdayPerson: BirthdayPerson, Plan:"", Card_Bought: false, Present_Bought: false)
        plans.append(newPlan)
    }
    
    func makeFriend(Name: String, DateOfBirth: Date, BitAboutThem: String)-> Friend{
        let newFriend = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, Age: calcAge(birthday: DateOfBirth))
        return newFriend
    }
    
    
   
    func updateFriend(friend:Friend,updatedFriend:Friend){
        if let index = plans.firstIndex(where: {(existingPlan) -> Bool in
            return existingPlan.BirthdayPerson.id == friend.id
            
        }){
            //Run this
            plans[index].BirthdayPerson = updatedFriend
        }
    }
    
//    func editFriend(friend:Friend, Name: String, DateOfBirth: Date, BitAboutThem: String)-> Friend
//    {
//        if let index = plans.firstIndex(where: {(existingFriend) -> Bool in
//            return existingFriend.id==friend.id
//            
//        }){
//            //Run this
//            plans[index].BirthdayPerson = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, Age: calcAge(birthday: DateOfBirth))
//            return plans[index].BirthdayPerson
//                    }
//        //This should never happen
//        return plans[0].BirthdayPerson
//    }
    
    
    
    
    func findPlan(friend:Friend)-> BirthdayPlan
    {
        if let index = plans.firstIndex(where: {(existingPlan) -> Bool in
            return existingPlan.BirthdayPerson.id == friend.id
            
        }){
            //Run this
            return plans[index]
        }
        return plans[0]
    }
    
    
    
    func savePlanList(){
        if let encodedData = try? JSONEncoder().encode(plans){
            UserDefaults.standard.set(encodedData, forKey: key )
        }
    }
    
    
    
    func calcAge(birthday: Date) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = birthday
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
}

