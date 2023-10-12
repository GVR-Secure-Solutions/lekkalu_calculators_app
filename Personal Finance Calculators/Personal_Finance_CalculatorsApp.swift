//
//  Personal_Finance_CalculatorsApp.swift
//  Personal Finance Calculators
//
//  Created by Bharath Kumar Gundala on 08/10/23.
//

import SwiftUI

@main
struct Personal_Finance_CalculatorsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                List {
                    NavigationLink("Loan EMI", destination: EmiCalculatorView())
                    NavigationLink("SIP Returns", destination: SipCalculatorView())
                }
                .listStyle(SidebarListStyle())
                
                Text("Select a view")
                    .font(.headline)
            }
        }
    }
}
