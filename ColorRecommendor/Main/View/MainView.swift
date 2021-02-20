//
//  ContentView.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI

struct MainView: View {
  private let model: MainModelable
  
  init(_ model: MainModelable) {
    self.model = model
  }
  
  var body: some View {
    Text("Hello, World!")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      let model = MainModel()
            MainView(model)
    }
}
