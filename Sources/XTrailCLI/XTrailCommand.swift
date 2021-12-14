import ArgumentParser

public struct XTrailCommand: ParsableCommand {
  public static var configuration: CommandConfiguration = CommandConfiguration(
    commandName: "xtrail",
    abstract: "A Xcode Template Manager",
    version: "0.0.1",
    shouldDisplay: true,
    subcommands: [
      InstallCommand.self,
      UninstallCommand.self,
      UninstallAllCommand.self,
      ListCommand.self
    ])

  public init() {}
}
