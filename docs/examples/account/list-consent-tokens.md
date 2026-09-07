```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let oauth2ConsentTokenList = try await account.listConsentTokens(
    consentId: "<CONSENT_ID>",
    queries: [], // optional
    total: false // optional
)

```
