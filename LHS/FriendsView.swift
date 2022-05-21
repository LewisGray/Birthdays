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
            List{
                ForEach(friendsViewModel.friends){ friend in
                FriendListRowView(friend: friend)
                }
                .onDelete(perform: friendsViewModel.delete)
                .onMove(perform: friendsViewModel.move)
                
            }
        
        .navigationTitle("Friends")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddFriendView()))
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
