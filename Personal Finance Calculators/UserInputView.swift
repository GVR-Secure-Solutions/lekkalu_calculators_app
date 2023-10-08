//
//  UserInputView.swift
//  Personal Finance Calculators
//
//  Created by Bharath Kumar Gundala on 09/10/23.
//

import SwiftUI

struct UserInputView: View {
    @Binding var text:String
    @Binding var value:Double
    @Binding var range_min:Double
    @Binding var range_max:Double
    @Binding var step:Double
    
    var body: some View {
        VStack{
            LabeledContent {
                TextField("Enter Principal", value: $value, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()}
        label: {
            Text(text)
        }
        .padding()
//        .background(Color.blue)
            Slider(value: $value,
                   in: $range_min.wrappedValue...$range_max.wrappedValue, step: $step.wrappedValue)
            .padding()
        }
    }
}
#Preview {
    ZStack{
        Rectangle()
            .foregroundColor(Color(red:132/255,green: 102/255,blue: 255/255))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        UserInputView(text: Binding.constant("My Text"), value: Binding.constant(5000000),range_min: Binding.constant(1e5),range_max: Binding.constant(100e5),step: Binding.constant(1e5))
    }
}
