#include "mex.h"
// #include "mex_main.h"

extern void __mexFunction__(int nlhs, mxArray*plhs[], int nrhs, const mxArray *prhs[]); 
extern void __at_exit__(); 

static void at_exit();

void mexFunction(int nlhs, mxArray *plhs[],
    int nrhs, const mxArray *prhs[])
{
    
    mexAtExit(&at_exit);

    __mexFunction__(nlhs, plhs, nrhs, prhs);

}

static void at_exit()
{
    __at_exit__();    
}
