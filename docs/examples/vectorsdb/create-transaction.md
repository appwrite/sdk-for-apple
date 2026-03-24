```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let vectorsDB = VectorsDB(client)

let transaction = try await vectorsDB.createTransaction(
    ttl: 60 // optional
)

```
