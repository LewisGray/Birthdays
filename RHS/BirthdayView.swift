//
//  BirthdayView.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import SwiftUI

struct BirthdayView: View {
    @State var planOfAction: String = ""
    
    let birthdayPlan : BirthdayPlan
    var body: some View {
        VStack{
            Text("🎊 \(birthdayPlan.BirthdayPerson.Name)'s birthday! 🎊")
            TextField("Plan:",text: $planOfAction)
            Text("\(getBirthDay(BirthdayPerson:birthdayPlan.BirthdayPerson))")
            
        }
    }

    func getBirthDay(BirthdayPerson:Friend)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from:BirthdayPerson.DateOfBirth)

        
        
    }
}

