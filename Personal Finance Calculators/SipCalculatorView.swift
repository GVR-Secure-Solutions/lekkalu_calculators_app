//
//  ContentView.swift
//  Personal Finance Calculators
//
//  Created by Bharath Kumar Gundala on 08/10/23.
//

import SwiftUI

struct SipCalculatorView: View {
    
    @State private var monthly_investment:Double = 50000
    @State private var annual_returns:Double = 9
    @State private var tenure:Double = 20
    
    @State private var absolute_returns:Double = 449860
    @State private var absolute_roi:Double = 18
    @State private var investment:Double = 5000000
    @State private var maturity:Double = 5449860
    var body: some View {
        // Main App background
        ZStack{
            // Main App content
            Rectangle()
                .foregroundColor(.blue)
                .ignoresSafeArea()
                .background(.purple)
            Rectangle()
                .foregroundColor(.black)
            VStack{
                // App heading
                Text("SIP Returns Calculator")
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                
                Spacer()
                ScrollView {
                    VStack {
                        
                        UserInputView(text: Binding.constant("Monthly Investment"), value: $monthly_investment,
                                      range_min: Binding.constant(1e4),range_max: Binding.constant(100e4),
                                      step: Binding.constant(1e4))
                        
                        UserInputView(text: Binding.constant("Expected Returns %"), value:$annual_returns,
                                      range_min: Binding.constant(1),range_max: Binding.constant(60),
                                      step: Binding.constant(1))
                        UserInputView(text: Binding.constant("Tenure (Yrs)"), value: $tenure,
                                      range_min: Binding.constant(1),range_max: Binding.constant(60),
                                      step: Binding.constant(1))
                        Text("Absolute Returns: " + String(format: "%.2f", absolute_returns))
                        Text("Absolute Return on Investment: " + String(format: "%.2f", absolute_roi ) + "%")
                        Text("Investment Total: " + String(format: "%.2f", investment))
                        Text("Maturity Value: " + String(format: "%.2f", maturity))
                    }
                    .onChange(of: monthly_investment) {
                        calculate_sip_returns()
                    }
                    .onChange(of: annual_returns) {
                        calculate_sip_returns()
                    }
                    .onChange(of: tenure) {
                        calculate_sip_returns()
                    }
                    .onAppear {
                        calculate_sip_returns()
                    }
                }
            }
        }
    }
    
    private func calculate_sip_returns() {
        let monthly_returns = annual_returns / 12.0
        investment = monthly_investment * Double(tenure) * 12
        var future_value = 0.0
        
        for _ in 0..<Int(tenure) {
            for _ in 0..<12 {
                future_value += future_value * (monthly_returns/100) + monthly_investment
            }
        }
        
        maturity = future_value
        absolute_returns = maturity - investment
        absolute_roi = (absolute_returns / investment) * 100.0
        print("maturity "+String(maturity)+" investment: "+String(investment)+" absolute_roi: "+String(absolute_roi)+" absolute_returns: "+String(absolute_returns))
    }
}



#Preview {
    SipCalculatorView()
}
