```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let oauth2OrganizationList = try await oauth2.listOrganizations(
    limit: 1, // optional
    offset: 0, // optional
    search: "<SEARCH>" // optional
)

```
