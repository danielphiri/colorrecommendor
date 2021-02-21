//
//  MenuColorItem.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import Foundation

struct MenuColorItem: Equatable, Identifiable {
  
  let name               : String
  let hexValue           : String
  var machingIndeces     : [StringIndex]
  var id                 = UUID()
  
  static func == (lhs: MenuColorItem, rhs: MenuColorItem) -> Bool {
    lhs.hexValue == rhs.hexValue
  }
  
}


struct StringIndex: Equatable, Identifiable {
  
  let num               : Int
  let text              : String
  var id                = UUID()
  
  static func == (lhs: StringIndex, rhs: StringIndex) -> Bool {
    lhs.num == rhs.num
  }
  
}
