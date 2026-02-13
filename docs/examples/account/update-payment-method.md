```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let paymentMethod = try await account.updatePaymentMethod(
    paymentMethodId: "<PAYMENT_METHOD_ID>",
    expiryMonth: 1,
    expiryYear: 2026,
    state: "<STATE>" // optional
)

```
