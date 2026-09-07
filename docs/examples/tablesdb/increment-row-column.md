```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let tablesDB = TablesDB(client)

let row = try await tablesDB.incrementRowColumn(
    databaseId: "<DATABASE_ID>",
    tableId: "<TABLE_ID>",
    rowId: "<ROW_ID>",
    column: "<COLUMN>",
    value: 1, // optional
    max: 100, // optional
    transactionId: "<TRANSACTION_ID>" // optional
)

```
