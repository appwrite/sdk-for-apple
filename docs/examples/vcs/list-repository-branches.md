import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID

let vcs = Vcs(client)

let branchList = try await vcs.listRepositoryBranches(
    installationId: "[INSTALLATION_ID]",
    providerRepositoryId: "[PROVIDER_REPOSITORY_ID]"
)

