```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let analytics = Analytics(client)

let result = try await analytics.createEvent(
    propertyId: "<PROPERTY_ID>",
    name: "<NAME>",
    url: "https://example.com",
    domain: "<DOMAIN>", // optional
    referrer: "<REFERRER>", // optional
    screenWidth: 0, // optional
    sessionHash: "<SESSION_HASH>", // optional
    scrollDepth: 0, // optional
    engagementTime: 0, // optional
    props: [], // optional
    userId: "<USER_ID>", // optional
    ip: "<IP>", // optional
    userAgent: "<USER_AGENT>" // optional
)

```
