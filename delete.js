var fso = new ActiveXObject("Scripting.FileSystemObject");

// Define an array of folder paths to clean
var targetFolders = [
    "C:\\Windows\\Temp",
    "E:\\test"
];

function clearFolderContents(folderPath) {
    try {
        if (!fso.FolderExists(folderPath)) return;
        
        var folder = fso.GetFolder(folderPath);

        // Delete all files inside the folder
        var files = new Enumerator(folder.Files);
        for (; !files.atEnd(); files.moveNext()) {
            try {
                files.item().Delete(true); // true forces deletion of read-only files
            } catch (e) {
                // Skips files currently locked/in use by open applications
            }
        }

        // Delete subfolders inside the folder
        var subFolders = new Enumerator(folder.SubFolders);
        for (; !subFolders.atEnd(); subFolders.moveNext()) {
            try {
                subFolders.item().Delete(true);
            } catch (e) {
                // Skips folders currently locked/in use
            }
        }
    } catch (e) {
        // Handle folder access errors
    }
}

// Loop through each folder path and execute cleanup
for (var i = 0; i < targetFolders.length; i++) {
    clearFolderContents(targetFolders[i]);
}

WScript.Echo("Folder cleanup complete!");