//
//  CalculatorButton.swift
//  CalculatorClone
//
//  Created by Rahul on 9/12/24.
//

import SwiftUI

struct CalculatorButton: View {
    @Environment(CalculatorBridge.self) var calculator

    let value: CalculatorBridge.ViewElement
    let circular: Bool

    init (_ value: CalculatorBridge.ViewElement, circular: Bool = true) {
        self.value = value
        self.circular = circular
    }

    var body: some View {
        Button {
            withAnimation(value.shouldAnimate() ? .bouncy : .none) {
                calculator.actionFor(viewElement: value)
            }
        } label: {
            Capsule(style: .circular)
                .overlay {
                    Text(value.description())
                        .font(.title)
                        .foregroundStyle(.white)
                }
        }
        .frame(height: 75)
        .frame(width: circular ? 75 : nil)
    }
}
