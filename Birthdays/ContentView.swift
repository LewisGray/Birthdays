//
//  ContentView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI
import HorizonCalendar


struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        
           
            TabView(selection: $selection){
                
                VStack{
                    FriendsView()
                    
                }
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Friends")
                }
                .tag(0)
                
                VStack{
                    Text("Calendar")
                        .padding()
                    basicUIVIewRepresentable()
                    
                }
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Calendar")
                }
                .tag(1)
                
                VStack{
                    Text("Upcoming")
                        .padding()
                    UpcomingView()
                    
                }
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Upcoming")
                }
                .tag(2)
        
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct basicUIVIewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let calendarView = CalendarView(initialContent: makeContent())
        
        return calendarView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

private func makeContent() -> CalendarViewContent {
  let calendar = Calendar.current

  let startDate = calendar.date(from: DateComponents(year: 2020, month: 01, day: 01))!
  let endDate = calendar.date(from: DateComponents(year: 2021, month: 12, day: 31))!

  return CalendarViewContent(
    calendar: calendar,
    visibleDateRange: startDate...endDate,
    monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
}
