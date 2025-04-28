function Publish-GitHubRelease {
    <#
    .SYNOPSIS
    Publishes all current changes to GitHub and creates a new version tag.

    .DESCRIPTION
    Stages all modified files, commits with a user-provided message,
    pushes changes to the remote repository, and creates/pushes a Git tag.

    .PARAMETER Version
    The version number for the new tag (e.g., "1.0.0" or "v1.0.0").

    .EXAMPLE
    Publish-GitHubRelease -Version 1.0.0
    #>

    param (
        [Parameter(Mandatory = $true)]
        [string]$Version
    )

    # Ensure version starts with v
    if (-not $Version.StartsWith('v')) {
        $Version = 'v' + $Version
    }

    Write-Host "🔧 Creating tag $Version ..." -ForegroundColor Cyan

    # Add all changes
    git add .

    # Commit with user message
    $CommitMessage = Read-Host 'Please enter a commit message for this version'
    git commit -m $CommitMessage

    # Push commits
    git push

    # Create and push Git tag
    git tag $Version
    git push origin $Version

    Write-Host "✅ Tag $Version created and pushed successfully!" -ForegroundColor Green
}
