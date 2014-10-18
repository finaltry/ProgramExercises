#include <math.h>
#include <stdio.h>

double Roundf(double val, int precision)
{
    int i;
    double v1 = 0, v2 = 0;

    v1 = val;
    printf("%15.15lf\n", v1);

    /*
    v2 = trunc(v1);
    printf("%15.15lf, %15.15lf\n", v1, v2);
    v1 -= v2;
    printf("%15.15lf, %15.15lf\n", v1, v2);
    */

    for (i = 0; i < precision; i++) {
        v1 *= 10;
    }
    printf("%15.15lf, %15.15lf\n", v1, v2);

    v1 = trunc(v1);
    printf("%15.15lf, %15.15lf\n", v1, v2);

    for (i = 0; i < precision; i++) {
        v1 /= 10;
    }
    printf("%15.15lf, %15.15lf\n", v1, v2);

    /*
    v1 += v2;
    */

    return ((double)v1);
}

/*
double Roundf(double val, int precision)
{
    val = val*pow((double)10,(double)precision) ;
    if (val>0.0)
         return (round(val)/pow((double)10,(double)precision));
    else if(val<0.0)
         return (round(val)/pow((double)10,(double)precision));
    else
        return  0.0;
}
*/

int main(void)
{
    /* double a =  813191.0555013299; */
    double a = 123.0123456789;
    int b = 8;
    char sbuf[100];

    sprintf(sbuf, "%.15lf", a);
    printf("%s\n", sbuf);
    printf("%.15f\n", (double)Roundf(a, b));
    //system("PAUSE");
    return (0);
}

