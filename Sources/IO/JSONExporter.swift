//
//  JSONExporter.swift
//  AutoAhorro
//
//  Created by seb's on 7/20/25.
//

import Foundation


public enum JSONExporter {
    public static func export(_ output: Output) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(output)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("\n📦 Resultado JSON:")
                print(jsonString)
            }
        } catch {
            print("❌ Error al convertir a JSON: \(error)")
        }
    }
}
