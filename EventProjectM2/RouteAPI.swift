//
//  RouteAPI.swift
//  Event
//
//  Created by user232077 on 1/9/23.
//

import Foundation
import UIKit
// Model

struct Records: Codable {
    let records: [Planning]?
}

struct Planning: Codable {
    let id: String
    let fields: Fields
}

struct Fields: Codable {
    let activity: String
    let type: String?
    let start_date: String
    let end_date: String
    let location: String
    let notes: String
    enum CodingKeys: String, CodingKey {
        case activity = "Activity"
        case type = "Type"
        case start_date = "Start"
        case end_date = "End"
        case location = "Location"
        case notes = "Notes"
  }
}

struct Response: Codable {
    let id: String
    let deleted: Bool
}

struct ErrorResponse: Codable {
    let error: String
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}

// Request Factory

protocol RequestFactoryProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest
    func getPlanningList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Planning]?) -> Void)
}

private let planningUrlStr = "https://airtable.com/appLxCaCuYWnjaSKB/tblon3PzkaCkPGUnr"

class RequestFactory: RequestFactoryProtocol {
        internal func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest {
            var url: URL = URL(string: urlStr)!
            if let params = params {
                var urlParams = urlStr
                for param in params {
                    urlParams = urlParams + "/" + param
                }
                print(urlParams)
                url = URL(string: urlParams)!
            }
            var request = URLRequest(url: url)
            request.timeoutInterval = 100
            request.httpMethod = requestType.rawValue
            
            let accessToken = "keymaCPSexfxC2hF9"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField:"Authorization")
            return request
    }

        func getPlanningList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Planning]?) -> Void) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: createRequest(urlStr:
                                                                planningUrlStr,
                                                            requestType: .get,
                                                            params: nil)) {
                (data, response, error)
                in
                
                if let data = data, error == nil {
                    if let responseHttp = response as? HTTPURLResponse {
                        if responseHttp.statusCode==200 {
                            if let response = try?
                                JSONDecoder().decode(Records.self, from: data) {
                                callback((nil, nil), response.records)
                            }
                            else {
                                callback((CustomError.parsingError, "parsing error"), nil)
                            }
                        }
                        else {
                            callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                        }
                    }
                }
                else {
                    callback((CustomError.requestError, error.debugDescription), nil)
                }
        }
        task.resume()
    }
}

