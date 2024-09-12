//
//  CalculatorCloneApp.swift
//  CalculatorClone
//
//  Created by Rahul on 9/12/24.
//

import SwiftUI

@main
struct CalculatorCloneApp: App {
    @State var calculator = CalculatorBridge() // ViewModel

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(calculator)
        }
    }
}
