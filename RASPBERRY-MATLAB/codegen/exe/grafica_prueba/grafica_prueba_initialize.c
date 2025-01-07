/*
 * grafica_prueba_initialize.c
 *
 * Code generation for function 'grafica_prueba_initialize'
 *
 */

/* Include files */
#include "grafica_prueba_initialize.h"
#include "grafica_prueba_data.h"

/* Function Definitions */
void grafica_prueba_initialize(void)
{
  /* user code (Initialize function Body) */
  {
    mwRaspiInit();
    MW_launchPyserver();
  }

  isInitialized_grafica_prueba = true;
}

/* End of code generation (grafica_prueba_initialize.c) */
