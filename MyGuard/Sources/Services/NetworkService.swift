//
//  NetworkService.swift
//  MyGuard
//
//  Created by Иван Спирин on 20.06.2025.
//

import Foundation
import NeedleFoundation

typealias Headers = [String: String]

protocol NetworkServiceProtocol {
    func execute<TResult>(for url: URL, _ method: HTTPMethod, _ headers: Headers?) async throws -> TResult
        where TResult: Decodable
    
    func execute<TResult, TBody>(for url: URL, with body: TBody, _ method: HTTPMethod, _ headers: Headers?) async throws -> TResult
        where TResult: Decodable, TBody: Encodable
}

final class NetworkService: Component<NetworkServiceDependency>, NetworkServiceProtocol {
    func execute<TResult>(for url: URL, _ method: HTTPMethod, _ headers: Headers? = nil) async throws -> TResult
        where TResult : Decodable
    {
        let request = createRequest(for: url, method)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(TResult.self, from: data)
    }
    
    func execute<TResult, TBody>(for url: URL, with body: TBody, _ method: HTTPMethod, _ headers: Headers? = nil) async throws -> TResult
        where TResult : Decodable, TBody : Encodable
    {
        let bodyData = try JSONEncoder().encode(body)
        let request = createRequest(for: url, with: bodyData, method)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(TResult.self, from: data)
    }
    
}

// MARK: - Create request extension
extension NetworkService {
    private func createRequest(for url: URL, _ method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        setDefaultHeaders(for: &request)
        
        return request
    }
    
    private func createRequest(for url: URL, with body: Data, _ method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        setDefaultHeaders(for: &request)
        
        return request
    }
}

// MARK: - Add headers
extension NetworkService {
    private func setDefaultHeaders(for request: inout URLRequest) {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
