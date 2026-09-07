```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let teams = Teams(client)

let appInstallation = try await teams.createInstallation(
    teamId: "<TEAM_ID>",
    appId: "<APP_ID>",
    authorizationDetails: "<AUTHORIZATION_DETAILS>" // optional
)

```
