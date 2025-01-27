all: mpi-pi mm mm-debug

mpi-pi: mpi-pi.c Makefile
	mpicc -O2 mpi-pi.c -o mpi-pi

run:
	mpiexec -n 4 -f sm.tmp mpi-pi

clean: 
	rm mpi-pi mm mm-debug

mm:
	mpicc mpi_mmwrapper.c matmul.c -o mm

mm-debug:
	mpicc -D DEBUG mpi_mmwrapper.c matmul.c -o mm-debug
