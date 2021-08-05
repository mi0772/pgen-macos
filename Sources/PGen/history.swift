//
//  File.swift
//  
//
//  Created by Carlo Di Giuseppe on 04/08/21.
//

import ArgumentParser
import Foundation

extension Command {
    struct History: ParsableCommand {
        static var configuration: CommandConfiguration {
            .init(
                commandName: "h",
                abstract: "history of generated passwords"
            )
        }
        
        @Option(name: [.customLong("element"), .customShort("e")], help: "Numbers of last element to show")
        var elementToShow: Int = 10
        
        @Option(name: [.customLong("filter"), .customShort("f")], help: "Simple filter for label")
        var filter: String = ""
        
        func run() throws {
            let dh = DocumentHolder()
            var content = dh.read().components(separatedBy: "\n")
            
            if filter != "" {
                print("history for \(filter) filter")
                content = content.filter{ $0.contains(filter) }
            }
            
            if elementToShow > 0 {
                print("This is the latest \(elementToShow) generated password" )
                print(content.prefix(elementToShow).joined(separator: "\n"))
            }
            else {
                print("This is all generated password" )
                print(content.joined(separator: "\n"))
            }
        }
    }
}
