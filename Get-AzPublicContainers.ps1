#Requires -Modules Az.Storage, Az.Accounts

function Get-AzPublicContainers
{
    Connect-AzAccount

    $PublicContainers = @()
    $count = 1
    $AzureSubscriptions = Get-AzSubscription

    foreach ($AzureSubscription in $AzureSubscriptions)
    {
        Select-AzSubscription -SubscriptionId $AzureSubscription.Id | Out-Null
        Write-Host "Switching to Azure subscription `"$($AzureSubscription.Name)`" ($count from $($AzureSubscriptions.Count))"
        foreach ($StorageAccount in $(Get-AzStorageAccount))
        {
            Write-Host "    Getting containers from storage account `"$($StorageAccount.StorageAccountName)`""
            try
            {
                $StorageContainers = Get-AzRmStorageContainer -StorageAccountName $StorageAccount.StorageAccountName -ResourceGroupName $StorageAccount.ResourceGroupName
                foreach ($StorageContainer in ($StorageContainers | Where-Object PublicAccess -ne None))
                {
                    $PublicContainers += @{AzureSubscription = $AzureSubscription.Name; StorageAccount = $StorageAccount.StorageAccountName; StorageContainer = $StorageContainer.Name; PublicAccess = $StorageContainer.PublicAccess; LastModifiedTime = $StorageContainer.LastModifiedTime}
                }
            }
            catch
            {
            }
        }
        $count++
    }
    return $PublicContainers
}
