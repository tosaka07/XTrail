import ArgumentParser
import PathKit
import Rainbow

struct UninstallAllCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "uninstall-all")

  @Flag(name: .shortAndLong)
  var verbose: Bool = false

  func run() throws {
    print("🥾 Uninstall all Xcode template...\n")

    if !Constants.templateDirectory.exists {
      print("Template directory does not exists.")
      return
    }

    let templatePaths = try Constants.templateDirectory.children()

    if verbose {
      print("   Directories: \(templatePaths)\n")
    }

    try templatePaths.forEach { path in
      try path.delete()
    }

    print("🥾 All templates has been successfully uninstalled!")
  }
}
