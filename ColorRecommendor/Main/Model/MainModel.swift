//
//  MainModel.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI
import Foundation


protocol MainModelable {
  func getAllColors(matching: String) -> [MenuColorItem]
//  func getScreenWidth() -> CGFloat
  func getPreviousIndex(text: String) -> Int
  func getLetter(from: String) -> String
}

final class MainModel: MainModelable {
  
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
  
  
  func getAllColors(matching text: String) -> [MenuColorItem] {
    var colors: [MenuColorItem] = []
    if text == "" {
      return colors
      for color in colorsDic {
        colors.append(MenuColorItem(name: color.key, hexValue: color.value, machingIndeces: getMatchingIndices(word1: text, word2: color.key)))
      }
      return colors
    }

    for color in colorsDic {
//      if color.key.lowercased() == text.lowercased() {
//        return []
//      }
      if color.key.lowercased().contains(text.lowercased()) {
        colors.append(MenuColorItem(name: color.key, hexValue: color.value, machingIndeces: getMatchingIndices(word1: text, word2: color.key)))
      }
    }
    return colors
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
  
  // Return indices for all  words in word1 that are contained in word2
  private func getMatchingIndices(word1: String, word2: String) -> [StringIndex] {
    var indeces: [StringIndex] = []
    for (_, char) in word2.enumerated() {
      indeces.append(StringIndex(num: 0, text: String(char)))
    }
    if word1 == "" {
      #warning("TODO: Find cleaner way of doing this")
      for (index, char) in word2.enumerated() {
        indeces[index] = StringIndex(num: 1, text: String(char))
      }
      return indeces
    }
    for char in word1.lowercased() {
      for (index, char2) in word2.lowercased().enumerated() {
        if char == char2 {
          indeces[index] = StringIndex(num: 1, text: String(word2.map {String($0)}[index]))
        }
      }
    }
    
    return indeces
  }
  
}
