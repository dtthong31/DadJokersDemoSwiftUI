//
//  PlusView.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import SwiftUI

struct PlusView: View {
    
    @StateObject var dolarVM = DolarViewModal()
    
    var body: some View {
        VStack{
            Form{
                VStack(spacing:16){
                    Text("\(dolarVM.convertText)").accessibilityIdentifier("ViewResult")
                TextField("Enter a value", text: $dolarVM.textvalue)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .submitLabel(.done)
                        .accessibilityIdentifier("InputDolar")
                    Button("Submit", action: dolarVM.convertMoney)
                        .buttonStyle(.borderedProminent)
                        .accessibilityIdentifier("Submit")
                        
                }.padding()
            }
            Text("List Item Convert").font(.title)
            List{
                ForEach(dolarVM.listConvert, id: \.self){ item in
                    Text(item)
                }
            }.padding()
                
            
        }
        
    }
}

struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        PlusView()
    }
}
