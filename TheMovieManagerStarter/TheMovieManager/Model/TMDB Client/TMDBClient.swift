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
        
        var stringValue: String {
            switch self {
            case .getWatchlist: return Endpoints.base + "/account/\(Auth.accountId)/watchlist/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .getRequestToken: return Endpoints.base + "/authentication/token/new" + Endpoints.apiKeyParam
            case .getLogin: return Endpoints.base + "/authentication/token/validate_with_login" + Endpoints.apiKeyParam
            case .getSession: return Endpoints.base + "/authentication/session/new" + Endpoints.apiKeyParam
            case .webAuth: return "https://www.themoviedb.org/authenticate/\(Auth.requestToken)?redirect_to=themoviemanager:authenticate"
            case .logout: return Endpoints.base + "/authentication/session" + Endpoints.apiKeyParam
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func logout(complettion: @escaping () -> Void) {
        var request = URLRequest(url: Endpoints.logout.url)
        request.httpMethod = "DELETE"
        request.httpBody = try! JSONEncoder().encode(LogoutRequest(session_id: Auth.sessionId))
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            complettion()
        }
        task.resume()
        Auth.requestToken = ""
        Auth.sessionId = ""
    }
    
    class func session(completion: @escaping (Bool, Error?) -> Void) {
       var request = URLRequest(url: Endpoints.getSession.url)
        let body = PostSession(request_token: Auth.requestToken)
        print(body)
       request.httpMethod = "POST"
       request.httpBody = try! JSONEncoder().encode(body)
        print(try! JSONDecoder().decode(PostSession.self, from: request.httpBody!))
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           guard let data = data else {print("requestLogin task error"); completion(false, error); return}
        print(data)
           let decoder = JSONDecoder()
           do {
            print("hey")
                let requestObject = try decoder.decode(SessionResponse.self, from: data)
                Auth.sessionId = requestObject.sessionId
                completion(true, nil)
           } catch { print(error.localizedDescription); completion(false, error); return }
       }
       task.resume()
    }
    
    class func requestLogin(completion: @escaping (Bool, Error?) -> Void, username: String, password: String) {
        var request = URLRequest(url: Endpoints.getLogin.url)
        let login = LoginRequest(username: username, password: password, requestToken: Auth.requestToken)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(login)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {print("requestLogin task error"); completion(false, error); return}
            let decoder = JSONDecoder()
            do {
                let requestObject = try decoder.decode(RequestTokenResponse.self, from: data)
                Auth.requestToken = requestObject.request_token
                completion(true, nil)
            } catch { print("requestLogin 2"); completion(false, error); return }
        }
        task.resume()
    }
    
    class func requestToken(completion: @escaping (Bool, Error?)-> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getRequestToken.url) { (data, response, error) in
            guard let data = data else {print("request token error"); completion(false, error); return}
            let decoder = JSONDecoder()
            do {
                let token = try decoder.decode(RequestTokenResponse.self, from: data)
                Auth.requestToken = token.request_token
                completion(true, nil)
            } catch {
                print("request Token error 1")
                completion(false, error)
            }
        }
        task.resume()
    }
    
    class func getWatchlist(completion: @escaping ([Movie], Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getWatchlist.url) { data, response, error in
            guard let data = data else {
                completion([], error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(MovieResults.self, from: data)
                completion(responseObject.results, nil)
            } catch {
                completion([], error)
            }
        }
        task.resume()
    }
    
}
