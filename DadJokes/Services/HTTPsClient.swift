//
//  HTTPsClient.swift
//  DadJokes
//
//  Created by dtthong on 11/10/2022.
//

import Foundation
class HTTPsClient: HTTPSClientProtocal {
   
    enum ErrorResponse : Error {
        case DataError
        case ResponseFail
    }
    func getDataToAPI(completionHandler: @escaping ([Contact]?,Error?) -> Void){
        guard let url = URL(string: "https://6305a846dde73c0f84493723.mockapi.io/userData")else {
            completionHandler(nil, ErrorResponse.DataError)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data else {
                print("Call data error")
                return
            }
            let contactList = try! JSONDecoder().decode([Contact].self, from: data)
            DispatchQueue.main.async {
                print("Call api success")
                completionHandler(contactList, nil)
            }
        }
        task.resume()
    }
    func deleteItem(id: String,completionHandler: @escaping (Error?) -> Void){
        guard let url = URL(string: "https://6305a846dde73c0f84493723.mockapi.io/userData/\(id)")else {
            completionHandler(ErrorResponse.DataError)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            guard data != nil else {
                print("Call data error")
                return
            }
            if err != nil {
                completionHandler(nil)
            }
            else {
                completionHandler(ErrorResponse.ResponseFail)
            }
            
        }
        task.resume()
    }
    func postItem(contact: PostContact, completionHandler: @escaping (Contact?, Error?) -> Void){
        guard let url = URL(string: "https://6305a846dde73c0f84493723.mockapi.io/userData")else {
            completionHandler(nil, ErrorResponse.DataError)
            return
        }
        let data = try! JSONEncoder().encode(contact)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            
            if let data = data {
                let contact = try! JSONDecoder().decode(Contact.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(contact, ErrorResponse.DataError)
                }
            }
            else {
                completionHandler(nil,ErrorResponse.ResponseFail)
            }
            
        }
        task.resume()
    }
}
