//
//  FontPicker.swift
//  NSFontPanelInSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/03.
//

import SwiftUI

/// refs: [tyagishi / FontPicker](https://github.com/tyagishi/FontPicker/tree/main)
fileprivate class FontPickerDelegate {
    
    private var parent: FontPicker

    init(_ parent: FontPicker) {
        self.parent = parent
    }
    
    @objc
    private func changeFont(_ id: Any) {
        parent.fontSelected()
    }

}

struct FontPicker: View {
    
    private let label: LocalizedStringKey?
    @Binding private var font: NSFont
    @State private var fontPickerDelegate: FontPickerDelegate? = nil
    
    init(_ label: LocalizedStringKey? = nil, selection: Binding<NSFont>) {
        self.label = label
        self._font = selection
    }
    
    var body: some View {
        Button {
            fontPickerDelegate = FontPickerDelegate(self)
            NSFontManager.shared.target = fontPickerDelegate
            NSFontPanel.shared.setPanelFont(font, isMultiple: false)
            NSFontPanel.shared.orderBack(nil)
        } label: {
            if let label {
                Text(label)
            } else {
                EmptyView()
            }
        }
    }
    
    fileprivate func fontSelected() {
        font = NSFontPanel.shared.convert(self.font)
    }
}

struct FontPicker_Previews: PreviewProvider {
    static var previews: some View {
        FontPicker("Select...", selection: .constant(NSFont.systemFont(ofSize: 24)))
            .frame(width: 400)
            .padding()
    }
}
