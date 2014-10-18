#include <stdio.h>
#include <float.h>

int main(void)
{
double x = 0.0010;
double y = 0.420;
long double xl = 0.0010L;
long double yl = 0.420L;
float xf = 0.0010f;
float yf = 0.420f;

printf("In all cases, bogus precision is printed;\n"
"xxx_DIG + 4 is used rather than xxx_DIG\n\n");
printf("y/x = %.*g/%.*g = %.*g, (int)(y/x)= %d\n", DBL_DIG + 4, y,
DBL_DIG + 4, x, DBL_DIG + 4, y / x, (int) (y / x));
printf("yl/xl = %.*Lg/%.*Lg = %.*Lg, (int)(yl/xl)= %d\n",
LDBL_DIG + 4, yl, LDBL_DIG + 4, xl, LDBL_DIG + 4, yl / xl,
(int) (yl / xl));
printf("yf/xf = %.*g/%.*g = %.*g, (int)(yf/xf)= %d\n", FLT_DIG + 4,
yf, FLT_DIG + 4, xf, FLT_DIG + 4, yf / xf, (int) (yf / xf));
return 0;
}

