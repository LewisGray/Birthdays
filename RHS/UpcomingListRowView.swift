//
//  UpcomingListRowView.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import SwiftUI

struct UpcomingListRowView: View{
    
    let plan: BirthdayPlan
    
    var body: some View{
        HStack{
            
            Text(plan.BirthdayPerson.Name)
            Text(plan.BirthdayPerson.DateOfBirth, style: .date)
            Image(systemName: plan.BirthdayPerson.isPrepared ? "checkmark.circle" : "circle")
                .foregroundColor(plan.BirthdayPerson.isPrepared ? .blue : .red)
            Spacer()
            
        }
        
    }
}
