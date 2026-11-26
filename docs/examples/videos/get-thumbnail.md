```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let videos = Videos(client)

let bytes = try await videos.getThumbnail(
    videoId: "<VIDEO_ID>",
    thumbnailId: "<THUMBNAIL_ID>",
    width: 0, // optional
    height: 0, // optional
    output: .jpg // optional
)

```
