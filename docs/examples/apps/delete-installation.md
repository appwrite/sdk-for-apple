```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let result = try await apps.deleteInstallation(
    appId: "<APP_ID>",
    installationId: "<INSTALLATION_ID>"
)

```
