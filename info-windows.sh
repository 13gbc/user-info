# Get the list of all users on the system
$users = Get-LocalUser

# Loop over the users and display their details
foreach ($user in $users) {
  # Display the username
  Write-Output "Username: $($user.Name)"

  # Check if the user is currently logged in
  $loggedIn = $false
  $sessions = quser
  foreach ($session in $sessions) {
    if ($session -match $user.Name) {
      $loggedIn = $true
      break
    }
  }
  Write-Output "Logged in: $loggedIn"

  # Check if the user is a high privileged account
  $highPrivileged = $false
  $membership = $user.Group | Select-Object -ExpandProperty Name
  foreach ($group in $membership) {
    if ($group -match "administrators|domain admins|enterprise admins") {
      $highPrivileged = $true
      break
    }
  }
  Write-Output "High privileged: $highPrivileged"

  # Display the user history
  Write-Output "History:"
  $history = (Get-EventLog Security -UserName $user.Name -InstanceId 4624 -Newest 10) | Format-List
  Write-Output $history

  # Display other useful details about the user
  Write-Output "Other details:"
  $details = $user | Select-Object PasswordLastSet, LastLogon, Description, PasswordNeverExpires, PasswordChangeable, PasswordExpires
  Write-Output $details
  Write-Output ""
}
