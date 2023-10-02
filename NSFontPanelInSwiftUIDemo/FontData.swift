//
//  FontData.swift
//  NSFontPanelInSwiftUIDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/03.
//

import SwiftUI

struct FontData {
    var name: String
    var pointSize: CGFloat
}

// MARK: - Codable

extension FontData: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case pointSize
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(pointSize, forKey: .pointSize)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        pointSize = try container.decode(CGFloat.self, forKey: .pointSize)
    }
}

// MARK: - RawRepresentable

extension FontData: RawRepresentable {
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let decoded = try? JSONDecoder().decode(FontData.self, from: data) else {
            return nil
        }
        self = decoded
    }

    var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let jsonString = String(data: data, encoding: .utf8) else {
            return ""
        }
        return jsonString
    }
}

// MARK: - Helpers

extension FontData {
    var nsFont: NSFont {
        NSFont(name: name, size: pointSize) ??  .systemFont(ofSize: 14)
    }
}

extension NSFont {
    var fontData: FontData {
        FontData(name: fontName, pointSize: pointSize)
    }
}
