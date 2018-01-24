//
//  APIWrapper.swift
//
//  Created by Filip Husnjak on 2017-11-13.
//  Copyright © 2017 igdb. All rights reserved.
//

import Foundation
import Dispatch

public class APIWrapper {
    
    var API_URL: String = "https://api-2445582011268.apicast.io/"
    let API_KEY: String
    
    public enum Endpoint: String {
        case CHARACTERS, COLLECTIONS, COMPANIES, CREDITS, FEEDS, FRANCHISES, GAME_ENGINES, GAME_MODES, GAMES,
        GENRES, KEYWORDS, PAGES, PEOPLE, PLATFORMS, PLAYER_PERSPECTIVES, PULSE_GROUPS,
        PULSE_SOURCES, PULSES, RELEASE_DATES, REVIEWS, THEMES, TITLES
    }
    
    public enum Version: String {
        case Pro, Standard
    }
    
    public init(API_KEY: String, API_VERSION: Version = .Standard) {
        self.API_KEY = API_KEY
        if API_VERSION == Version.Pro {
            API_URL = API_URL + "pro/"
        }
    }
    
    
    public func getJSON<T: Codable>(url: String, jsonResponse: @escaping ([T]) -> (Void), jsonError: @escaping (Error) -> (Void)){
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: self.API_URL + url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            print(url as Any)
            
            var requestHeader = URLRequest(url: url! as URL)
            requestHeader.httpMethod = "GET"
            requestHeader.setValue(self.API_KEY, forHTTPHeaderField: "user-key")
            requestHeader.setValue("application/json", forHTTPHeaderField: "Accept")
            
            let request = URLSession.shared.dataTask(with: requestHeader){
                data, response, error in
                
                if let data = data{
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    print("request completed with code: \(statusCode)")
                    
                    if statusCode == 200 {
                        do {
                            print("return to completion handler with the data")
                            let jsonResp: [T] = try JSONDecoder().decode([T].self, from: data as Data)
                            DispatchQueue.main.async {
                                jsonResponse(jsonResp)
                            }
                        }catch let error {
                            print("***There was an error Decoding response***")
                            print(error)
                            DispatchQueue.main.async {
                                jsonError(error)
                            }
                        }
                    }
                }else if let error = error {
                    print("***There was an error making the HTTP request***")
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        jsonError(error)
                    }
                }
            }
            request.resume()
        }
    }

    
    public func search<T: Codable>(endpoint: Endpoint, params: Parameters,
                                   onSuccess: @escaping ([T]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: endpoint), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func games(params: Parameters,
                      onSuccess: @escaping ([Game]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func pulses(params: Parameters,
                       onSuccess: @escaping ([Pulse]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func characters(params: Parameters,
                           onSuccess: @escaping ([Character]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CHARACTERS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func collections(params: Parameters,
                            onSuccess: @escaping ([Collection]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COLLECTIONS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func companies(params: Parameters,
                          onSuccess: @escaping ([Company]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COMPANIES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func franchises(params: Parameters,
                           onSuccess: @escaping ([Franchise]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FRANCHISES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func feeds(params: Parameters,
                      onSuccess: @escaping ([Feed]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FEEDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func pages(params: Parameters,
                      onSuccess: @escaping ([Page]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PAGES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func gameEngines(params: Parameters,
                            onSuccess: @escaping ([GameEngine]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_ENGINES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func gameModes(params: Parameters,
                          onSuccess: @escaping ([GameMode]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_MODES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func genres(params: Parameters,
                       onSuccess: @escaping ([Genre]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GENRES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func keywords(params: Parameters,
                         onSuccess: @escaping ([Keyword]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .KEYWORDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func people(params: Parameters,
                       onSuccess: @escaping ([Person]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PEOPLE), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func platforms(params: Parameters,
                          onSuccess: @escaping ([Platform]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLATFORMS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func playerPerspectives(params: Parameters,
                                   onSuccess: @escaping ([PlayerPerspective]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLAYER_PERSPECTIVES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func releaseDates(params: Parameters,
                             onSuccess: @escaping ([ReleaseDate]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .RELEASE_DATES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func pulseGroups(params: Parameters,
                            onSuccess: @escaping ([PulseGroup]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_GROUPS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func pulseSources(params: Parameters,
                             onSuccess: @escaping ([PulseSource]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_SOURCES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func themes(params: Parameters,
                       onSuccess: @escaping ([Theme]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .THEMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func reviews(params: Parameters,
                        onSuccess: @escaping ([Review]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .REVIEWS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func titles(params: Parameters,
                       onSuccess: @escaping ([Title]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .TITLES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    public func credits(params: Parameters,
                        onSuccess: @escaping ([Credit]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CREDITS), jsonResponse: onSuccess, jsonError: onError)
    }
    
}

