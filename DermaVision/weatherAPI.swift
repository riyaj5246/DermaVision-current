//
//  weatherAPI.swift
//  DermaVision
//
//  Created by Riya Jain on 2/6/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif


func getData() -> [[String]] {
    var dataExportArr = [[String]]()

    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=42.0334&lon=-88.0834&exclude=minutely,daily,alerts&appid=3ef794ca0333167c27a720139df13470")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
    
   // let dataString = String(data: data, encoding: .utf8)!
    //print(dataString)
        
    let allData = data
    let jsonResponse: NSObject
        

    do{
        //here dataResponse received from a network request
        jsonResponse = try JSONSerialization.jsonObject(with: allData, options: []) as! NSObject
       
        if let dictionary = jsonResponse as? [String: Any] {
            
            //CURRENT DATA
            if let currentData = dictionary["current"] as? [String:Any] {
               
               // setting time
                let epochTime = TimeInterval(truncating: currentData["dt"] as! NSNumber)
//                if let offsetTime = dictionary["timezone_offset"] as? NSNumber {
//                    epochTime += Double(truncating: offsetTime)
//                   // print("doing this")
//                }
                
                let date = Date(timeIntervalSince1970: epochTime)
                print("Converted Time \(date)")
                
                let format = DateFormatter()
                format.dateFormat = "KK:mm a"

                 if let offsetTime = dictionary["timezone_offset"] as? NSNumber {
                     let offtime = offsetTime as! Int
                     format.timeZone = TimeZone(secondsFromGMT: offtime)
                 }
                 else{
                     format.timeZone = TimeZone(secondsFromGMT: 0)
                 }
                
                let dateString = format.string(from: date)
                print(dateString)
                
                //getting UV Data
                let uvData = currentData["uvi"] as! NSNumber
                
                let inte = uvData.doubleValue
               // print ("\(uvData) , \(inte)")
                
                let uvRisk: String
                
                if inte >= 8 {
                    uvRisk = "High"
                }
                else if inte >= 2 {
                    uvRisk = "Med"
                }
                else {
                    uvRisk = "Low"
                }
                                
                var currArray = [String]()
                currArray.append("Current: \(dateString)")
                currArray.append("UVI: \(uvData)")
                currArray.append(uvRisk)
                
                dataExportArr.append(currArray)
             //   print(dataExportArr)
            }
            
            //HOURLY FORECAST
            if let hourlyArray = dictionary["hourly"] as? [Any] {
              
                //FOR EACH HOUR
                for uviValue in hourlyArray {
                    if let x = uviValue as? [String: Any] {

                        //setting time
                        let epochTime = TimeInterval(truncating: x["dt"] as! NSNumber)
//                        if let offsetTime = dictionary["timezone_offset"] as? NSNumber {
//                            epochTime += Double(truncating: offsetTime)
//                        }
//
                        let date = Date(timeIntervalSince1970: epochTime)
                        
                        let format = DateFormatter()
                       
                        if let offsetTime = dictionary["timezone_offset"] as? NSNumber {
                            let offtime = offsetTime as! Int
                            format.timeZone = TimeZone(secondsFromGMT: offtime)
                        }
                        else{
                            format.timeZone = TimeZone(secondsFromGMT: 0)
                        }
                        
                        format.dateFormat = "KK:mm a"
                        
                        let dateString = format.string(from: date)
                        
                        //getting UV Data
                        let uvData = x["uvi"] as! NSNumber
                        
                        let inte = uvData.doubleValue
                        print ("\(uvData) , \(inte)")
//                        var uvNumInt:Int? = (uvData != nil) ? Int(truncating: uvData) : nil
//                        print(uvNumInt)
                        
                        let uvRisk: String
                        
                        if inte > 8 {
                            uvRisk = "High"
                        }
                        else if inte >= 2 {
                            uvRisk = "Med"
                        }
                        else {
                            uvRisk = "Low"
                        }
                        
                        var currArray = [String]()
                        currArray.append("\(dateString)")
                        currArray.append("UVI: \(uvData)")
                        currArray.append(uvRisk)
                        
                        print(uvRisk)

                        dataExportArr.append(currArray)
                    }
                }

            }
            
        }
                    
    } catch let parsingError {
        print("Error", parsingError)
    }
        

    semaphore.signal()
    }

    task.resume()
    semaphore.wait()
    
    return dataExportArr

}



