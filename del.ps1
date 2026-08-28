# Define an array of folder paths to clean
$targetFolders = @(
    "C:\Windows\Temp",
    "E:\test"
)

function Clear-FolderContents {
    param (
        [string]$folderPath
    )

    try {
        # Check if folder exists
        if (-not (Test-Path -Path $folderPath -PathType Container)) {
            return
        }

        # Delete all files and subfolders inside target directory without deleting the root folder itself
        Get-ChildItem -Path $folderPath -Force | ForEach-Object {
            try {
                Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction Stop
            }
            catch {
                # Skips files or folders currently locked/in use by open applications
            }
        }
    }
    catch {
        # Handle folder access errors
    }
}

# Loop through each folder path and execute cleanup
foreach ($folder in $targetFolders) {
    Clear-FolderContents -folderPath $folder
}

Write-Host "Folder cleanup complete!"