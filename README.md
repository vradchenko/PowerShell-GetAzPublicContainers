# PowerShell-GetAzPublicContainers
Script to run in your Azure environment to identify public containers

Script connects to your Azure enviroment, gets all storage accounts from all subscriptions and checks if any containers are public (have access as "Blob" or "Container")

#### Prerequisites
Script requires Azure modules (Az.Storage, Az.Accounts).

An Azure user account (with default Azure settings non-priviliged user account is ok)

#### Usage
 1. Download the script
 2. Import function from the script
 3. Run the function
 
 ```
 Invoke-WebRequest
 ```
