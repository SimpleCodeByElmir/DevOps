#include "s21_cat.h"

int cat_s(char *z) {
    char *filename = z;
    FILE *fp;
    int ch;
    int prev;
    int m;
    int flag = 0;
    int ret = 0;
    if ((fp = fopen(filename, "r")) == NULL) {
        printf("Cannot open file.\n");
        ret = 1;
    }
    if (ret == 0) {
        while ((ch = getc(fp)) != EOF) {
            flag = 0;
            if (m == '\n' && prev == '\n' && ch == '\n') {
                flag = 1;
            }
            if (flag != 1) {
                printf("%c", ch);
                m = prev;
                prev = ch;
            }
        }
    }
    fclose(fp);
    return 0;
}
