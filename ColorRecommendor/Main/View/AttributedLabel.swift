//
//  AttributedLabel.swift
//  ColorRecommendor
//
//  Created by dphiri on 2/20/21.
//

import SwiftUI
import Foundation

struct AttributedLabel: NSViewRepresentable {
  func makeNSView(context: Context) -> NSTextField {
    Label()
  }
  
  func updateNSView(_ nsView: NSTextField, context: Context) {
    configuration(nsView)
  }
  
  typealias NSViewType = NSTextField
  

    typealias Label = NSTextField
    fileprivate var configuration = { (view: Label) in }

//    func makeUIView(context: UIViewRepresentableContext<Self>) -> Label { Label() }
//    func updateUIView(_ uiView: Label, context: UIViewRepresentableContext<Self>) {
//        configuration(uiView)
//    }
}
