#include "s21_cat.h"

int cat(char *z) {
    char *filename = z;
    FILE *fp;
    int ch;
    int ret = 0;
    if ((fp = fopen(filename, "r")) == NULL) {
        printf("Cannot open file.\n");
        ret = 1;
    }
    if (ret == 0) {
        while ((ch = getc(fp)) != EOF) {
            printf("%c", ch);
        }
    }
    fclose(fp);
    return ret;
}
