#comments in a Makefiel start with sharp

#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE STRICTLY ADHERED
#TO THE TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY WITH
#RESPECT TO THIS ASSIGNMENT.

#comments in a Makefile start with a sharp

gcc_opt = -D DEBUG -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c

#target means all targets currently defined in this file(lab1.zip and lab1)
all: lab1.zip lab1

#this target is the .zip file that must be submitted to Carmen
#this target depends upon 3 items: Makefile lab1.c and LAB1README
lab1.zip: Makefile lab1.c lab1_func.c local_file.h LAB1README lab1.input1 lab1.input2 verify

#this is the linux command we want to make execute
#if Makefile lab1.c or LAB1README has changed
	zip lab1.zip Makefile lab1.c lab1_func.c local_file.h LAB1README lab1.input1 lab1.input2 verify

#this target is for the lab1 executable
#the lab1 target get recreated if lab1.o has changed
lab1: lab1.o lab1_func.o

#this is the linux command we want to execute
#if lab1.o has changed, note that was only can use the -0 option here
	gcc lab1.o lab1_func.o -o lab1

#this target is the dependency for lab1.o
#the lab1.o target gets recreated if lab.c has changed
lab1.o: lab1.c local_file.h

#this is the linux command we want to execute
#if lab1.c has changed, note that this is where
#most of the gcc options are and there is now a -c option used
#-c option means that was stop compiling after we create  a.o
#file. We don't compile all the way to the end creating an executable.
	gcc $(gcc_opt) lab1.c

#this target is the dependency for lab1_func.o
#this lab1_func.o target gets recreated if lab1_func.c has changed
lab1_func.o: lab1_func.c local_file.h
	gcc $(gcc_opt) lab1_func.c

#this target deleted all files produced from the Makefile
#so that a completely new compile of all items is required

clean:
	rm -rf *.o lab1 lab1.zip

#this targets verifies that we have everything we need in the ,zip file
test:
	./verify

