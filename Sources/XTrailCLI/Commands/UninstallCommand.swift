import ArgumentParser
import PathKit
import Rainbow

struct UninstallCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "uninstall")

  @Argument(help: "A name of the installed template. Specify the directory name at the end of the template, which can also be checked with the List command.")
  var name: String

  @Flag(name: .shortAndLong)
  var verbose: Bool = false

  func validate() throws {
    let deleteDirectory = Constants.templateDirectory + Path(name)

    guard deleteDirectory.exists else {
      throw ValidationError("The directory to be deleted does not exist.")
    }
  }

  func run() throws {
    print("🥾 Uninstall the Xcode template...\n")

    let deleteDirectory = Constants.templateDirectory + Path(name)

    if verbose {
      print("   Directory: \(deleteDirectory)")
      print("   isSymlink: \(deleteDirectory.isSymlink)")
    }

    try deleteDirectory.delete()

    print("🥾 \"\(name)\" has been successfully uninstalled!")
  }
}
