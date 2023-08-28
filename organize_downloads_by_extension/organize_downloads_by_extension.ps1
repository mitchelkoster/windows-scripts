# Get environment variable for "Downloads" folder
$downloadFolder = "$Env:USERPROFILE\Downloads";

# Loop every every file/folder (document.pdf, ...)
Get-ChildItem $downloadFolder | ForEach-Object {
	# Get file name, extension and full path
	$fileNoExtension = [System.IO.Path]::GetFileNameWithoutExtension($_.FullName);
	$fileExtension = [System.IO.Path]::GetExtension($_.FullName);
	$fullPath = "$downloadFolder\$_";
	
	# Only continue for files, not folders
	if ( -Not (Test-Path -Path $fullPath -PathType Container) ) {        
		# Determine destination folder based on file extension (C:\Users\test\Downloads\pdf)
		# Create directory for extension if it does not exist yet
		$destinationFolder = "$downloadFolder\$fileExtension";
		if ( -Not (Test-Path -Path $destinationFolder) ) {
			New-Item -ItemType Directory -Path $destinationFolder;
		}

		# Copy file to new destination
		$destinationFile = "$destinationFolder\$_";
		Copy-Item -Path $fullPath -Destination $destinationFile;

		# Remove original file
		Remove-Item $fullPath;
	}
}