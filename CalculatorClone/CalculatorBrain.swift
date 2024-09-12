//
//  CalculatorBrain.swift
//  CalculatorClone
//
//  Created by Rahul on 9/12/24.
//

import Foundation

struct CalculatorBrain {
    enum Operation: String, CaseIterable {
        case add = "+", subtract = "-", multiply = "*", divide = "/"
    }

    var workingNumber: Double = 0 {
        didSet { print("Working number: \(workingNumber)") }
    }
    var currentResult: Double = 0 {
        didSet { print("Current result: \(currentResult)") }
    }
    var selectedOperation: Operation? {
        didSet { print("Selected operation: \(selectedOperation?.rawValue)") }
    }

    mutating func performOperation() {
        guard let operation = selectedOperation else { return }

        switch operation {
        case .add:
            currentResult += workingNumber
        case .subtract:
            currentResult -= workingNumber
        case .multiply:
            currentResult *= workingNumber
        case .divide:
            currentResult /= workingNumber
        }

        selectedOperation = nil
        workingNumber = 0
    }

    mutating func selectOperation(_ operation: Operation) {
        if workingNumber == 0 {
            workingNumber = currentResult
        }
        selectedOperation = operation
    }

    mutating func updateWorkingNumber(with newDigit: Double) {
        if selectedOperation != nil {
            currentResult = workingNumber
            workingNumber = newDigit
        } else {
            workingNumber = workingNumber * 10 + newDigit
        }
    }

    mutating func reset() {
        workingNumber = 0
        currentResult = 0
        selectedOperation = nil
    }
}
