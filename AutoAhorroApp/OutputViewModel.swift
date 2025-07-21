//
//  OutputViewModel.swift
//  AutoAhorroApp
//
//  Created by seb's on 7/20/25.
//

import Foundation
import SwiftUI

struct TransactionOutput: Identifiable {
    let id = UUID()
    let amount: Double
    let ceiling: Double
    let remanent: Double
    let date: String
    let isValid: Bool
}

class OutputViewModel: ObservableObject {
    @Published var showValid = true
    @Published var showGraph = true

    private let allTransactions: [TransactionOutput] = [
        TransactionOutput(amount: 250, ceiling: 300, remanent: 75, date: "2023-10-12 20:15", isValid: true),
        TransactionOutput(amount: 375, ceiling: 400, remanent: 25, date: "2023-02-28 15:49", isValid: true),
        TransactionOutput(amount: 620, ceiling: 700, remanent: 80, date: "2023-07-01 21:59", isValid: true),
        TransactionOutput(amount: 480, ceiling: 500, remanent: 45, date: "2023-12-17 08:09", isValid: true),
        TransactionOutput(amount: -200, ceiling: 0, remanent: 0, date: "2023-01-01 00:00", isValid: false)
    ]

    var transactions: [TransactionOutput] {
        allTransactions.filter { $0.isValid == showValid }
    }
}
