```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let advisor = Advisor(client)

let reportList = try await advisor.listReports(
    queries: [], // optional
    total: false // optional
)

```
