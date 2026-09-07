```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let teams = Teams(client)

let appInstallationList = try await teams.listInstallations(
    teamId: "<TEAM_ID>",
    queries: [], // optional
    total: false // optional
)

```
