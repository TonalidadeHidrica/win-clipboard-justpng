Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Check if the clipboard contains image data
if ([System.Windows.Forms.Clipboard]::ContainsImage()) {
    # Get the image from clipboard
    $image = [System.Windows.Forms.Clipboard]::GetImage()

    if ($image -ne $null) {
        # Re-set the image to the clipboard
        [System.Windows.Forms.Clipboard]::SetImage($image)
        Write-Host "Image retrieved and re-set to clipboard."
    } else {
        Write-Host "Clipboard claims to contain image, but no image could be retrieved."
    }
} else {
    Write-Host "Clipboard does not contain image data."
}
