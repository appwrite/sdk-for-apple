```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let result = try await account.deleteConsentToken(
    consentId: "<CONSENT_ID>",
    tokenId: "<TOKEN_ID>"
)

```
