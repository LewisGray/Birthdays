//
//  EditFriend.swift
//  Birthdays
//
//  Created by Lewis Gray on 23/05/2022.
//

import SwiftUI

struct EditFriendView: View {
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    
    @State var FriendName: String = ""
    @State var DateOfBirth: Date = Date()
    @State var BitAboutThem: String = ""
    
    @State var alertText: String = ""
    @State var showAlert: Bool = false
    
    
    let friend : Friend
    
    var body: some View {
        ScrollView{
            TextField("Name:",text:$FriendName)
                .onAppear(){
                FriendName = friend.Name
                }
            Spacer(minLength: 100)
            DatePicker(
                    "Date of Birth:",
                    selection: $DateOfBirth,
                    displayedComponents: [.date]
                )
                .onAppear(){
                DateOfBirth = friend.DateOfBirth
                }
            Spacer(minLength: 100)
            Text("Bit about them")
                .underline()
            TextEditor(text:$BitAboutThem)
                .onAppear(){
                BitAboutThem = friend.BitAboutThem
                }
            Spacer(minLength: 200)
            Button(action: SavePressed, label:{
            Text("Save")
            }
                    
            )
        }
        .navigationBarTitle("✨Edit a Friend✨",displayMode: .inline)
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func SavePressed(){
        if textValidator(){
            let updatedFriend = birthdayPlanViewModel.makeFriend(Name: FriendName, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem)
            birthdayPlanViewModel.updateFriend(friend:friend,updatedFriend:updatedFriend)
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

