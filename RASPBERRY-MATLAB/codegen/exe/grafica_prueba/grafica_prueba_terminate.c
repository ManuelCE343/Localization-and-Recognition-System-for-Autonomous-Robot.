/*
 * grafica_prueba_terminate.c
 *
 * Code generation for function 'grafica_prueba_terminate'
 *
 */

/* Include files */
#include "grafica_prueba_terminate.h"
#include "grafica_prueba_data.h"

/* Function Definitions */
void grafica_prueba_terminate(void)
{
  /* user code (Terminate function Body) */
  {
    MW_killPyserver();
    mwRaspiTerminate();
  }

  isInitialized_grafica_prueba = false;
}

/* End of code generation (grafica_prueba_terminate.c) */
