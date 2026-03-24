```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let vectorsDB = VectorsDB(client)

let documentList = try await vectorsDB.listDocuments(
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    queries: [], // optional
    transactionId: "<TRANSACTION_ID>", // optional
    total: false, // optional
    ttl: 0 // optional
)

```
