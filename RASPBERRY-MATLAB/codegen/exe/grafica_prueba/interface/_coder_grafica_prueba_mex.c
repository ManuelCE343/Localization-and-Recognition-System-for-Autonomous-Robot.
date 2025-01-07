/*
 * _coder_grafica_prueba_mex.c
 *
 * Code generation for function 'grafica_prueba'
 *
 */

/* Include files */
#include "_coder_grafica_prueba_mex.h"
#include "_coder_grafica_prueba_api.h"

/* Function Definitions */
void grafica_prueba_mexFunction(int32_T nlhs, int32_T nrhs)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 0, 4,
                        14, "grafica_prueba");
  }

  if (nlhs > 0) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 14,
                        "grafica_prueba");
  }

  /* Call the function. */
  grafica_prueba_api();
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  (void)plhs;
  (void)prhs;
  mexAtExit(&grafica_prueba_atexit);

  /* Module initialization. */
  grafica_prueba_initialize();

  /* Dispatch the entry-point. */
  grafica_prueba_mexFunction(nlhs, nrhs);

  /* Module termination. */
  grafica_prueba_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_grafica_prueba_mex.c) */
