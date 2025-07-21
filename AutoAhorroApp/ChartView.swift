//
//  ChartView.swift
//  AutoAhorroApp
//
//  Created by seb's on 7/20/25.
//

import Foundation
import SwiftUI
import Charts

struct ChartView: View {
    let transactions: [TransactionOutput]

    var body: some View {
        Chart {
            ForEach(transactions) { tx in
                BarMark(
                    x: .value("Fecha", tx.date),
                    y: .value("Monto", tx.amount)
                )
                .foregroundStyle(.blue)

                BarMark(
                    x: .value("Fecha", tx.date),
                    y: .value("Techo", tx.ceiling)
                )
                .foregroundStyle(.green)

                BarMark(
                    x: .value("Fecha", tx.date),
                    y: .value("Remanente", tx.remanent)
                )
                .foregroundStyle(.orange)
            }
        }
        .frame(height: 250)
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
