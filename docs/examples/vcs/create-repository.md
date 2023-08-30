import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID

let vcs = Vcs(client)

let providerRepository = try await vcs.createRepository(
    installationId: "[INSTALLATION_ID]",
    name: "[NAME]",
    private: xfalse
)

