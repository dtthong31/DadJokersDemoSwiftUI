//
//  ContentView.swift
//  DadJokes
//
//  Created by dtthong on 26/07/2022.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @StateObject var viewRouter : TabBarRouter
    @ViewBuilder var contentView: some View{
        switch viewRouter.currentPage{
        case .map :
            MapView().environmentObject(viewRouter)
        case .records :
            CardDetailView().environmentObject(viewRouter)
        case .plus :
            PlusView().environmentObject(viewRouter)
        case .account :
            AccountView().environmentObject(viewRouter)
        case .home:
            HomeView().environmentObject(viewRouter)
        }
    }
   
    var body: some View {
        TabView {
            HomeView().tabItem{
                Image(systemName:"house.fill")
                Text("Home")
            }
            MapView().tabItem{
                Image(systemName: "map.fill")
                Text("Map")
            }
            PlusView().tabItem{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geometry.size.width/7-6, height: geometry.size.height/7-6)
                    .foregroundColor(Color("AccentColor"))
                Text("Plus")
//                GeometryReader { geometry in
//                    ZStack{
//                        Circle()
//                                .foregroundColor(.white)
//                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
//                                .shadow(radius: 4)
//
//                    }.offset(y: -geometry.size.height/8/2)
//                }
               
            }
            RecordsView().tabItem{
                Image(systemName: "waveform")
                Text("Records")
            }
            AccountView().tabItem{
                Image(systemName: "person.crop.circle")
                Text("Account")
            }
        }
//        GeometryReader { geometry in
//            VStack{
//                Spacer()
//                contentView
//                Spacer()
//                HStack(){
//                    TabBarIcon(width: geometry.size.width/6, height: geometry.size.height/28, systemIcon: "house.fill", tabName: "Home",viewRouter:viewRouter ,assignedPage:.home)
//                    TabBarIcon(width: geometry.size.width/6, height: geometry.size.height/28, systemIcon: "map.fill", tabName: "Map",viewRouter:viewRouter ,assignedPage:.map)
//                    ZStack{
//                        Circle()
//                                .foregroundColor(.white)
//                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
//                                .shadow(radius: 4)
//                        Image(systemName: "plus.circle.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: geometry.size.width/7-6, height: geometry.size.height/7-6)
//                            .foregroundColor(Color("AccentColor"))
//                    }.offset(y: -geometry.size.height/8/2)
//                    TabBarIcon(width: geometry.size.width/6, height: geometry.size.height/28, systemIcon: "waveform", tabName: "Records",viewRouter:viewRouter ,assignedPage:.records)
//                    TabBarIcon(width: geometry.size.width/6, height: geometry.size.height/28, systemIcon: "person.crop.circle", tabName: "Account",viewRouter:viewRouter ,assignedPage:.account)
//                }.frame(width: geometry.size.width, height: geometry.size.height/8)
//                    .background(Color("TabBarBackground"))
//                    .shadow(radius:2)
//            }.edgesIgnoringSafeArea(.bottom)
                
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: TabBarRouter())
    }
}

struct TabBarIcon: View {
    let width,height: CGFloat
    let systemIcon, tabName:String
    @ObservedObject var viewRouter : TabBarRouter
    let assignedPage: Page
    
    var body: some View {
        VStack{
            Image(systemName: systemIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top,5)
            Text(tabName).font(.footnote).colorMultiply(viewRouter.currentPage == assignedPage ? .blue : .white)
            Spacer()
        }.onTapGesture {
            viewRouter.currentPage = assignedPage
        }.foregroundColor(viewRouter.currentPage == assignedPage ? .blue : .white)
    }
}
