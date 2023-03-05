#include "s21_grep.h"
#define ARRAY_SIZE(arr) (sizeof((arr)) / sizeof((arr)[0]))

int grep_o(char *z, char *str, int argc) {
    FILE *fp;
    char *filename = z;
    char *line = NULL;
    char *re = str;
    size_t tlen = 0;
    ssize_t read;
    int i = 0;
    int count = 0;
    int m = 0;
    regex_t regex;
    regmatch_t pmatch[1];
    if (regcomp(&regex, re, 0) || (fp = fopen(filename, "r")) == NULL) {
        if (fp == NULL) {
            printf("Cannot open file.\n");
        }
        m = 1;
    }
    if (m == 0) {
        while ((read = getline(&line, &tlen, fp)) != -1) {
            char *s = line;
            for (int i = 0;; i++) {
                if (regexec(&regex, s, ARRAY_SIZE(pmatch), pmatch, 0)) {
                    break;
                }
                s += pmatch[0].rm_eo;
                count++;
            }
        }
        while (i < count) {
            if (argc > 4) {
                printf("%s:", z);
            }
            printf("%s\n", re);
            i++;
        }
    }
    free(line);
    regfree(&regex);
    fclose(fp);
    return m;
}
