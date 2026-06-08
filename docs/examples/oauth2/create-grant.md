```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let oauth2 = Oauth2(client)

let oauth2Grant = try await oauth2.createGrant(
    project_id: "<PROJECT_ID>",
    user_code: "<USER_CODE>"
)

```
