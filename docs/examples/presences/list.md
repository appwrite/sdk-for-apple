```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let presences = Presences(client)

let presenceList = try await presences.list(
    queries: [], // optional
    total: false, // optional
    ttl: 0 // optional
)

```
