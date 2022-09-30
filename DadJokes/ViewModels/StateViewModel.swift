//
//  StateViewModel.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import Foundation
class StateViewModel : ObservableObject {
    @Published var listContact :[Contact] = []
    
    var client: HTTPSClientProtocal
    
    init(){
        self.client = HttpClientFactory.create()
        getData()
    }
    
    func getData(){
        self.client.getDataToAPI(){ data, error in
            if data != nil {
                DispatchQueue.main.async {
                    self.listContact = data ?? []
                    print("Get data complete")
                }
            }
            else {
                print("Error \(String(describing: error))")
            }
            
        }
    }
    func deletePost(id: String){
        self.client.deletePost(id) { err in
            if err != nil {
                print("Delete Fail")
            }
            print("Delete Success")
            self.getData()
        }
    }
    func postContact(contact:Contact){
        self.client.postContact(contact) { err in
            if err != nil {
                print("Post Fail")
            }
            print("Post Success")
            self.getData()
        }
    }
}
