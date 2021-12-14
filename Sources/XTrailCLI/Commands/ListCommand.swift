import ArgumentParser
import PathKit
import Rainbow

struct ListCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "list")

  func run() throws {
    print("🥾 Installed Xcode templates...")

    if !Constants.templateDirectory.exists {
      print("Template directory does not exists.")
      return
    }

    let templatePaths = try Constants.templateDirectory.children()

    if templatePaths.isEmpty {
      print("  Template is empty.")
      return
    }

    try templatePaths.forEach { path in
      let name = path.lastComponent
      print("  \(name.bold) (\(path.abbreviate()))")
      if path.isSymlink {
        print("    -> \(try path.symlinkDestination().abbreviate())")
      }
    }
  }
}
