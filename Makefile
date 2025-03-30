all: build
build: $(wildcard *.kn)
	@kuinc main.kn -o w1
%.w1: build
	@./w1 $@ > $(basename $@).ll
	@llc $(basename $@).ll
	@gcc $(basename $@).s -o $(basename $@)
	@rm $(basename $@).ll
	@rm $(basename $@).s
clean:
	@rm w1

.PHONY: all build clean
