import ArgumentParser

enum Command {}

extension Command {
  struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "pgen",
        abstract: "Simple tool for generate password and track it into history",
        version: "1.0.0",
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
