//
//  API Handler.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import Foundation

enum CustomError: Error {
    case invalidRequest
    case invalidData
    case invalidUrl
    case invalidResponse
}

class APIHandler {
    func request<T: Codable>(endpoint: String, method: String, completion: @escaping ((Result<T, APIError>) -> Void)) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.internalError))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        call(with: request, completion: completion)
    }
    
    func fetchPokemonNames(completion: @escaping (Result<PokemonHomeModel, Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=100")!
        let task = URLSession.shared.dataTask(with: url) { date, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
        }
    }
    private func call<T: Codable>(with request: URLRequest, completion: @escaping ((Result<T, APIError>)-> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) {data, _, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            do {
                guard let data else {
                    DispatchQueue.main.async {
                        completion(.failure(.serverError))
                    }
                    return
                }
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(.parsingError))
                }
            }
        }
        dataTask.resume()
    }
}
