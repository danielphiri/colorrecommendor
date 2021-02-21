//
//  ContentView.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI

struct MainView: View {
  private let model                         : MainModelable
  @State private var menuOpacity            = 1.0
  @State private var searchingDone          = false
  @State private var searchText             = ""
  
  init(_ model: MainModelable) {
    self.model = model
  }
  
  var body: some View {
    VStack {
      searchBar
        .frame(width: nil, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 5))
      Spacer()
      
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
          }
        }
        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .cornerRadius(3.0)
        .foregroundColor(.black)
        .shadow(color: .green, radius: 1.0, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
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
              
              Image.init("menu_icon")
                .frame(width: 5, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .background(Color.red)
//                .scaledToFit()
              
              ForEach.init(menuItem.machingIndeces) { res in
                if res.num == 0 {
                  Text(res.text)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets.init(top: -1, leading: -1, bottom: -1, trailing: -1))
                    .background(Color.green)
                } else {
                  Text(res.text)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.black)
                    .padding(EdgeInsets.init(top: -1, leading: -1, bottom: -1, trailing: -1))
                    .background(Color.red)
                }
              }
            }
          }
        }
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
