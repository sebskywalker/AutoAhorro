//
//  TransactionProcessor.swift
//  AutoAhorro
//
//  Created by seb's on 7/20/25.
//
import Foundation


public enum TransactionProcessor {
    
    public static func redondear(_ amount: Double) -> (Double, Double) {
        let techo = ceil(amount / 100) * 100
        let remanente = techo - amount
        return (techo, remanente)
    }
    
    public static let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm"
        f.timeZone = TimeZone(identifier: "UTC")
        f.locale = Locale(identifier: "en_US_POSIX")
        return f
    }()
    
    public static func process(transactionsRaw: [(String, Double)],
                               restrictions: [Restriction],
                               evaluations: [EvaluationRange]) -> Output {
        
        var valid: [Transaction] = []
        var invalid: [InvalidTransaction] = []
        
        for (dateStr, amount) in transactionsRaw {
            guard let date = formatter.date(from: dateStr), amount >= 0 else {
                invalid.append(InvalidTransaction(
                    date: dateStr,
                    amount: amount,
                    ceiling: 0,
                    remanent: 0,
                    message: "Negative amounts are not allowed or invalid date"
                ))
                continue
            }

            var tx = Transaction(date: dateStr, amount: amount, ceiling: 0, remanent: 0)
            let (ceilVal, rem) = redondear(amount)
            tx.ceiling = ceilVal
            tx.remanent = rem

            for r in restrictions {
                if date >= r.start && date <= r.end {
                    switch r.type {
                    case .fixed(let fixed): tx.ceiling += fixed
                    case .extra(let extra): tx.remanent += extra
                    }
                }
            }

            valid.append(tx)
        }
        
        return Output(valid: valid, invalid: invalid)
    }
}
