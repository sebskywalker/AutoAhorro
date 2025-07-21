//
//  TableView.swift
//  AutoAhorroApp
//
//  Created by seb's on 7/20/25.
//

import SwiftUI

struct TableView: View {
    let transactions: [TransactionOutput]

    var body: some View {
        List(transactions) { tx in
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("💸 Monto:")
                        .bold()
                    Spacer()
                    Text("\(Int(tx.amount))")
                }
                HStack {
                    Text("🎯 Techo:")
                        .bold()
                    Spacer()
                    Text("\(Int(tx.ceiling))")
                }
                HStack {
                    Text("💰 Remanente:")
                        .bold()
                    Spacer()
                    Text("\(Int(tx.remanent))")
                }
                Text("📅 \(tx.date)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 6)
        }
    }
}
