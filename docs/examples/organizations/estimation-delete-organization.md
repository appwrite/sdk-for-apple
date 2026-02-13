```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let organizations = Organizations(client)

let estimationDeleteOrganization = try await organizations.estimationDeleteOrganization(
    organizationId: "<ORGANIZATION_ID>"
)

```
