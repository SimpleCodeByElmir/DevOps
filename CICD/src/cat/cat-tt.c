#include "s21_cat.h"

int cat_tt(char *z) {
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
            if ((ch >= 0 && ch <= 8) || (ch > 10 && ch <= 31)) {
                printf("^%c", ch + '@');
            } else if (ch == 9) {
                printf("%c%c", s, h);
            } else if (ch >= 128 && ch <= 159) {
                printf("M-^%c", ch + '@' - 128);
            } else if (ch == 127) {
                printf("^?");
            } else {
                printf("%c", ch);
            }
        }
    }
    fclose(fp);
    return ret;
}
