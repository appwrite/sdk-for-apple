```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let avatars = Avatars(client)

let bytes = try await avatars.getPhoto(
    width: 0, // optional
    height: 0, // optional
    quality: 0, // optional
    output: "png", // optional
    rating: "g", // optional
    userId: "current()", // optional
    emailHash: "<EMAIL_HASH>", // optional
    name: "<NAME>" // optional
)

```
