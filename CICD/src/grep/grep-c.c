#include "s21_grep.h"
#define ARRAY_SIZE(arr) (sizeof((arr)) / sizeof((arr)[0]))

int grep_c(char *z, char *str, int argc) {
    FILE *fp = (FILE *)1;
    char *filename = z;
    char *line = NULL;
    char *re = str;
    size_t tlen = 0;
    ssize_t read;
    int count = 0;
    int success = 0;
    int m = 0;
    regex_t regex;
    if (regcomp(&regex, re, 0) || (fp = fopen(filename, "r")) == NULL) {
        if (fp == NULL) {
            printf("Cannot open file.\n");
        }
        m = 1;
    }
    if (m == 0) {
        while ((read = getline(&line, &tlen, fp)) != -1) {
            success = regexec(&regex, line, 0, NULL, 0);
            if (success == 0) {
                count++;
            }
        }
        if (argc > 4) {
            printf("%s:", z);
        }
    }
    if (success) printf("%d\n", count);
    free(line);
    regfree(&regex);
    fclose(fp);
    return m;
}
