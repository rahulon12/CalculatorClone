//
//  ContentView.swift
//  CalculatorClone
//
//  Created by Rahul on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var calculator = CalculatorBridge()

    var body: some View {
        VStack {
            Spacer()
            Text(currentDisplayValue)
                .contentTransition(.numericText())
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.trailing)
            Grid {
                GridRow {
                    Group {
                        CalculatorButton(.reset)
                        CalculatorButton(.toggleSign)
                        CalculatorButton(.makePercentage)
                    }
                    .tint(.gray)

                    CalculatorButton(.operation(.divide))
                        .tint(.orange)
                }

                GridRow {
                    ForEach(7..<10) { i in CalculatorButton(.value(i))
                    }
                    CalculatorButton(.operation(.multiply))
                        .tint(.orange)
                }

                GridRow {
                    ForEach(4..<7) { i in CalculatorButton(.value(i)) }
                    CalculatorButton(.operation(.subtract))
                        .tint(.orange)
                }

                GridRow {
                    ForEach(1..<4) { i in
                        CalculatorButton(.value(i))
                    }
                    CalculatorButton(.operation(.add))
                        .tint(.orange)
                }

                GridRow {
                    CalculatorButton(.value(0), circular: false)
                        .gridCellAnchor(.leading)
                        .gridColumnAlignment(.leading)
                        .gridCellColumns(2)
                        .frame(width: 150)

                    CalculatorButton(.custom("."))
                    CalculatorButton(.equals)
                        .tint(.orange)
                }
            }
        }
        .environment(calculator)
        .tint(.init(uiColor: .darkGray))
        .background()
        .environment(\.colorScheme, .dark)
    }

    private var currentDisplayValue: String {
        if calculator.calculatorBrain.workingNumber != 0 {
            "\(calculator.calculatorBrain.workingNumber)"
        } else {
            "\(calculator.calculatorBrain.currentResult)"
        }
    }
}

#Preview {
    ContentView()
}
