#include "s21_cat.h"

int cat_egnu(char *z) {
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
            if (ch != '\n') {
                printf("%c", ch);
            } else {
                ch = s;
                printf("%c\n", ch);
            }
        }
    }
    fclose(fp);
    return ret;
}
