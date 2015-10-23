#

dummyrom.bin: dummyrom.S
	${CC} $> -nostdlib -Wl,-e,0 -Wl,-Ttext=0 -Wl,--oformat=binary -o $@

dummyrom.bin.lzma: dummyrom.bin
	./lzma-fixup.sh $>
