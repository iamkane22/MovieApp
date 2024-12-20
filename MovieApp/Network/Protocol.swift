//
//  Protocol.swift
//  BankingAppKenan
//
//  Created by Kenan on 20.12.24.
//

protocol endPointProtocol {
    var baseURL: String { get }
    var genreURL: String { get }
    var apiKey: String { get }
    var method: HttpMethods { get }
    
    func movieAPIUrlString() -> String
}
