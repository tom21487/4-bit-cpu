/*
 * Converts assembly to ins_mem bitfield
 * Opcodes:
 * add    -> 000
 * nand   -> 001
 * push   -> 010
 * noop   -> 011
 * branch -> 111
 */
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
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
char *bin_str(int dec) {
    char *const res = malloc(sizeof *res * 3);
    switch (dec) {
    case 0:
	strcpy(res, "00");
	break;
    case 1:
	strcpy(res, "01");
	break;
    case 2:
	strcpy(res, "10");
	break;
    case 3:
	strcpy(res, "11");
	break;
    default:
	printf("Error decimal beyond register width\n");
	exit(1);
    }
    return res;
}
char* get_port(int ins_idx) {
    char *const res = malloc(sizeof *res * 7);
    const char alphabet[16] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'};
    strcpy(res, ".X(9'b");
    res[1] = alphabet[ins_idx];
    return res;
}
void compile(const char *const filename, FILE *const outfile) {
    const char *const indent = "        ";
    FILE *const infile = fopen(filename, "r");
    if (infile == NULL)
	printf("Error reading from %s\n", filename);
    char *line = NULL;
    size_t n = 0;
    int ins_idx = 0;
    while (getline(&line, &n, infile) != -1) {
	if (line[0] == '#')
	    continue;
	char *const port_name = get_port(ins_idx);
	fprintf(outfile, "%s%s", indent, port_name);
	free(port_name);
	const char *const opcode_str = strtok(line, " \n");
	char *opcode_bin = NULL;
	if (strcmp(opcode_str, "add") == 0)
	    opcode_bin = "000";
	else if (strcmp(opcode_str, "nand") == 0)
	    opcode_bin = "001";
	else if (strcmp(opcode_str, "branch") == 0)
	    opcode_bin = "111";
	if (opcode_bin != NULL) {
	    const char *const reg_out_str = strtok(NULL, " ");
	    char *const reg_out_bin = bin_str(reg_out_str[3]-'0');
	    const char *const reg_a_str = strtok(NULL, " ");
	    char *const reg_a_bin = bin_str(reg_a_str[3]-'0');
	    const char *const reg_b_str = strtok(NULL, " #\n");
	    char *const reg_b_bin = bin_str(reg_b_str[3]-'0');
	    fprintf(outfile, "%s%s%s%s", opcode_bin, reg_out_bin, reg_a_bin, reg_b_bin);
	    free(reg_out_bin);
	    free(reg_a_bin);
	    free(reg_b_bin);
	} else if (strcmp(opcode_str, "push") == 0) {
	    const char *const reg_out_str = strtok(NULL, " ");
	    char *const reg_out_bin = bin_str(reg_out_str[3]-'0');
	    const char *const imm_str = strtok(NULL, " #\n");
	    fprintf(outfile, "010%s%s", reg_out_bin, imm_str);
	    free(reg_out_bin);
	} else if (strcmp(opcode_str, "noop") == 0) {
	    fprintf(outfile, "011000000");
	} else {
	    printf("Error unknown opcode_str '%s'\n", opcode_str);
	    exit(1);
	}
	fprintf(outfile, "),\n");
	ins_idx++;
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
    if (fclose(outfile) == EOF) {
	printf("Error closing ins_mem.v\n");
    }
    return 0;
}
