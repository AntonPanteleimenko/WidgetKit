//
//  CoronaLoader.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import Foundation

public class CoronaLoader {
    
    enum CovidApiError: Error {
        case invalidURL
        case invalidSerialization
        case badHTTPResponse
        case error(NSError)
        case noData
    }
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func getData(completion: @escaping (Result<[JSONModel], CovidApiError>) -> ()) {
        
        let urlString = "https://covid19-api.com/country?name=Ukraine&format=json"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.error(error as NSError)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                completion(.failure(.badHTTPResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let model = try self.jsonDecoder.decode([JSONModel].self, from: data)
                completion(.success(model))
            } catch let error as NSError{
                print(error.localizedDescription)
                completion(.failure(.invalidSerialization))
            }
        }.resume()
    }
}
