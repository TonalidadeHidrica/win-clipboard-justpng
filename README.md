# Clipboard Image Normalizer (PowerShell)

This PowerShell script inspects the Windows clipboard, and if it contains an image, retrieves it and immediately re-sets it back to the clipboard.

While it may seem like a no-op, this operation is useful for improving compatibility of clipboard images across applications.

## Motivation

On Windows, when copying images from **Google Chrome**, the clipboard often contains multiple data formats:

* **PNG stream** (format ID `49950`): the actual image data.
* **HTML Format** (format ID `49506`): an HTML snippet containing an `<img>` tag pointing to the image URL.
* **UniformResourceLocatorW** (format ID `49518`): the URL of the image.

Applications like **PowerPoint** sometimes ignore the PNG stream and instead try to use the URL stored in these additional entries. This can result in paste operations failing or attempting to download the image from the Internet , which is especially problematic with webp images that PowerPoint cannot natively handle.  (Typically, when you failed to paste an image, a small blank square appears.)

This script resolves the issue by **re-setting the image in the clipboard**, effectively keeping the actual image data (PNG stream) while discarding the problematic Chrome-specific entries. After running the script, pasting the image into PowerPoint or other applications should work reliably.
