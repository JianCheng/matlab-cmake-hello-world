#include "mex.h" 
void __mexFunction__(int nlhs, mxArray *plhs[],
    int nrhs, const mxArray *prhs[]) 
{
  mexPrintf("Hello Matlab world!\n"); 
} 

void __at_exit__()
{
}
