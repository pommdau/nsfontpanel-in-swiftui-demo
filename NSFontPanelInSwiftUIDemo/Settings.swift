//
//  Settings.swift
//  NSFontPanelInSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/03.
//

import SwiftUI

public class Settings: ObservableObject {
    
    static let shared = Settings()
    
    @AppStorage("selected-font")
    private var fontData: FontData = .init(name: "Helvetica", pointSize: 14)

    var nsFont: NSFont {
        get {
            fontData.nsFont
        }
        
        set(newValue) {
            fontData = newValue.fontData
        }
    }
}
