```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let organizations = Organizations(client)

let downgradeFeedback = try await organizations.createDowngradeFeedback(
    organizationId: "<ORGANIZATION_ID>",
    reason: "<REASON>",
    message: "<MESSAGE>",
    fromPlanId: "<FROM_PLAN_ID>",
    toPlanId: "<TO_PLAN_ID>"
)

```
