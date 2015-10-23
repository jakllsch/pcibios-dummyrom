#!/bin/sh -e

FILENAME="$1"
OUTNAME="$1.lzma"

size=`python -c "import os; print len(open(\"$FILENAME\", \"rb\").read())"`

lzma -1ezc "$FILENAME" > "$OUTNAME"
python -c "import struct; data=open(\"$OUTNAME\", 'rb').read(); data = data[:5] + struct.pack('<i', $size) + data[9:]; open(\"$OUTNAME\", 'wb').write(data)"
