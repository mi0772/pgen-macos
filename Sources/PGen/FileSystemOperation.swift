//
//  File.swift
//  
//
//  Created by Carlo Di Giuseppe on 04/08/21.
//

import Foundation


class DocumentHolder {
    
    func register(label: String, password: String) {
        
        let file = "history.enc"
        let text = "\(label):\(password):\(NSDate())\n"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)
            do {
                let fileHandle = try FileHandle(forWritingTo: fileURL)
                    fileHandle.seekToEndOfFile()
                    fileHandle.write(text.data(using: .utf8)!)
                }
            catch {
                do {
                    try text.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                } catch let error as NSError {
                    print("Error creating file \(error)")
                }
            }
        }
    }
    
    func read() -> String {
        let file = "history.enc"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)

            do {
                return try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
        return ""
    }
}
