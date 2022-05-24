//
//  AddFriendView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

struct AddFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    
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
                .datePickerStyle(
                WheelDatePickerStyle()
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
            if dateValidator(){
        let newFriend = birthdayPlanViewModel.makeFriend(Name: FriendName, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem)
        birthdayPlanViewModel.addBirthdayPlan(BirthdayPerson: newFriend)
        presentationMode.wrappedValue.dismiss()
        }
        }
    }
    
    func getAlert() -> Alert{
        return Alert(title:Text(alertText))
    }
    func dateValidator() -> Bool {
        if DateOfBirth > Date(){
                alertText = "Please enter a date before today"
                showAlert.toggle()
                return false
        }
        return true
    }
    
    func textValidator() -> Bool {
        if FriendName.count == 0{
            alertText = "Please enter a name"
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
