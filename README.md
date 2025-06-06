# Appwrite Apple SDK

![Swift Package Manager](https://img.shields.io/github/v/release/appwrite/sdk-for-apple.svg?color=green&style=flat-square)
![License](https://img.shields.io/github/license/appwrite/sdk-for-apple.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-1.7.4-blue.svg?style=flat-square)
[![Build Status](https://img.shields.io/travis/com/appwrite/sdk-generator?style=flat-square)](https://travis-ci.com/appwrite/sdk-generator)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)

**This SDK is compatible with Appwrite server version 1.7.x. For older versions, please check [previous releases](https://github.com/appwrite/sdk-for-apple/releases).**

Appwrite is an open-source backend as a service server that abstract and simplify complex and repetitive development tasks behind a very simple to use REST API. Appwrite aims to help you develop your apps faster and in a more secure way. Use the Apple SDK to integrate your app with the Appwrite server to easily start interacting with all of Appwrite backend APIs and tools. For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)

![Appwrite](https://github.com/appwrite/appwrite/raw/main/public/images/github.png)

## Installation

### Xcode with Swift Package Manager

The Appwrite Swift SDK is available via Swift Package Manager. In order to use the Appwrite Swift SDK from Xcode, select File > **Add Packages**

In the dialog that appears, enter the Appwrite Swift SDK [package URL](git@github.com:appwrite/sdk-for-apple.git) in the search field. Once found, select `sdk-for-apple`.

On the right, select your version rules and ensure your desired target is selected in the **Add to Project** field.

Now click add package and you're done!

### Swift Package Manager

Add the package to your `Package.swift` dependencies:

```swift
    dependencies: [
        .package(url: "git@github.com:appwrite/sdk-for-apple.git", from: "10.1.1"),
    ],
```

Then add it to your target:

```swift
    targets: [
        .target(
            name: "YourAppTarget",
            dependencies: [
                .product(name: "", package: "sdk-for-apple")
            ]
        ),
```


## Getting Started

### Add your Apple Platform
To initialize your SDK and start interacting with Appwrite services, you need to add a new Apple platform to your project. To add a new platform, go to your Appwrite console, select your project (create one if you haven't already), and click the 'Add Platform' button on the project Dashboard.

From the options, choose to add a new **iOS**, **macOS**, **watchOS** or **tvOS** platform and add your app credentials.

Add your app <u>name</u> and <u>bundle identifier</u>. Your bundle identifier can be found in your Xcode project file or your `Info.plist` file. By registering a new platform, you are allowing your app to communicate with the Appwrite API.

### Registering URL schemes

In order to capture the Appwrite OAuth callback url, the following URL scheme needs to be added to project. You can add this from Xcode by selecting your project file, then the target you wish to use OAuth with. From the `Info` tab, expand the `URL types` section and add your Appwrite instance domain for the `Identifier`, and `appwrite-callback-[PROJECT-ID]` for the `URL scheme`. Be sure to replace the **[PROJECT_ID]** string with your actual Appwrite project ID. You can find your Appwrite project ID in your project settings screen in the console. Alternatively, you can add the following block directly to your targets `Info.plist` file:

```xml
<key>CFBundleURLTypes</key>
<array>
<dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLName</key>
    <string>io.appwrite</string>
    <key>CFBundleURLSchemes</key>
    <array>
        <string>appwrite-callback-[PROJECT-ID]</string>
    </array>
</dict>
</array>
```

Next we need to add a hook to save cookies when our app is opened by its callback URL.

### Registering an OAuth handler view

> If you're using UIKit, you can skip this section.

In SwiftUI this is as simple as ensuring `.registerOAuthHandler()` is called on the `View` you want to invoke an OAuth request from.

### Updating the SceneDelegate for UIKit

> If you're using SwiftUI, you can skip this section.

For UIKit, you need to add the following function to your `SceneDelegate.swift`. If you have already defined this function, you can just add the contents from below.

```swift
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url,
            url.absoluteString.contains("appwrite-callback") else {
            return
        }
        WebAuthComponent.handleIncomingCookie(from: url)
    }
```

### Init your SDK

Initialize your SDK with your Appwrite server API endpoint and project ID which can be found in your project settings page.

```swift
import Appwrite

func main() {
    let client = Client()
        .setEndpoint("http://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
}
```

### Make Your First Request

Once your SDK object is initialized, create any of the Appwrite service objects and choose any request to send. Full documentation for any service method you would like to use can be found in your SDK documentation or in the [API References](https://appwrite.io/docs) section.

```swift
let account = Account(client)

do {
    let user = try await account.create(
        userId: ID.unique(),
        email: "email@example.com",
        password: "password",
        name: "Walter O'Brien"
    )
    print(String(describing: user.toMap()))
} catch {
    print(error.localizedDescription)
}
```

### Full Example

```swift
import Appwrite

func main() {
    let client = Client()
        .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert

    let account = Account(client)
    
    do {
        let user = try await account.create(
            userId: ID.unique(),
            email: "email@example.com",
            password: "password",
            name: "Walter O'Brien"
        )
        print(String(describing: account.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Error Handling

When an error occurs, the Appwrite Apple SDK throws an `AppwriteError` object with `message` and `code` properties. You can handle any errors in a catch block and present the `message` or `localizedDescription` to the user or handle it yourself based on the provided error information. Below is an example.

```swift
import Appwrite

func main() {
    let account = Account(client)
    
    do {
        let user = try await account.get()
        print(String(describing: user.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Learn more

You can use the following resources to learn more and get help

- 🚀 [Getting Started Tutorial](https://appwrite.io/docs/getting-started-for-server)
- 📜 [Appwrite Docs](https://appwrite.io/docs)
- 💬 [Discord Community](https://appwrite.io/discord)
- 🚂 [Appwrite Swift Playground](https://github.com/appwrite/playground-for-swift-server)


## Contribution

This library is auto-generated by Appwrite custom [SDK Generator](https://github.com/appwrite/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/appwrite/sdk-generator/blob/master/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.