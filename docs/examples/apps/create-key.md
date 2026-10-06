```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let appKey = try await apps.createKey(
    appId: "<APP_ID>"
)

```
