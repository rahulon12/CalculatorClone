//
//  CalculatorBridge.swift
//  CalculatorClone
//
//  Created by Rahul on 9/12/24.
//

import SwiftUI

@Observable final class CalculatorBridge {
    enum ViewElement: Equatable {
        case value(Int)
        case operation(CalculatorOperation)
        case toggleSign
        case makePercentage
        case equals
        case reset
        case custom(String)

        func description() -> String {
            switch self {
            case .value(let value): return "\(value)"
            case .operation(let operation): return operation.rawValue
            case .toggleSign: return "+/-"
            case .makePercentage: return "%"
            case .equals: return "="
            case .reset: return "AC"
            case .custom(let custom): return custom
            }
        }

        func shouldAnimate() -> Bool {
            self == .equals || self == .reset
        }
    }

    typealias CalculatorOperation = CalculatorBrain.Operation

    private(set) var calculatorBrain = CalculatorBrain()

    func actionFor(viewElement: ViewElement) {
        switch viewElement {
        case .value(let value): userSelectedDigit(Double(value))
        case .operation(let operation): userSelectedOperation(operation)
        case .toggleSign: calculatorBrain.toggleSign()
        case .makePercentage: calculatorBrain.makePercentage()
        case .equals: calculatorBrain.performOperation()
        case .reset: calculatorBrain.reset()
        default: break
        }
    }


    // MARK: - User Intents
    private func userSelectedDigit(_ digit: Double) {
        calculatorBrain.updateWorkingNumber(with: digit)
    }

    private func userSelectedOperation(_ operation: CalculatorOperation) {
        calculatorBrain.selectOperation(operation)
    }
}
