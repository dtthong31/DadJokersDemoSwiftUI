//
//  HttpClientFactory.swift
//  DadJokes
//
//  Created by dtthong on 11/10/2022.
//

import Foundation

class HttpClientFactory {
    static func create() -> HTTPSClientProtocal {
        return HTTPsClient()
    }
}
