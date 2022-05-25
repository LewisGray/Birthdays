//
//  FriendsView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    var body: some View {
        
        NavigationView{
            
            VStack{
            List{

                ForEach(birthdayPlanViewModel.plans){ plan in
                    NavigationLink(destination: EditFriendView(friend: plan.BirthdayPerson)){
                        FriendListRowView(friend: plan.BirthdayPerson)



                }
                }
                .onDelete(perform: birthdayPlanViewModel.delete)
                .onMove(perform: birthdayPlanViewModel.move)
                
                
                
            }
            
            
            
        .navigationBarTitle("Friends",displayMode: .inline)
        .navigationBarItems(leading: EditButton()
        )

        
        
            NavigationLink(destination: AddFriendView()) {
                Image("add")
                    .resizable()
                    .scaledToFit()


            }
            .frame(width: 65.0, height: 65.0)
            //offset(x:130,y:265)
            }
            
        }
    }
}




struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        FriendsView()
        }
    }
}
