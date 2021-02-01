# PowerShell-GetAzPublicContainers
Script to run in your Azure environment to identify public containers.

Script connects to your Azure enviroment, gets all storage accounts from all subscriptions and checks if any containers are public (have access as "Blob" or "Container").

Script uses read-only cmdlets: Connect-AzAccount, Get-AzSubscription, Select-AzSubscription, Get-AzStorageAccount, Get-AzRmStorageContainer.

#### Prerequisites
- Script requires Azure modules (Az.Storage, Az.Accounts). Run `Install-Module Az.Storage, Az.Accounts` as administrator to install them.
- An Azure user account (with default Azure settings non-priviliged user account is ok).

#### Usage
 1. Download the script
 2. Allow script to run
 3. Import function from the script
 4. Run the function
 
 ```
 #Download the script
 Invoke-WebRequest -Uri https://raw.githubusercontent.com/vradchenko/PowerShell-GetAzPublicContainers/main/Get-AzPublicContainers.ps1 -OutFile Get-AzPublicContainers.ps1
 #Update ExecutionPolicy for this session only to allow script to run
 Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
 #Import function from the script
 . .\Get-AzPublicContainers.ps1
 #Run the function (and save results to a variable)
 $containers = Get-AzPublicContainers
 ```
#### Output

Array of objects containing the following attributes of a public container:
 - AzureSubscription
 - StorageAccount
 - StorageContainer
 - PublicAccess
 - LastModifiedTime
