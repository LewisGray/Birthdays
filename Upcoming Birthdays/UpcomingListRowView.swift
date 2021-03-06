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
            Text(plan.isPrepared)
            Spacer()
            Text("\(plan.daysUntil) days until")
                .font(.headline)
            
        }
        
        
    }
}
