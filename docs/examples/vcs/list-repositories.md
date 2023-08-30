import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID

let vcs = Vcs(client)

let providerRepositoryList = try await vcs.listRepositories(
    installationId: "[INSTALLATION_ID]"
)

