```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let key = try await account.updateKey(
    keyId: "<KEY_ID>",
    name: "<NAME>",
    scopes: [.account],
    expire: "" // optional
)

```
