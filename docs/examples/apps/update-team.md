```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let apps = Apps(client)

let app = try await apps.updateTeam(
    appId: "<APP_ID>",
    teamId: "<TEAM_ID>"
)

```
