#include "stdio.h"
#include "stdlib.h"
void copy_contents(const char *const filename, FILE *const outfile) {
    FILE *const infile = fopen(filename, "r");
    if (infile == NULL)
	printf("Error reading from %s\n", filename);
    char *line = NULL;
    size_t n = 0;
    while (getline(&line, &n, infile) != -1) {
	fprintf(outfile, "%s", line);
    }
    if (fclose(infile) == EOF) {
	printf("Error closing %s\n", filename);
	exit(1);
    }
    free(line);
}
void compile(const char *const filename, FILE *const outfile) {
    const char *const indent = "         ";
    FILE *const infile = fopen(filename, "r");
    if (infile == NULL)
	printf("Error reading from %s\n", filename);
    char *line = NULL;
    size_t n = 0;
    while (getline(&line, &n, infile) != -1) {
	if (line[0] == '#')
	    continue;
	sscanf(); // get the opcode
	printf("%s", line);
    }
    if (fclose(infile) == EOF) {
	printf("Error closing %s\n", filename);
	exit(1);
    }
    free(line);
}
int main(int argc, char** argv) {
    if (argc != 2) {
	printf("Error usage: ./assembler program.tass\n");
	exit(1);
    }
    FILE *const outfile = fopen("ins_mem.v", "w");
    if (outfile == NULL)
	printf("Error writing to ins_mem.v\n");
    copy_contents("header.v", outfile);
    compile(argv[1], outfile);
    copy_contents("footer.v", outfile);
    return 0;
}
