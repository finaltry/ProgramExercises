#include <iostream>
#include <math.h>
#include <iomanip>
using namespace std ;

double Roundf(double val, int precision)
{
    int i;

    for (i = 0; i < precision; i++) {
        val *= (double)10;
    }

    printf("%.15f\n", val);
    val = round(val);
    printf("%.15f\n", val);

    for (i = 0; i < precision; i++) {
        val /= (double)10;
    }
    printf("%.15f\n", val);

    return (val);
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
    double a =  813191.0555013299;
    int b = 8;

    printf("%.15f\n", (double)Roundf(a, b));
    //system("PAUSE");
    return (0);
}

