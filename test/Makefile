all:
	./test-scan-repos-old-style
	../bash-testthat/testthat.sh test-scan-repos.sh

clean:
	$(RM) -r repos-*
	$(RM) *.output

.PHONY: all clean
