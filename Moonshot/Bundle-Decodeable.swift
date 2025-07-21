//
//  Bundle-Decodeable.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 17/07/25.
//

import Foundation

extension Bundle{
    
//    we use bundle to get the contents from a file
//    Here were getting contents from whatever file we are passsing
//    getting the URL. Passing this URL in Data() as the struct is codable
//    And then decoding the data
    
    // <T> is a generic. denotes any parameter. so this is return whatever we want.
    // if we put [T] it will return an array of dictionaries
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to load \(file) in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        // JSON Decoder has a date deconding stratergy
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"    // M is month, m is minutes
        decoder.dateDecodingStrategy = .formatted(formatter)
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from the bundle due to missing key \(key.stringValue) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from the bundle due to type mismatch \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context){
            fatalError("Failed to decode \(file) from the bundle due to missing value \(type) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_){
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
        
//        guard let decoded = try? decoder.decode([String: Astronaut].self, from: data) else{
//            fatalError("Failed to decode \(file) in the bundle")
//        }
//
//        return decoded
    }
}
