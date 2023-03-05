#include "s21_cat.h"

int cat_tgnu(char *z) {
    char *filename = z;
    FILE *fp;
    int ch;
    char s = '^';
    char h = 'I';
    int ret = 0;
    if ((fp = fopen(filename, "r")) == NULL) {
        printf("Cannot open file.\n");
        ret = 1;
    }
    if (ret == 0) {
        while ((ch = getc(fp)) != EOF) {
            if (ch != '\t') {
                printf("%c", ch);
            } else {
                printf("%c%c", s, h);
            }
        }
    }
    fclose(fp);
    return ret;
}
