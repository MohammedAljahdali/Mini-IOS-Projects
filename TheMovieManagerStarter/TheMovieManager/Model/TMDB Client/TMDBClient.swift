//
//  TMDBClient.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation

class TMDBClient {
    
    static let apiKey = "83e6c1d9fac15ba96b32f29a2bcfd17f"
    
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum Endpoints {
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(TMDBClient.apiKey)"
        
        case getWatchlist
        case getRequestToken
        case getLogin
        case getSession
        case webAuth
        case logout
        case getFavoriteList
        case getSearchResults(query: String)
        
        var stringValue: String {
            switch self {
            case .getWatchlist: return Endpoints.base + "/account/\(Auth.accountId)/watchlist/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .getRequestToken: return Endpoints.base + "/authentication/token/new" + Endpoints.apiKeyParam
            case .getLogin: return Endpoints.base + "/authentication/token/validate_with_login" + Endpoints.apiKeyParam
            case .getSession: return Endpoints.base + "/authentication/session/new" + Endpoints.apiKeyParam
            case .webAuth: return "https://www.themoviedb.org/authenticate/\(Auth.requestToken)?redirect_to=themoviemanager:authenticate"
            case .logout: return Endpoints.base + "/authentication/session" + Endpoints.apiKeyParam
            case .getFavoriteList: return Endpoints.base + "/account/\(Auth.accountId)/favorite/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .getSearchResults(let query): return Endpoints.base + "/search/movie" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func GETRequest<ResponseType: Codable>(url: URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {DispatchQueue.main.async {completion(nil, error)}; return}
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {completion(object, nil)}
            } catch {DispatchQueue.main.async {completion(nil, error)}}
        }
        task.resume()
    }
    
    class func GETRequest<ResponseType: Codable>(request: URLRequest, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {DispatchQueue.main.async {completion(nil, error)}; return}
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {completion(object, nil)}
            } catch {DispatchQueue.main.async {completion(nil, error)}}
        }
        task.resume()
    }
    
    class func POSTRequest<RequestType: Encodable>(url: URL, body: RequestType, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    class func logout(complettion: @escaping () -> Void) {
        let request = POSTRequest(url: Endpoints.logout.url, body: LogoutRequest(session_id: Auth.sessionId), method: "DELETE")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            Auth.requestToken = ""
            Auth.sessionId = ""
            complettion()
        }
        task.resume()
    }
    
    class func createSession(completion: @escaping (Bool, Error?) -> Void) {
        let request = POSTRequest(url: Endpoints.getSession.url, body: PostSession(request_token: Auth.requestToken), method: "POST")
        GETRequest(request: request, response: SessionResponse.self) { (response, error) in
            if let  response = response {
                Auth.sessionId = response.sessionId
                print(response.sessionId+"11")
                DispatchQueue.main.async{completion(true, nil)}
            } else {completion(false, error)}
        }
    }
    
    class func login(completion: @escaping (Bool, Error?) -> Void, username: String, password: String) {
        let request = POSTRequest(url: Endpoints.getLogin.url, body: LoginRequest(username: username, password: password, requestToken: Auth.requestToken), method: "POST")
        GETRequest(request: request, response: RequestTokenResponse.self) { (response, error) in
            if let response = response {
                print(response.request_token+"22")
                Auth.requestToken = response.request_token
                completion(true, nil)
            } else {completion(false, error)}
        }
    }
    
    class func requestToken(completion: @escaping (Bool, Error?)-> Void) {
        GETRequest(url: Endpoints.getRequestToken.url, response: RequestTokenResponse.self) { (response, error) in
            if let response = response {
                print(response.request_token+"hello")
                Auth.requestToken = response.request_token
                completion(true, nil)
            } else {DispatchQueue.main.async{completion(false, error)}}
        }
    }
    
    class func getWatchlist(completion: @escaping ([Movie], Error?) -> Void) {
        GETRequest(url: Endpoints.getWatchlist.url, response: MovieResults.self) { (response, error) in
            if let response = response {
                completion(response.results, nil)
            } else {completion([], error)}
        }
    }
    
    class func getFavoriteList(completion: @escaping ([Movie], Error?) -> Void) {
        GETRequest(url: Endpoints.getFavoriteList.url, response: MovieResults.self) { (response, error) in
            if let response = response {
                completion(response.results,nil)
            } else {completion([], error)}
        }
    }
    
    class func getSearchResults(query: String, completion: @escaping ([Movie], Error?) -> Void) {
        GETRequest(url: Endpoints.getSearchResults(query: query).url, response: MovieResults.self) { (response, error) in
            if let response = response {
                completion(response.results, nil)
            } else {completion([], error)}
        }
    }
}
