function Get-Log {
    param
    (
        [parameter(Mandatory=%true,
        [String[]]$LogName
    )

$LogName = "Application"
$EntryType = "Error"
$OneWeekAgo = "{0:yyyy-MM-dd}" -f (get-date).AddDays(-7)
$Today = "{0:yyyy-MM-dd}" -f (get-date)

get-eventlog -LogName $LogName -EntryType $EntryType -After $OneWeekAgo > "Application.Error ($OneWeekAgo) - ($Today).txt"

$LogName = "Application"
$EntryType = "Warning"
$OneWeekAgo = "{0:yyyy-MM-dd}" -f (get-date).AddDays(-7)

get-eventlog -LogName $LogName -EntryType $EntryType -After $OneWeekAgo > "Application.Warning ($OneWeekAgo) - ($Today).txt"

$LogName = "System"
$EntryType = "Error"
$OneWeekAgo = "{0:yyyy-MM-dd}" -f (get-date).AddDays(-7)

get-eventlog -LogName $LogName -EntryType $EntryType -After $OneWeekAgo > "System.Error ($OneWeekAgo) - ($Today).txt"

$LogName = "System"
$EntryType = "Warning"
$OneWeekAgo = "{0:yyyy-MM-dd}" -f (get-date).AddDays(-7)

get-eventlog -LogName $LogName -EntryType $EntryType -After $OneWeekAgo > "System.Warning ($OneWeekAgo) - ($Today).txt"
