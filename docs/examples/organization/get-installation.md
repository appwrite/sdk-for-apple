```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let organization = Organization(client)

let appInstallation = try await organization.getInstallation(
    installationId: "<INSTALLATION_ID>"
)

```
