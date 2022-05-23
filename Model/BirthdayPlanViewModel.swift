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
    
    
   
    func updateFriend(friend:Friend,updatedFriend:Friend){
        if let index = plans.firstIndex(where: {(existingPlan) -> Bool in
            return existingPlan.BirthdayPerson.id == friend.id
            
        }){
            //Run this
            plans[index].BirthdayPerson = updatedFriend
        }
    }
    
    
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
    
}

