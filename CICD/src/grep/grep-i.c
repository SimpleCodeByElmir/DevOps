#include "s21_grep.h"
#define ARRAY_SIZE(arr) (sizeof((arr)) / sizeof((arr)[0]))

int grep_i(char *z, char *str, int argc) {
    FILE *fp;
    char *filename = z;
    char *line = NULL, end;
    char *re = str;
    size_t tlen = 0;
    ssize_t read;
    int success = 0;
    int m = 0;
    regex_t regex;
    if (regcomp(&regex, re, REG_ICASE) || (fp = fopen(filename, "r")) == NULL) {
        if (fp == NULL) {
            printf("Cannot open file.\n");
        }
        m = 1;
    }
    if (m == 0) {
        while ((read = getline(&line, &tlen, fp)) != -1) {
            success = regexec(&regex, line, 0, NULL, 0);
            if (success == 0) {
                if (argc > 4) {
                    printf("%s:", z);
                }
                printf("%s", line);
                end = *(line + read - 1);
            }
        }
        if (end != '\n' && !success) {
            printf("\n");
        }
    }
    free(line);
    regfree(&regex);
    fclose(fp);
    return m;
}
