if [ $# -eq 0 ]; then
	TESTS=tests/*.h
else
	TESTS=$@
fi

failed=0
for file in $TESTS; do
	echo "$file"
	docker run -u $(id -u):$(id -g) -v "$(pwd):$(pwd)" -w $(pwd) ctypesgen-ng --clang-flags \"-Wno-error=implicit-int\" --ignore-included --library test.so --headers "$file" > $file.out
done

exit $failed