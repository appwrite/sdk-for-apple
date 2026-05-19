```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let presences = Presences(client)

let presence = try await presences.update(
    presenceId: "<PRESENCE_ID>",
    status: "<STATUS>", // optional
    expiresAt: "2020-10-15T06:38:00.000+00:00", // optional
    metadata: [:], // optional
    permissions: [Permission.read(Role.any())], // optional
    purge: false // optional
)

```
