//
//  IGDBWrapper.swift
//  Lets users access IGDB API with swift
//  Returns the responses in pre-constructed stucts.
//
//  Created by Filip on 2017-11-13.
//  Copyright © 2017 igdb. All rights reserved.
//

import Foundation
import Dispatch

public class IGDBWrapper {
    
    var API_URL: String = "https://api-endpoint.igdb.com/"
    let apiKey: String
    var debug: Bool!
    var request: URLSessionDataTask?
    
    /**
        Init prepares the wrapper with the neccessary information such as the API key.
     
        @param apiKey       The 3Scale api key.
        @param apiVersion   The version of the api to be used, Standard or Pro.
        @param debug        Displays debug prints, queries.
    **/
    public init(apiKey: String, apiVersion: UserVersion = .Standard, debug: Bool = false) {
        self.apiKey = apiKey
        if apiVersion == UserVersion.Pro {
            API_URL = API_URL + "pro/"
        }
        
        self.debug = debug
    }
    
    /**
        This method returns a struct of the requested type with the specified data requested,
        with this method you can request any kind of data from the IGDB API using custom urls.
     
        @param url              The url stands for the query, except for the standard 3Scale url,
                                where the requested data is specified.
        @param method           The method type selected.
        @param body             The data used in the request, used for POST and PATCH.
        @param requestHeaders   Add custom request headers if neccessary.
        @param jsonResponse     The response from the request, the struct type is set by the user.
        @param jsonError        The error response from the request.
    */
    public func getJSON<T: Codable>(url: String, method: HttpMethod = .GET, body: Data? = nil, requestHeaders: URLRequest? = nil, jsonResponse: @escaping (T) -> (Void), jsonError: @escaping (Error) -> (Void)){
        DispatchQueue.global(qos: .userInitiated).async {
            let url = URL(string: self.API_URL + url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            self.printMsg(msg: "\(url!)", error: nil)
            
            var requestHeader: URLRequest!
            if requestHeaders != nil { // Custom headers for requests
                requestHeader = requestHeaders
                requestHeader.url = (url! as URL)
                
            } else { // Standard Headers for requests
                requestHeader = URLRequest(url: url! as URL)
                requestHeader.httpBody = body
                requestHeader.httpMethod = method.rawValue
                requestHeader.setValue(self.apiKey, forHTTPHeaderField: "user-key")
                requestHeader.setValue("application/json", forHTTPHeaderField: "Accept")
            }
            
            self.request = URLSession.shared.dataTask(with: requestHeader){
                data, response, error in
                
                if let data = data{
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    self.printMsg(msg: "request completed with code: \(statusCode)", error: nil)
                    
                    if statusCode == 200 {
                        do {
                            self.printMsg(msg: "return to completion handler with the data", error: nil)
                            let jsonResp: T = try JSONDecoder().decode(T.self, from: data as Data)
                            
                            DispatchQueue.main.async {
                                jsonResponse(jsonResp)
                            }
                        }catch let error {
                            self.printMsg(msg: "***There was an error Decoding response***", error: error)

                            DispatchQueue.main.async {
                                jsonError(APIError(statusCode: statusCode, msg: "There was an error decoding the response!", error: error))
                            }
                        }
                    } else {
                        let apiError = APIError(statusCode: statusCode, msg: "The status code was not 200 OK! it was \(statusCode)", error: nil)
                        self.printMsg(msg: "The status code was not 200 OK!", error: error)
                        
                        DispatchQueue.main.async {
                            jsonError(apiError)
                        }
                    }
                }else if let error = error {
                    self.printMsg(msg: "***There was an error making the HTTP request***", error: error)

                    DispatchQueue.main.async {
                        jsonError(error)
                    }
                }
            }
            self.request?.resume()
        }
    }
    
    // Checks if debug mode on, and prints.
    private func printMsg(msg: String, error: Error?) {
        if self.debug {
            print(msg)
            if error != nil {
                print(error!)
            }
        }
    }
    
    // Stops the requests
    public func stopCurrentTask() {
        request?.cancel()
    }

    /**
        Search the IGDB API for information
     *
        @param endpoint      Apply for which Endpoint to search in.
        @param params        Params are the arguments, Ex: search query, fields, order etc.
        @param onSuccess     Closure which gets activated as soon as the struct is returned from the API.
        @param onError       Closure which gets activated if the request fails.
     */
    public func search<T: Codable>(endpoint: Endpoint, params: Parameters,
                                   onSuccess: @escaping ([T]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: endpoint), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
        Games method returns a list of Game structs containing the game information requested.
     
        @param params       The arguments added to specify the result, Ex parameters.addFilter("[cover][exists]")
        @param onSuccess    Closure which gets activated as soon as the struct is returned from the API.
        @param onError      Closure which gets activated if the request fails.
    */
    public func games(params: Parameters,
                      onSuccess: @escaping ([Game]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
        Pulse method returns a list of Pulse Structs containing the pulse information requested.
     
        @param params       The arguments added to specify the result.
        @param onSuccess    Closure which gets activated as soon as the struct is returned from the API.
        @param onError      Closure which gets activated if the request fails.
    */
    public func pulses(params: Parameters,
                       onSuccess: @escaping ([Pulse]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Character method returns a list of Character Structs containing the character information requested.
     
     @param params      The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func characters(params: Parameters,
                           onSuccess: @escaping ([Character]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CHARACTERS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Collection method returns a list of Collection Structs containing the collection information requested.
     
     @param params      The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func collections(params: Parameters,
                            onSuccess: @escaping ([Collection]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COLLECTIONS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Company method returns a list of Company Structs containing the comapny information requested.
     
     @param params      The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func companies(params: Parameters,
                          onSuccess: @escaping ([Company]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .COMPANIES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Franshise method returns a list of Franchise Structs containing the franchise information requested.
     
     @param params      The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func franchises(params: Parameters,
                           onSuccess: @escaping ([Franchise]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FRANCHISES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Feed method returns a list of Feed Structs containing the feed information requested.
     
     @param params      The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func feeds(params: Parameters,
                      onSuccess: @escaping ([Feed]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .FEEDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Page method returns a list of Page Structs containing the page information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func pages(params: Parameters,
                      onSuccess: @escaping ([Page]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PAGES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Game Engine method returns a list of GameEngine Structs containing the game engine information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func gameEngines(params: Parameters,
                            onSuccess: @escaping ([GameEngine]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_ENGINES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Game Mode method returns a list of GameMode Structs containing the game mode information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func gameModes(params: Parameters,
                          onSuccess: @escaping ([GameMode]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GAME_MODES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Genre method returns a list of Genre Structs containing the genre information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func genres(params: Parameters,
                       onSuccess: @escaping ([Genre]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .GENRES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Keyword method returns a list of Keyword Structs containing the keyword information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func keywords(params: Parameters,
                         onSuccess: @escaping ([Keyword]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .KEYWORDS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     People method returns a list of People Structs containing the people information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func people(params: Parameters,
                       onSuccess: @escaping ([Person]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PEOPLE), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Platform method returns a list of Platform Structs containing the platform information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func platforms(params: Parameters,
                          onSuccess: @escaping ([Platform]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLATFORMS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Player Perspective method returns a list of PLayerPerspective Structs containing the player perspective information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
     */
    public func playerPerspectives(params: Parameters,
                                   onSuccess: @escaping ([PlayerPerspective]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PLAYER_PERSPECTIVES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Release Date method returns a list of ReleaseDate Structs containing the release date information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func releaseDates(params: Parameters,
                             onSuccess: @escaping ([ReleaseDate]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .RELEASE_DATES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Pulse Group method returns a list of PulseGroup Structs containing the pulse group information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func pulseGroups(params: Parameters,
                            onSuccess: @escaping ([PulseGroup]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_GROUPS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Pulse Source method returns a list of PulseSource Structs containing the pulse source information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func pulseSources(params: Parameters,
                             onSuccess: @escaping ([PulseSource]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .PULSE_SOURCES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Theme method returns a list of Theme Structs containing the theme information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func themes(params: Parameters,
                       onSuccess: @escaping ([Theme]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .THEMES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Review method returns a list of Review Structs containing the review information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func reviews(params: Parameters,
                        onSuccess: @escaping ([Review]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .REVIEWS), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Title method returns a list of Title Structs containing the title information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func titles(params: Parameters,
                       onSuccess: @escaping ([Title]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .TITLES), jsonResponse: onSuccess, jsonError: onError)
    }
    
    /**
     Credit method returns a list of Credit Structs containing the credit information requested.
     
     @param param       The arguments added to specify the result.
     @param onSuccess   Closure which gets activated as soon as the struct is returned from the API.
     @param onError     Closure which gets activated if the request fails.
    */
    public func credits(params: Parameters,
                        onSuccess: @escaping ([Credit]) -> (Void), onError: @escaping (Error) -> (Void)){
        getJSON(url: params.buildQuery(endpoint: .CREDITS), jsonResponse: onSuccess, jsonError: onError)
    }
    
}

