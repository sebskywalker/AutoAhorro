//
//  DomainModels.swift
//  AutoAhorro
//
//  Created by seb's on 7/20/25.
//

import Foundation

// MARK: - Modelos de dominio

public enum RestrictionType {
    case fixed(Double)
    case extra(Double)
}

public struct Restriction {
    public let type: RestrictionType
    public let start: Date
    public let end: Date
}

public struct EvaluationRange {
    public let start: Date
    public let end: Date
}

public struct Transaction: Codable {
    public let date: String
    public let amount: Double
    public var ceiling: Double
    public var remanent: Double

    public init(date: String, amount: Double, ceiling: Double, remanent: Double) {
        self.date = date
        self.amount = amount
        self.ceiling = ceiling
        self.remanent = remanent
    }
}

public struct InvalidTransaction: Codable {
    public let date: String
    public let amount: Double
    public var ceiling: Double
    public var remanent: Double
    public let message: String

    public init(date: String, amount: Double, ceiling: Double, remanent: Double, message: String) {
        self.date = date
        self.amount = amount
        self.ceiling = ceiling
        self.remanent = remanent
        self.message = message
    }
}

public struct Output: Codable {
    public let valid: [Transaction]
    public let invalid: [InvalidTransaction]

    public init(valid: [Transaction], invalid: [InvalidTransaction]) {
        self.valid = valid
        self.invalid = invalid
    }
}
