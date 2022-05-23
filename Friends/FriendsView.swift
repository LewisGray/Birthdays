//
//  FriendsView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var friendsViewModel: FriendsViewModel
    var body: some View {
        NavigationView{
            
            ZStack {
                List{
                    
                    ForEach(friendsViewModel.friends){ friend in
                    NavigationLink(destination: EditFriendView(friend: friend)){
                    FriendListRowView(friend: friend)
                    
                    
                    
                    }
                    }
                    .onDelete(perform: friendsViewModel.delete)
                    .onMove(perform: friendsViewModel.move)
                }
            
            .navigationTitle("Friends")
            //.navigationBarItems(leading: EditButton())
                
                NavigationLink(destination: AddFriendView()) {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        
                    
                }
                .frame(width: 65.0, height: 65.0)
                .offset(x:130,y:265)
                
               
                
                
            
                
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
