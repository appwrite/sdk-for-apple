```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let documentsDB = DocumentsDB(client)

let transaction = try await documentsDB.updateTransaction(
    transactionId: "<TRANSACTION_ID>",
    commit: false, // optional
    rollback: false // optional
)

```
