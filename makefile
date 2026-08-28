CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lncurses

PROG = schell

OBJ = main.o gui.o buck.o buffer.o utils.o textbar.o

.PHONY: build
build: $(PROG)

$(PROG): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

main.o: main.c gui.h utils.h
	$(CC) -c $(CFLAGS) main.c

gui.o: gui.c gui.h color.h buck.h controls.h textbar.h widgets.h
	$(CC) -c $(CFLAGS) gui.c

buck.o: buck.c buck.h controls.h
	$(CC) -c $(CFLAGS) buck.c

buffer.o: buffer.h buffer.c
	$(CC) -c $(CFLAGS) buffer.c

utils.o: utils.c utils.h
	$(CC) -c $(CFLAGS) utils.c

textbar.o: textbar.c textbar.h widgets.h
	$(CC) -c $(CFLAGS) textbar.c

.PHONY: clean
clean:
	rm -fr $(OBJ) $(PROG)

.PHONY: run
run:
	./$(PROG)

.PHONY: debug
debug:
	gdb --tui ./$(PROG)
