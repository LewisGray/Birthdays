//
//  UpcomingView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    var body: some View {
        let upcomingList = sortList(upcomingList:birthdayPlanViewModel.plans)
        NavigationView{
            
        List{
            ForEach(upcomingList){ plan in
                if plan.daysUntil > 0{
                NavigationLink(destination: BirthdayView(birthdayPlan: plan)){
                    
                        UpcomingListRowView(plan: plan )
                    }
                }
                
                
                }
            
            }
        .onAppear(){
            calculateDaysUntil(upcomingList:birthdayPlanViewModel.plans)
            
        }
        .navigationTitle("🎉 Upcoming! 🎉")
            Spacer()
            
        }
        
}
    func calculateDaysUntil(upcomingList: [BirthdayPlan])-> [BirthdayPlan]{
        upcomingList.forEach{ plan in
            //calculate the days remaining
            var dateComponents = DateComponents()
            dateComponents.month = Calendar.current.dateComponents([.month], from: plan.BirthdayPerson.DateOfBirth ).month
            dateComponents.day = Calendar.current.dateComponents([.day], from:plan.BirthdayPerson.DateOfBirth ).day
            dateComponents.year = 2022

            let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
            let someDateTime = userCalendar.date(from: dateComponents)
            let daysRemaining = userCalendar.numberOfDaysBetween(Date(),and: someDateTime!)
            birthdayPlanViewModel.updateDaysUntil(plan:plan,daysRemaining:daysRemaining)
            
        }
        
        return sortList(upcomingList: upcomingList)
        //Order the list by days remaining
        
        //Return the list
        
    }
    
    
    func sortList(upcomingList: [BirthdayPlan] )-> [BirthdayPlan]{
        
        let upcomingList = upcomingList.sorted(by: {
            $0.daysUntil < $1.daysUntil
        })
        return upcomingList
    }
}


struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}





extension Calendar {
func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
    let fromDate = startOfDay(for: from)
    let toDate = startOfDay(for: to)
    let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
    
    return numberOfDays.day! + 1 // <1>
}
}
