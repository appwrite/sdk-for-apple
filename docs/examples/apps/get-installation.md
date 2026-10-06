```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let appInstallation = try await apps.getInstallation(
    appId: "<APP_ID>",
    installationId: "<INSTALLATION_ID>"
)

```
