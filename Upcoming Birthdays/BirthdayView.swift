//
//  BirthdayView.swift
//  Birthdays
//
//  Created by Lewis Gray on 21/05/2022.
//

import SwiftUI

struct BirthdayView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    @State var planOfAction: String = ""
    @State var cardSorted: Bool = false
    @State var giftSorted: Bool = false
    
    let birthdayPlan : BirthdayPlan
    var body: some View {
        VStack{
            Text("🎊 \(birthdayPlan.BirthdayPerson.Name)'s \(birthdayPlan.BirthdayPerson.Age+1) birthday! 🎊")
            
            Text("\(getBirthDay(BirthdayPerson:birthdayPlan.BirthdayPerson))")
      
            
            
            Toggle(isOn: $cardSorted){
                     Text("Card?")
                        .font(.subheadline)
                       
                  }
            .onAppear(){
                cardSorted = birthdayPlan.Card_Bought
            }
            Toggle(isOn: $giftSorted){
                     Text("Gift?")
                        .font(.subheadline)
                        
                  }
            .onAppear(){
                giftSorted = birthdayPlan.Present_Bought
            }
            Text("Celebratory plans:")
                .underline()
            TextEditor(text: $planOfAction)
                .frame(height: 300)
                .colorMultiply(.gray)
                .cornerRadius(10)
                .onAppear(){
                    planOfAction = birthdayPlan.Plan
                }
            Spacer()
            Button(action: SavePressed, label:{
            Text("Save")
            })
                .offset(y:-20)
            
        }
    }

    func getBirthDay(BirthdayPerson:Friend)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from:BirthdayPerson.DateOfBirth)

        
        
    }
    
    func SavePressed(){
        birthdayPlanViewModel.savePlan(plan: birthdayPlan,planOfAction:planOfAction,cardSorted:cardSorted,giftSorted:giftSorted)
        presentationMode.wrappedValue.dismiss()
        }
        
    }


