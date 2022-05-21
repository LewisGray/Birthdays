//
//  UpcomingView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject var friendsViewModel: FriendsViewModel
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    var body: some View {
        let upcomingList = sortList(upcomingList:birthdayPlanViewModel.plans)
        NavigationView{
        List{
            ForEach(upcomingList){ plan in
                NavigationLink(destination: BirthdayView(birthdayPlan: plan)){
                    UpcomingListRowView(plan: plan )
                    .onTapGesture {
                        withAnimation(.linear){
                        }
                        
                    }
                }
                }
            }
        }
}
    func sortList(upcomingList: [BirthdayPlan] )-> [BirthdayPlan]{
        let upcomingList = upcomingList.sorted(by: {
            $0.BirthdayPerson.DateOfBirth.compare($1.BirthdayPerson.DateOfBirth) == .orderedDescending
        })
        return upcomingList
    }
}
struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
