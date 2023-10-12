//
//  ContentView.swift
//  Personal Finance Calculators
//
//  Created by Bharath Kumar Gundala on 08/10/23.
//

import SwiftUI

struct EmiCalculatorView: View {
    @State private var principal:Double = 5000000
    @State private var interest_rate:Double = 9
    @State private var tenure:Double = 20
    @State private var emi:Double = 44986
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
                    Text("EMI Calculator")
                        .font(.largeTitle)
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        
                Spacer()
                ScrollView {
                    VStack {
                        
                        UserInputView(text: Binding.constant("Principal"), value: $principal,
                                      range_min: Binding.constant(1e5),range_max: Binding.constant(100e5),
                                      step: Binding.constant(1e5))
                        
                        UserInputView(text: Binding.constant("Interest Rate"), value:$interest_rate,
                                      range_min: Binding.constant(1),range_max: Binding.constant(60),
                                      step: Binding.constant(1))
                        
                        UserInputView(text: Binding.constant("Tenure"), value: $tenure,
                                      range_min: Binding.constant(1),range_max: Binding.constant(60),
                                      step: Binding.constant(1))
                        
                        Text("EMI: " + String(format: "%.2f", emi))
                        NavigationLink("Go to SIP Calculator", destination: SipCalculatorView())
                    }
                    .onChange(of: principal) {
                        calculateEMI()
                    }
                    .onChange(of: interest_rate) {
                        calculateEMI()
                    }
                    .onChange(of: tenure) {
                        calculateEMI()
                    }
                    .onAppear {
                        calculateEMI()
                    }
                }
            }
        }
    }
    
    private func calculateEMI() {
        let monthlyInterestRate = interest_rate / 12 / 100
        let numberOfPayments = tenure * 12
        
        if numberOfPayments > 0 && monthlyInterestRate > 0 {
            let emi = principal * monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfPayments) / (pow(1 + monthlyInterestRate, numberOfPayments) - 1)
            self.emi = emi
        } else {
            self.emi = 0
        }
    }
}



#Preview {
    EmiCalculatorView()
}
