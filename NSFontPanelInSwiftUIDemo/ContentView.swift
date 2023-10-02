//
//  ContentView.swift
//  NSFontPanelInSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settings = Settings.shared
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Font")
                    Spacer()
                    Text("\(settings.nsFont.fontName) \(Int(settings.nsFont.pointSize))")
                        .monospacedDigit()
                        .foregroundStyle(.secondary)
                    FontPicker("Select...", selection: $settings.nsFont)
                }
                Button("Reset") {
//                    let appDomain = Bundle.main.bundleIdentifier
//                    UserDefaults.standard.removePersistentDomain(forName: appDomain!)
                    settings.nsFont = NSFont(name: "Helvetica", size: 14)!
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            
            Section {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(Font(settings.nsFont))
            } header: {
                Text("Preview")
            }
        }
        .formStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
