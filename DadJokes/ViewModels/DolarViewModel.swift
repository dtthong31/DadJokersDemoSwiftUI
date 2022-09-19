//
//  DolarViewModel.swift
//  DadJokes
//
//  Created by dtthong on 09/08/2022.
//

import Foundation
import UIKit

class DolarViewModal : ObservableObject{
    @Published var textvalue = ""
    @Published var convertText = "$0"
    @Published var listConvert:[String] = []
    
    private let converter = Converters()
    
    func convertMoney(){
        self.convertText = converter.convertVNtoUSD(vnd: textvalue)
        
        do{
            try converter.saveMoneyConverters(item: self.convertText)
        } catch {
            print("error")
        }
        self.listConvert = converter.arrayString
        self.hideKeyboard()
    }
    private func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

class Converters {
    var arrayString: [String] = []
    enum DataError :LocalizedError {
        case noData
        case itemNotFound
        case itemExist
    }
    func convertVNtoUSD(vnd: String)-> String{
        let usdRate = 1.0
        let vndRate = 23281.6
        let vndValue = Double(vnd) ?? 0
        
//        if vnd.isInt {
            if vndValue <  0 {
                return "Please enter a positive number."
            }
            if vndValue > 1000000000000 {
                return "Value too big to convert."
            }
            return "$\(String(format: "%.2f", (vndValue/vndRate) * usdRate))"
//        }
//        else {
//            return "Please enter number."
//        }
    }
    func saveMoneyConverters(item: String) throws{
        guard !item.isEmpty else {
            throw DataError.noData
        }
        let isExistItem = arrayString.first(where: {$0 == item})
        if (isExistItem == nil){
            self.arrayString.append(item)
        } else {
            print("Item existed.")
            throw DataError.itemExist
        }
    }
    
    
}
extension String {
    var isInt: Bool {
        return Double(self) != nil
    }
}
