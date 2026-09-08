#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main() {
    // this is a comment
    /*
        this
        is
        a
        multiline
        cmmment
    */

    printf("hello world \n");
    printf("newline: \n");                 // add a newline with \n
    printf("tab_1:\ttab_2:\ttab_3:\t \n"); // add a tab with \t
    printf("\"quote\" is quoted \n\n");    // add a quote with \"

    int x;     // declaration
    x = 1;     // initialization
    int y = 2; // declaration and initialization

    char language = 'C';     // single character      %c
    char compiler[] = "gcc"; // array of characters   %s

    printf("you compile %c with %s \n", language, compiler);

    bool b = true;             // 1 byte (true or false)       %d
    char c = 100;              // 1 byte (-128 to +127)        %d or %c
    unsigned char uc = 255;    // 1 byte (0 to +255)           %d or %c
    short s = 32767;           // 2 bytes (-32768 to +32767)   %d
    unsigned short us = 65535; // 2 bytes (0 to +65535 x
    float f = 3.121592; // 4 bytes (32 bits of precision) 6 - 7 digits      %f
    double d =
        3.121592653589793; // 8 bytes (64 bits of precision) 15 - 16 digits %lf
    int i = 2147483647; // 4 bytes (-2147483648 to +2147483647)             %d
    unsigned int ui = 4294967295; // 4 bytes (0 to +4294967295) %d
    long long int l =
        9223372036854775087; // 8 bytes (-9quintillion to +9quintillion) %lld
    unsigned long long int ul =
        18446744073709551615U; // 8 bytes (0 to +18 quintillion) %llu

    printf("float: %f \n", f);
    printf("double: %0.15lf \n", d);
    printf("boolean: %d\n", b);
    printf("ascii of %c is %d \n", c, c);
    printf("float: %f \n", f);
    printf("double: %0.15lf \n", d);
    printf("short: %d \n", s);
    printf("unsigned short: %d \n", us);
    printf("integer: %d \n", i);
    printf("unsigned integer: %d \n", ui);
    printf("long:%lld \n", l);
    printf("unsigned long:%llu \n\n", ul);

    const float PI =
        3.121592; // when const is used the variable can't be changed

    float item1 = 5.75;
    float item2 = 10.00;
    float item3 = 21.20;

    printf("item 1: $%-.2f \n", item1);   //%.1 = deciaml precision
    printf("item 2: $%-.2f \n", item2);   //%1 = minimul field width
    printf("item 3: $%-.2f \n\n", item3); //%- = left align
    printf("item 1: %5.2f€ \n", item1);   //  right when none specified
    printf("item 2: %5.2f€ \n", item2);
    printf("item 3: %5.2f€ \n", item3);

    int calc_x = 5;
    int calc_y = 2;

    int calc_c =
        calc_x / (float)calc_y; // have to use float to get decimal precision
    float calc_d = calc_x / (float)calc_y;

    printf("\nint division %-d\n", calc_c);
    printf("float division %-.1f\n", calc_d);

    calc_x += 7;
    calc_x *= 4;
    calc_x -= 3;
    calc_x /= 5;
    calc_x %= 6;

    printf("augmented assignment aperators result: %d\n", calc_x);

    //     int age;
    //     char name[16]; // 16 bytes
    //
    // 	fgets(name, 16, stdin);
    // 	name[strlen(name)-1] = '\0';
    //
    //     printf("\ntype your age: ");
    //     scanf("%d", &age);
    //     printf(", you are %d years old", age);
    //
    //     printf("\ntype your name: ");
    //     scanf("%s", &name);
    //     printf(", your name is %s", name);

    double N = -16.0;
    double S = sqrt(N);
    double P = pow(N, 4);
    double R = round(PI);
    int C = ceil(PI);
    int F = floor(PI);
    double A = fabs(N);
    double L = log(N);

    printf("\nthe sqrt of %.2lf is %.2lf", N, S);
    printf("\n%.2lf to the fourth power is %.2lf", N, P);
    printf("\n%.2lf is rounded to %.2lf", PI, R);
    printf("\nthe ceilling of %.2lf is %d", PI, C);
    printf("\nthe floor of %.2lf is %d", PI, F);
    printf("\nthe obsolute value of %lf is %lf", N, A);
    printf("\nlog of %lf is %lf\n", N, L);

    double radius;
    double circonference;
    double area;

    printf("\nenter the radius of a circle: ");
    // scanf("%lf", &radius);
    radius = 1;
    printf("%lf", radius);

    circonference = 2 * PI * radius;
    area = PI * radius * radius;

    printf("\ncircumference: %lf", circonference);
    printf("\narea: %lf\n", area);

    double sideA = 5;
    double sideB = 10;
    double sideC;

    sideC = sqrt(pow(sideA, 2) + pow(sideB, 2));

    printf("a right triangle with %lf and %lf as adjacent sides has %lf as "
           "hypotenus",
           sideA, sideB, sideC);

    printf("\n");
    return 0;
}
