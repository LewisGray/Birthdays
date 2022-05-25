//
//  ContentView.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI
import HorizonCalendar


struct ContentView: View {
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.systemTeal    }
    @State private var selection = 1
    let numTabs = 4
    let minDragTranslationForSwipe: CGFloat = 50
    var body: some View {
        
        
            TabView(selection: $selection){
                
                VStack{
                    Text("Push notification testing")
                        .padding()
                    //basicUIVIewRepresentable()
                    Notifications()
                        
                    
                }
 
                
                
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Notification Tests")
                }
                .tag(0)
                .gesture(DragGesture().onEnded({
                                 self.handleSwipe(translation: $0.translation.width)
                             }))
                
                
                
                    UpcomingView()
                        
                    
                
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Upcoming")
                }
              
                .tag(1)
                .gesture(DragGesture().onEnded({
                                 self.handleSwipe(translation: $0.translation.width)
                             }))
        
        
                    FriendsView()

                        
                    
                
                
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Friends")
                }
                .tag(2)
                
                .gesture(DragGesture().onEnded({
                                 self.handleSwipe(translation: $0.translation.width)
                             }))
                
                
                
                
                
                VStack{
                    Text("Calendar Coming Soon")
                    basicUIVIewRepresentable()
                }
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Calendar")
                }
                .tag(3)
                .gesture(DragGesture().onEnded({
                                 self.handleSwipe(translation: $0.translation.width)
                             }))
        }
            

    }
        
        
    private func handleSwipe(translation: CGFloat) {
            if translation > minDragTranslationForSwipe && selection > 0 {
                selection -= 1
            } else  if translation < -minDragTranslationForSwipe && selection < numTabs-1 {
                selection += 1
            }
        print(selection)
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
        calendarView.translatesAutoresizingMaskIntoConstraints = true
        
        return calendarView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
    
private func makeContent() -> CalendarViewContent {
  let calendar = Calendar.current
    let currentDate = Date()
    let dateComponents = Calendar.current.dateComponents([.year,.month,Calendar.Component.day], from: currentDate)
    
  let startDate = calendar.date(from: DateComponents(year: 2022, month: 01, day: 01))!
  let endDate = calendar.date(from: DateComponents(year: 2023, month: 01, day: 01))!
  print(startDate)
    print("^START")
    print(endDate)
    print(currentDate)

    
      return CalendarViewContent(
        calendar: calendar,
        visibleDateRange: startDate...endDate,
        monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        
        
}
    
