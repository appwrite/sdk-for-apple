```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let app = try await apps.update(
    appId: "<APP_ID>",
    name: "<NAME>",
    enabled: false, // optional
    redirectUris: [], // optional
    type: "public", // optional
    deviceFlow: false // optional
)

```
