FILES := statevec.cu
OBJS := statevec.so

CC := nvcc
FLAGS := --shared --cudart=shared

$(OBJS): $(FILES)
	$(CC) $(FLAGS) -o $(OBJS) $(FILES)
