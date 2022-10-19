//
//  HTTPSClientProtocal.swift
//  DadJokes
//
//  Created by dtthong on 11/10/2022.
//

import Foundation

protocol HTTPSClientProtocal {
    func getDataToAPI(completionHandler: @escaping ([Contact]?,Error?) -> Void)
    func deleteItem(id: String,completionHandler: @escaping (Error?) -> Void)
    func postItem(contact: PostContact,completionHandler: @escaping (Contact?,Error?) -> Void)
}
