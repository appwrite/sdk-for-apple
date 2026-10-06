```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let appSecretList = try await apps.listSecrets(
    appId: "<APP_ID>",
    queries: [], // optional
    total: false // optional
)

```
