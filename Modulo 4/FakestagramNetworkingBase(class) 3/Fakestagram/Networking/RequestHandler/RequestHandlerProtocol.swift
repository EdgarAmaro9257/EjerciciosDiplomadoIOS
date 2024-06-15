//
//  RequestHandlerProtocol.swift
//  Fakestagram
//
//  Created by Grecia Escárcega on 15/06/24.
//

import Foundation

protocol RequestHandlerProtocol {
    var urlSession: URLSession { get }
    func get<T: Decodable>(_ endpoint: EndpointProtocol, handler: @escaping (Result<T, Error>) -> Void)
}
