//
//  DetailsView.swift
//  TipCalculator
//
//  Created by Subhrajyoti Chakraborty on 20/03/21.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var tipPerPerson: Double
    @Binding var totalTipAmount: Double
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Total amount is \(String(format: "%.2f", totalTipAmount))")
                Text("Tip per person is \(String(format: "%.2f", tipPerPerson))")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done")
            }))
            .navigationTitle(Text("Details"))
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(tipPerPerson: .constant(50.0), totalTipAmount: .constant(100.0))
    }
}
