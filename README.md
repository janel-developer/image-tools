# Image tools for image processing

## resize.sh

Resizes images to no greater than 360000 pixes (600x600). Copies resized images into a subdirectory with the category name.

Usage:
```
./resize.sh -c category <list of images>
```

Example:
```
./resize.sh -c sport *.jpg
```

## addtag.sh

Adds tags to images. Modifies image and saves copy of original in a file with _original appended.

Usage:
```
./addtag.sh image <comma-separated list of tags without spaces>
```

Example:
```
./addtag.sh fish-3.jpg fish,ocean,blue,underwater,Australia
```