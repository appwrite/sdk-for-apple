```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let vectorsDB = VectorsDB(client)

let document = try await vectorsDB.createDocument(
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    documentId: "<DOCUMENT_ID>",
    data: [
        "embeddings": [
            "0": 0.12,
            "1": -0.55,
            "2": 0.88,
            "3": 1.02
        ],
        "metadata": [
            "key": "value"
        ]
    ],
    permissions: [Permission.read(Role.any())] // optional
)

```
