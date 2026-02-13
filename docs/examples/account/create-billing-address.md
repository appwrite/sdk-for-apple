```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let billingAddress = try await account.createBillingAddress(
    country: "<COUNTRY>",
    city: "<CITY>",
    streetAddress: "<STREET_ADDRESS>",
    addressLine2: "<ADDRESS_LINE2>", // optional
    state: "<STATE>", // optional
    postalCode: "<POSTAL_CODE>" // optional
)

```
