```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let videos = Videos(client)

let result = try await videos.deleteCaption(
    videoId: "<VIDEO_ID>",
    captionId: "<CAPTION_ID>"
)

```
