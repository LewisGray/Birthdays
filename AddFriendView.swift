//
//  AddFriendView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct AddFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var friendsViewModel: FriendsViewModel
    
    @State var FriendName: String = ""
    @State var DateOfBirth: Date = Date()
    @State var BitAboutThem: String = ""
    
    @State var alertText: String = ""
    @State var showAlert: Bool = false
    
    
    
    var body: some View {
        ScrollView{
            TextField("Name:",text:$FriendName)
            DatePicker(
                    "Date of Birth:",
                    selection: $DateOfBirth,
                    displayedComponents: [.date]
                )
            TextField("Bit about them:",text:$BitAboutThem)
            Button(action: SavePressed, label:{
            Text("Save")
            }
            )
        }
        .navigationTitle("✨Add a Friend✨")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func SavePressed(){
        if textValidator(){
        friendsViewModel.addFriend(Name: FriendName, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem)
        presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func getAlert() -> Alert{
        return Alert(title:Text(alertText))
    }
    
    func textValidator() -> Bool {
        if FriendName.count == 0{
            alertText = "Name is too short"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
