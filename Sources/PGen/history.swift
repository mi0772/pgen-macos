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
        
        @Argument(help: "Numbers of last element to show")
        var elementToShow: Int = 10
        
        @Argument(help: "Simple filter for label")
        var filter: String = ""
        
        func run() throws {
            
            print("This is the latest \(elementToShow) generated password" )
            
            let dh = DocumentHolder()
            print(dh.read())
        }
    }
}
