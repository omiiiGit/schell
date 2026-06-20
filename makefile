CC = gcc
CFLAGS = -g -Wall -fsanitize=address -I/home/om/include
LDFLAGS = -lncurses

PROG = schell

OBJ = main.o gui.o buck.o buffer.o

.PHONY: build
build: $(PROG)

$(PROG): $(OBJ)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJ) $(LDFLAGS)

main.o: main.c gui.h
	$(CC) -c $(CFLAGS) main.c

gui.o: gui.c gui.h color.h buck.h
	$(CC) -c $(CFLAGS) gui.c

buck.o: buck.c buck.h
	$(CC) -c $(CFLAGS) buck.c

buffer.o: buffer.h buffer.c
	$(CC) -c $(CFLAGS) buffer.c

.PHONY: clean
clean:
	rm -fr $(OBJ) $(PROG)

.PHONY: run
run:
	./$(PROG)

.PHONY: debug
debug:
	gdb --tui ./$(PROG)
