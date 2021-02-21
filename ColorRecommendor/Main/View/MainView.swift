//
//  ContentView.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI

struct MainView: View {
  private let model                         : MainModelable
  @State private var menuOpacity            = 0.0
  @State private var searchingDone          = false
  @State private var searchText             = ""
  @State private var backgroundColor: Color = Color.white
  
  init(_ model: MainModelable) {
    self.model = model
  }
  
  var body: some View {
    VStack(spacing: 0) {
      searchBar
        .frame(width: nil, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.init(top: 0, leading: 10, bottom: -3, trailing: 5))
        .background(backgroundColor)
       ZStack {
         backgroundColor
         menuFeedItems
          .background(backgroundColor)
       }
    }
  }
  
  var searchBar: some View {
    return (
      ZStack {
        TextField("Search for Colors", text: $searchText)
        .onChange(of: searchText) {
          let _ = $0
          if searchingDone {
            menuOpacity = 0.0
            searchingDone = false
          } else {
            menuOpacity = 1.0
            backgroundColor = Color.white
          }
        }
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(.black)
        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .cornerRadius(2.0)
        .shadow(color: .green, radius: 1.0, x: 0, y: 0)
      }
    )
  }
  
  var searchBarBackground: some View {
    return (
      VStack {
        Rectangle()
          .border(Color.gray)
          .cornerRadius(4)
          .foregroundColor(.white)
          .shadow(color: .green, radius: 1.0, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
      }
    )
  }
  
  
}


extension MainView {
  var menuFeedItems: some View {
      return (
        List {
          ForEach(model.getAllColors(matching: searchText)) { menuItem in
            HStack {
              Image.init(systemName: "clock")
                .foregroundColor(.black)
                .background(Color.purple)
              
              HStack(spacing: 0) {
                ForEach.init(menuItem.machingIndeces) { res in
                  if res.num == 0 {
                    Text(res.text)
                      .font(.system(size: 12, weight: .semibold))
                      .foregroundColor(.gray)
                  } else {
                    Text(res.text)
                      .font(.system(size: 12, weight: .semibold))
                      .foregroundColor(.black)
                  }
                }
              }
              .onTapGesture {
                backgroundColor = Color(hex: menuItem.hexValue)
                menuOpacity = 0.0
                searchText = menuItem.name
                searchingDone = true
              }
            }
          }
        }
        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 5))
        .shadow(color: .gray, radius: 1.0, x: 0, y: 0)
      )
      .opacity(menuOpacity)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      let model = MainModel()
            MainView(model)
    }
}
