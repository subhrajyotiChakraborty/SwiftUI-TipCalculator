//
//  ContentView.swift
//  TipCalculator
//
//  Created by Subhrajyoti Chakraborty on 20/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var persons = ""
    @State private var tip = 5
    @State private var showDetailsScreen = false
    @State private var tipPerPerson = 0.0
    @State private var totalTipAmount = 0.0
    
    let tips = [5, 10, 15, 20]
    
    func calculateTipPerPerson() {
        let amountStr = amount.trimmingCharacters(in: .whitespacesAndNewlines)
        let personsStr = persons.trimmingCharacters(in: .whitespacesAndNewlines)
        let typedAmount = Double(amountStr) ?? 0
        let typedTotalPersons = Double(personsStr) ?? 0
        
        totalTipAmount = typedAmount + ((typedAmount * Double(tip)) / 100)
        tipPerPerson = (totalTipAmount / typedTotalPersons)
    }
    
    func disableCalculateButton() -> Bool {
        return (persons.trimmingCharacters(in: .whitespacesAndNewlines) == "" || amount.trimmingCharacters(in: .whitespacesAndNewlines) == "")
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section(header: Text("Total Amount").font(.headline)) {
                        TextField("Total amount", text: $amount)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Total Number of Persons").font(.headline)) {
                        TextField("Number of persons", text: $persons)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Tip").font(.headline)) {
                        Picker("Tip Percentage", selection: $tip) {
                            ForEach(tips, id: \.self) {
                                Text("\($0)%")
                            }
                        }
                    }
                    
                    Button(action: {
                        calculateTipPerPerson()
                        showDetailsScreen.toggle()
                    }, label: {
                        Text("Calculate Tip")
                    }).disabled(disableCalculateButton())
                }
            }
            .sheet(isPresented: $showDetailsScreen) {
                DetailsView(tipPerPerson: $tipPerPerson, totalTipAmount: $totalTipAmount)
            }
            .navigationTitle(Text("Tip Calculator"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
