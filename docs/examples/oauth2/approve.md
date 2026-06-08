```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProjectQuery("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let oauth2Approve = try await oauth2.approve(
    project_id: "<PROJECT_ID>",
    grant_id: "<GRANT_ID>",
    authorization_details: "<AUTHORIZATION_DETAILS>" // optional
)

```
