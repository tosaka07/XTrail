import ArgumentParser
import PathKit
import Rainbow

enum InstallType: String, CaseIterable, ExpressibleByArgument {
  case copy
  case link
}

struct InstallCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "install")

  @Argument(help: "A Xcode template directory to install.", completion: .directory)
  var templateDirectory: String

  @Option(name: .shortAndLong, help: "Xcode template installation type. Specify either `copy` or `link`.")
  var type: InstallType = .copy

  @Option(name: .long, help: "A name of the template directory to save it in.")
  var name: String?

  @Flag(name: .shortAndLong)
  var verbose: Bool = false

  func validate() throws {
    let inputPath = Path(templateDirectory)

    guard inputPath.exists else {
      throw ValidationError("`\(templateDirectory)` does not exist. Please provide a directory that exists.")
    }

    guard inputPath.isDirectory else {
      throw ValidationError("`\(templateDirectory)` is not a directory. Please specify a directory.")
    }
  }

  func run() throws {
    let input = Path(templateDirectory).normalize()
    let templateDirectory = Constants.templateDirectory

    print("🥾 Install the Xcode template...\n")

    if verbose {
      print("   Install type: \(type)")
      print("   Input: \(input)")
      print("   Template directory: \(templateDirectory)")
    }

    if !templateDirectory.exists {
      print("Xcode template directory(\(templateDirectory) does not exist. Created.")
      try templateDirectory.mkdir()
    }

    let saveDirectory = (name != nil)
      ? Path(name!)
      : Path(input.lastComponent)
    let saveDestination = templateDirectory + saveDirectory

    if verbose {
      print("   Destination: \(saveDestination)\n")
    }

    guard !saveDestination.exists else {
      throw ValidationError("The Xcode template could not copied to `\(saveDestination)` because the template already exists.")
    }

    switch type {
    case .link:
      try saveDestination.symlink(input)
    case .copy:
      try input.copy(saveDestination)
    }

    print("🥾 \"\(saveDirectory)\" has been successfully installed!".green)
  }
}
