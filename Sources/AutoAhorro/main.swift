import Foundation

// Entradas simuladas
let transactionsRaw: [(String, Double)] = [
    ("2023-10-12 20:15", 250),
    ("2023-02-28 15:49", 375),
    ("2023-07-01 21:59", 620),
    ("2023-12-17 08:09", 480)
]

let restrictions: [Restriction] = [
    .init(type: .fixed(0),
          start: TransactionProcessor.formatter.date(from: "2023-07-01 00:00")!,
          end: TransactionProcessor.formatter.date(from: "2023-07-31 23:59")!),
    .init(type: .extra(25),
          start: TransactionProcessor.formatter.date(from: "2023-10-01 08:00")!,
          end: TransactionProcessor.formatter.date(from: "2023-12-31 19:59")!)
]

let evaluations: [EvaluationRange] = [
    .init(start: TransactionProcessor.formatter.date(from: "2023-03-01 00:00")!,
          end: TransactionProcessor.formatter.date(from: "2023-11-30 23:59")!),
    .init(start: TransactionProcessor.formatter.date(from: "2023-01-01 00:00")!,
          end: TransactionProcessor.formatter.date(from: "2023-12-31 23:59")!)
]

// Procesamiento
let result = TransactionProcessor.process(
    transactionsRaw: transactionsRaw,
    restrictions: restrictions,
    evaluations: evaluations
)

// Impresión JSON
JSONExporter.export(result)
