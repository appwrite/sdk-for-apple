```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let documentsDB = DocumentsDB(client)

let document = try await documentsDB.upsertDocument(
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    documentId: "<DOCUMENT_ID>",
    data: [:], // optional
    permissions: [Permission.read(Role.any())], // optional
    transactionId: "<TRANSACTION_ID>" // optional
)

```
