//
//  MainModel.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI
import Foundation


protocol Mainable {
  func getAllColors(matching: String) -> [MenuColorItem]
//  func getScreenWidth() -> CGFloat
  func getPreviousIndex(text: String) -> Int
  func getLetter(from: String) -> String
}

final class MainModel: Mainable {
  
  private let colorsDic: [String: String] = [
      "White" : "FFFFFF",
      "Silver": "C0C0C0",
      "Gray": "808080",
      "Black": "000000",
      "Red": "FF0000",
      "Maroon": "FF0000",
      "Yellow": "FFFF00",
      "Olive": "808000",
      "Lime": "00FF00",
      "Green": "008000",
      "Aqua": "00FFFF",
      "Teal": "008080",
      "Blue": "0000FF",
      "Navy": "000080",
      "Fuchsia": "FF00FF",
      "Purple": "800080"
    ]
  
  func getAllColors(matching: String) -> [MenuColorItem] {
    return []
  }
  
//  func getScreenWidth() -> CGFloat {
//    return
//  }
  
  func getPreviousIndex(text: String) -> Int {
    return 0
  }
  
  func getLetter(from: String) -> String {
    return ""
  }
  
}
