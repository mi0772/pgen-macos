//
//  File.swift
//  
//
//  Created by Carlo Di Giuseppe on 04/08/21.
//

import Foundation


class DocumentHolder {
    
    static let FILE_NAME = ".pgen_history.enc"
    
    func register(label: String, password: String) {
        
        let text = "\(label):\(password):\(NSDate())\n"
        
        //let homeDir = FileManager.default.homeDirectoryForCurrentUser
        
        //if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

        let dir = FileManager.default.homeDirectoryForCurrentUser
        let fileURL = dir.appendingPathComponent(DocumentHolder.FILE_NAME)
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
    
    func read() -> String {
        
        let dir = FileManager.default.homeDirectoryForCurrentUser
        let fileURL = dir.appendingPathComponent(DocumentHolder.FILE_NAME)

        do {
            return try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch {
            return ""
        }
    
    }
}
