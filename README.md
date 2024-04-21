# xcodegen-poc

Testing out Xcodegen using the code from [calculators](https://github.com/abhiek187/calculators)

## Install

Follow the [installation guide](https://github.com/yonaskolb/XcodeGen?tab=readme-ov-file#installing) to install XcodeGen. Then run `xcodegen generate` to generate an Xcode project for the app.

## Pros

- A YAML file is easier to work with and smaller than a pbxproj file and can take advantage of IDE features, such as syntax highlighting and formatting
- Reduces merge conflicts
- It's easier to reference external shell scripts (also can take advantage of IDE features)
- Can specify multiple environments & frameworks for larger projects, with shared settings
- Can enforce how code should be styled for consistency in a large team (in addition to tools like SwiftLint)
- Supports caching if project files haven't changed
- Can utilize environment variables

## Cons

- Doesn't create starter code for you (main.swift, assets, info.plist, etc.)
- Must create folders for all targets before running `xcodegen generate`. Therefore, it's more ideal to create the project using Xcode first, then create `project.yml` based on the desired settings.
- Can't generate `project.yml` from an existing project. There's a [draft PR](https://github.com/yonaskolb/XcodeGen/pull/735) for a `migrate` command. It would solve the above con and make migrating existing projects easier.
- Need to run `xcodegen generate` whenever `project.yml` changes or new files are added/deleted (so Xcode's project navigator is up-to-date). If CocoaPods is used, `pod install` must be run as well (unsure if `*.xcworkspace/` can be ignored as well). Hooks and caching can be used to mitigate this issue, see [FAQ](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/FAQ.md#what-happens-when-i-switch-branches).
- The [docs](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/Usage.md#swift-package) recommend checking in `Package.resolved` in the usual location under `*.xcodeproj/project.xcworkspace/xcshareddata/swiftpm`. This prevents us from ignoring the `xcodeproj` folder completely as this tool promotes.
- Need to install and run `xcodegen` at the start of every pipeline
- Doesn't automatically create corresponding unit test or UI test targets
- Need to look up build setting names from an existing pbxproj file
