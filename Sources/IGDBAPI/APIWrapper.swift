//
//  APIWrapper.swift
//  APIWrapperPlayground
//
//  Created by Filip Husnjak on 2017-11-13.
//  Copyright © 2017 igdb. All rights reserved.
//

import Foundation
import Dispatch

class APIWrapper {
    
    let API_URL: String = "https://api-2445582011268.apicast.io/"
    let API_KEY: String
    
    enum Endpoint: String {
        case CHARACTERS, COLLECTIONS, COMPANIES, CREDITS, FEEDS, FRANCHISES, GAME_ENGINES, GAME_MODES, GAMES,
        GENRES, KEYWORDS, PAGES, PEOPLE, PLATFORMS, PLAYER_PERSPECTIVES, PULSE_GROUPS,
        PULSE_SOURCES, PULSES, RELEASE_DATES, REVIEWS, THEMES, TITLES
    }
    
    init(API_KEY: String) {
        self.API_KEY = API_KEY
    }
    
    func getJSON(url: String, jsonResponse: @escaping ([[String: AnyObject]]) -> (Void), jsonError: @escaping (Error) -> (Void)){
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
                        print("return to completion handler with the data")
                        let jsonArray = self.parse(data: data as Data)
                        DispatchQueue.main.async {
                            jsonResponse(jsonArray!)
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
    
    func parse (data: Data) -> [[String: AnyObject]]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as! [[String: AnyObject]]
            return json
        } catch let parseError {
            print("There was an error parsing the JSON: \"\(parseError.localizedDescription)\"")
        }
        return nil
    }
    
    func search(endpoint: Endpoint, params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: endpoint), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func games(params: Parameters,
               onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func pulses(params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func characters(params: Parameters,
                    onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CHARACTERS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func collections(params: Parameters,
                     onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COLLECTIONS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func companies(params: Parameters,
                   onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COMPANIES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func franchises(params: Parameters,
                    onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FRANCHISES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func feeds(params: Parameters,
               onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FEEDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func pages(params: Parameters,
               onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PAGES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func gameEngines(params: Parameters,
                     onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_ENGINES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func gameModes(params: Parameters,
                   onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_MODES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func genres(params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GENRES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func keywords(params: Parameters,
                  onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .KEYWORDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func people(params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PEOPLE), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func platforms(params: Parameters,
                   onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLATFORMS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func playerPerspectives(params: Parameters,
                            onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLAYER_PERSPECTIVES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func releaseDates(params: Parameters,
                      onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .RELEASE_DATES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func pulseGroups(params: Parameters,
                     onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_GROUPS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func pulseSources(params: Parameters,
                      onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_SOURCES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func themes(params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .THEMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func reviews(params: Parameters,
                 onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .REVIEWS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func titles(params: Parameters,
                onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .TITLES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    func credits(params: Parameters,
                 onSuccess: @escaping ([[String: AnyObject]]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CREDITS), jsonResponse: onSuccess, jsonError: onError)
    }
    
}

