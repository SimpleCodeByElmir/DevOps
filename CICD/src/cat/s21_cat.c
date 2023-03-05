#include "s21_cat.h"

int main(int argc, char **argv) {
    int u = 1;
    int w = 0;
    int i = 2;
    int flag = 0;
    char *m = "--number-nonblank";
    char *n = "--number";
    char *j = "--squeeze-blank";
    int k = 0;
    int y = 0;
    int r = 0;
    if (argc > 1) {
        k = strcmp(m, argv[1]);
        y = strcmp(n, argv[1]);
        r = strcmp(j, argv[1]);
    }
    w = getopt(argc, argv, "bentsTvE");
    if (w == 'b' || k == 0) {
        flag = 1;
    }
    if (w == 'e') {
        flag = 2;
    }
    if (w == 'n' || y == 0) {
        flag = 3;
    }
    if (w == 't') {
        flag = 4;
    }
    if (w == 's' || r == 0) {
        flag = 5;
    }
    if (w == 'v') {
        flag = 6;
    }
    if (w == 'E') {
        flag = 7;
    }
    if (w == 'T') {
        flag = 8;
    }
    if (flag != 0) {
        while (i < argc) {
            if (flag == 1) {
                cat_b(argv[i]);
            }
            if (flag == 2) {
                cat_e(argv[i]);
            }
            if (flag == 3) {
                cat_n(argv[i]);
            }
            if (flag == 4) {
                cat_tt(argv[i]);
            }
            if (flag == 5) {
                cat_s(argv[i]);
            }
            if (flag == 6) {
                cat_v(argv[i]);
            }
            if (flag == 7) {
                cat_egnu(argv[i]);
            }
            if (flag == 8) {
                cat_tgnu(argv[i]);
            }
            i++;
        }
    }
    if (flag == 0 && argc > 1) {
        while (u < argc) {
            cat(argv[u]);
            u++;
        }
    }
    return 0;
}
