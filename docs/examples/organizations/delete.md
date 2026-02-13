```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let organizations = Organizations(client)

let result = try await organizations.delete(
    organizationId: "<ORGANIZATION_ID>"
)

```
