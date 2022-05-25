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
            Text(friend.Name)
            Spacer()
            Text("Age:\(friend.Age)")
            
            
        }
        
    }
}

