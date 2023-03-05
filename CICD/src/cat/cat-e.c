#include "s21_cat.h"

int cat_e(char *z) {
    char *filename = z;
    FILE *fp;
    int ch;
    char s = '$';
    int ret = 0;
    if ((fp = fopen(filename, "r")) == NULL) {
        printf("Cannot open file.\n");
        ret = 1;
    }
    if (ret == 0) {
        while ((ch = getc(fp)) != EOF) {
            if ((ch >= 0 && ch < 9) || (ch >= 11 && ch <= 31)) {
                printf("^%c", ch + '@');
            } else if (ch == 10) {
                ch = s;
                printf("%c\n", ch);
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
