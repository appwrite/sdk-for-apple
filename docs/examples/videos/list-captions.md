```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let videos = Videos(client)

let videoCaptionList = try await videos.listCaptions(
    videoId: "<VIDEO_ID>",
    queries: [], // optional
    total: false // optional
)

```
