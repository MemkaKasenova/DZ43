//
//  Network.swift
//  DZ43
//
//  Created by merim kasenova on 26/4/23.
//

import Foundation

final class Network{
    static let shared = Network()
    let baseUrl = URL(string: "https://dummyjson.com/products")!
    
    func fethData() async throws -> Product{
        let (data,_) = try await URLSession.shared.data(from: baseUrl)
        return try await decodedate(data: data)
    }
    
    private func decodedate<T:Decodable>(data:Data) async throws -> T{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
