# Example-Usage.ps1
# Demonstrates basic usage of the GitHubHelperTools module.

Import-Module "$PSScriptRoot\..\GitHubHelperTools.psd1" -Force

# Define your GitHub information
$Owner = 'you-Owner?'
$Repo = 'your_current_repo'
$GitHubToken = 'your_token_here'

# Create a new label
New-LabelOnGitHub -Owner $Owner -Repo $Repo -GitHubToken $GitHubToken

# Create a new milestone
New-MilestoneOnGitHub -Owner $Owner -Repo $Repo -GitHubToken $GitHubToken

# Create a new issue
New-IssueOnGitHub -Owner $Owner -Repo $Repo -GitHubToken $GitHubToken

# Update an existing issue
Update-IssueOnGitHub -Owner $Owner -Repo $Repo -GitHubToken $GitHubToken

# Get the content of an issue for documentation
Get-GitHubIssueContentForJarvis -Owner $Owner -Repo $Repo -GitHubToken $GitHubToken

# Get a milestone with its issues and copy to clipboard
Get-GitHubMilestoneAndConnectedIssueToClip -Owner $Owner -Repo $Repo -MilestoneNumber 1 -GitHubToken $GitHubToken
