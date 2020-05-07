//
//  CovidService.swift
//  CovidTracker WatchKit Extension
//
//  Created by Haydn Wiese on 2020-05-06.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import Foundation

class CovidService {
    let session = URLSession(configuration: URLSessionConfiguration.default)
    private static let dayOneTotalUrl = "https://api.covid19api.com/total/dayone/country/canada/status/confirmed"
    
    func fetchCurrentTotal(_ callback: @escaping (_ reponse: Int) -> Void) {
        let url = URL(string: CovidService.dayOneTotalUrl)!
        
        session.dataTask(with: url, completionHandler: {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? Array<[String: Any]>,
                let currentDay = json.last,
                let casesNum = currentDay["Cases"] as? Int {
                callback(casesNum)
            }
        }).resume()
    }
}
