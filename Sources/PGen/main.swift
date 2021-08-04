//print("Hello, world!")

import ArgumentParser

enum Command {}

extension Command {
  struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "PGen",
        abstract: "A program to generate simple password",
        version: "0.0.1",
        subcommands: [
            Command.Generate.self,
            Command.History.self
        ] //,
        //defaultSubcommand: Command.History.self
      )
    }
  }
}

Command.Main.main()
