#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>

int grep_c(char *z, char *str, int argc);
int grep_e(char *z, char *str, int argc);
int grep_n(char *z, char *str, int argc);
int grep_o(char *z, char *str, int argc);
int grep_v(char *z, char *str, int argc);
int grep_i(char *z, char *str, int argc);
int grep_s(char *z, char *str, int argc);

int grep_l(char *z, char *str);
int grep_h(char *z, char *str);
int grep(char *z, char *str, int argc);

#endif /*SRC_GREP_S21_GREP_H_*/
