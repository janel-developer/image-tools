CATEGORY= 
USAGE="Usage: $0 -c category <list of images>"
while getopts c: o
do
   case $o in
   c) CATEGORY=$OPTARG;;
   [?]) echo $USAGE
   esac
done
shift 2

if [[ -z $CATEGORY ]]; then
  echo $USAGE
  exit 1
fi

if [[ ! -d $CATEGORY ]]; then
  mkdir $CATEGORY
fi

IMAGES=$*
for image in $IMAGES
do
  image=${image%.*}
  echo "resizing ${image}.jpg to 360000 pixels"
  convert ${image}.jpg -resize 360000@ ${CATEGORY}/${image}-small.jpg
done
