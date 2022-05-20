//
//  FriendsViewModel.swift
//  Birthdays
//
//  Created by Lewis Gray on 20/05/2022.
//

import Foundation

class FriendsViewModel: ObservableObject{
    let key: String = "friend_list"
    @Published var friends: [Friend] = [] {
        didSet{
            saveFriendList()
        }
    }
    
    init(){
        getFriends()
    }
    func getFriends(){
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedFriends = try? JSONDecoder().decode([Friend].self, from: data)
         else {return}
        
        self.friends = savedFriends

    }
    
    func delete(indexSet:IndexSet){
        friends.remove(atOffsets: indexSet)
    }
    func move(from: IndexSet, to:Int){
        friends.move(fromOffsets: from, toOffset: to)
    }
    
    func addFriend(Name: String, DateOfBirth: Date, BitAboutThem: String){
        let newFriend = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem)
        friends.append(newFriend)
    }
    
    //Update Function
    
    func saveFriendList(){
        if let encodedData = try? JSONEncoder().encode(friends){
            UserDefaults.standard.set(encodedData, forKey: key )
        }
    }
    
}
