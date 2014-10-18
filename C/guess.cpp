
#include <iostream.h>

int main(void)
{
  char A[5] = "1234";
  char B[5] = "4321";

  int a=0, b=0;

  for (int i=0; i<4; i++)
    for (int j=0; j<4; j++)
      if (B[i]==A[j] && i==j)
        a++;
      else if (B[i]==A[j] && i!=j)
        b++;

  // printf("%dA%dB\n", a, b);
  cout << a << "A" << b << "B" << endl;
}

