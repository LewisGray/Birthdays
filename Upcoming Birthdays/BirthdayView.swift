//
//  BirthdayView.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import SwiftUI

struct BirthdayView: View {
    @State var planOfAction: String = ""
    @State var cardSorted: Bool = false
    @State var giftSorted: Bool = false
    
    let birthdayPlan : BirthdayPlan
    var body: some View {
        VStack{
            Text("🎊 \(birthdayPlan.BirthdayPerson.Name)'s \(birthdayPlan.BirthdayPerson.Age+1) birthday! 🎊")
            Spacer()
            Spacer()
            Text("\(getBirthDay(BirthdayPerson:birthdayPlan.BirthdayPerson))")
            Spacer()
            Text("Celebratory plans:")
                .underline()
            TextEditor(text: $planOfAction)
            
            
        }
    }

    func getBirthDay(BirthdayPerson:Friend)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from:BirthdayPerson.DateOfBirth)

        
        
    }
}

