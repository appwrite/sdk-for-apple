```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let account = Account(client)

let paymentMethod = try await account.updatePaymentMethodProvider(
    paymentMethodId: "<PAYMENT_METHOD_ID>",
    providerMethodId: "<PROVIDER_METHOD_ID>",
    name: "<NAME>",
    state: "<STATE>" // optional
)

```
