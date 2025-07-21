//
//  ContentView.swift
//  AutoAhorroApp
//
//  Created by seb's on 7/20/25.
//
import SwiftUI
import Charts

struct ContentView: View {
    @StateObject private var viewModel = OutputViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Picker("Tipo de transacción", selection: $viewModel.showValid) {
                    Text("✅ Válidas").tag(true)
                    Text("❌ Inválidas").tag(false)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Picker("Vista", selection: $viewModel.showGraph) {
                    Text("📊 Gráfica").tag(true)
                    Text("📋 Tabla").tag(false)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if viewModel.showGraph {
                    ChartView(transactions: viewModel.transactions)
                } else {
                    TableView(transactions: viewModel.transactions)
                }

                Spacer()
            }
            .navigationTitle("AutoAhorro")
        }
    }
}
