//
//  FriendListRowView.swift
//  Birthdays
//
//  Created by Lewis Gray on 20/05/2022.
//

import SwiftUI

struct FriendListRowView: View{
    
    let friend: Friend
    
    var body: some View{
        HStack{
            Image(systemName: "checkmark.circle")
            Text(friend.Name)
            Text("Age:\(friend.Age)")
            Spacer()
            
        }
        
    }
}

