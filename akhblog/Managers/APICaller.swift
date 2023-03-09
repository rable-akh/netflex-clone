//
//  APICaller.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 12/02/2023.
//

import Foundation

struct Constrants {
    static let APIKey = "38c6083fe649f03a5170d4069296596c"
    static let BaseUrl = "https://api.themoviedb.org/3"
}

enum APIError: Error {
    case failToGetData
}

class APICaller {
    static let shared = APICaller()
        
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constrants.BaseUrl)/trending/movie/week?api_key=\(Constrants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _,error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constrants.BaseUrl)/trending/tv/week?api_key=\(Constrants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func getUpcomingMovie(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constrants.BaseUrl)/movie/upcoming?api_key=\(Constrants.APIKey)") else {return}
        // query = language, page, region
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopularMovie(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constrants.BaseUrl)/movie/popular?api_key=\(Constrants.APIKey)") else {return}
        // query = language, page, region
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constrants.BaseUrl)/movie/top_rated?api_key=\(Constrants.APIKey)") else {return}
        // query = language, page, region
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    //3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
    func getDiscoverMovie(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constrants.BaseUrl)/discover/movie?api_key=\(Constrants.APIKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constrants.BaseUrl)/search/movie?api_key=\(Constrants.APIKey)&query=\(query)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
}
