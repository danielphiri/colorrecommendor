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
