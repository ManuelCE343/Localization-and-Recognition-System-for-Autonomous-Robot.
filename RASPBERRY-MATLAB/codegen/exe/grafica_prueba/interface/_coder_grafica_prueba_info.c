/*
 * _coder_grafica_prueba_info.c
 *
 * Code generation for function 'grafica_prueba'
 *
 */

/* Include files */
#include "_coder_grafica_prueba_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void);

/* Function Definitions */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[9] = {
    "789ced593d6fd3401876504bbb1482909899582ac569da82c34452a7add50f4549fa2d682ff635711b7ff47c6eed30c084d8f801fc0110032b124b47561666fe"
    "021b62013bf635ae55e3a84edd34f23bf4f2fab1ef79dfd77e9f3b5da914b792a228ea0ee5d8c38c334eb87eda1d6f51e7cd8fa7dc71dce3ff79d5bd7f941ae9",
    "f8131efc83f5e79debf38a8ca1811d4706123c7b525024510632ae992aa410d494d631143ac8bed88235518255afb36a7bd2bc073a736cc8fe3dd784fc615597"
    "28d4d4ba11b6bc4ea71e1fadf8be79f2b5e327f98e5c500f2f4eea017d3eb1b40fdfe1e69ecf3da5cb48692020b100037aa5505b2e14e9aaaeaa0ac265c01f82",
    "06d4e84a2e9bcbd669ac28adba62d0088216b692a331400d88351a014d15e94909e016a8d3935c6e8e5e011a86282379f25223e67537242f823b6164ac283245"
    "a0c133febd88fc6381fc0ea2cb87b27222f7ed3df221f912fc4adfa35dc1ce5ba442eb48ea1f96977fecde3fdeb9ff93f43d1527dfeb5fbf37e3e423765d7c46",
    "c07cbd7e970f02f8d23e3cbfc6f09abeca941f2f344aa85de619b6b255ecc6510ee1098b830af0e39a3f6a7f3702e64ffbf0bef7b73bf08a001b5076ae5a3dde"
    "afefe35e485e04f7e8b4b35ab8d76faa5e0feaba1b54c744af7be32336ec7a9d3d12b70fe4a96cbb76b48e4bfc82c914905a4af47a60fabb5ae606605f6d4591",
    "ecab23bfc7645f9de8b46ffe5e757a56c62c983137b9d926b35f028bf96c85db5848743ad9573be6d1e9645f7d85eb6e501d13bdee8d8fd8b0eb756d5f281e1b"
    "c6d4f426ffc4d038dcdec89bec10e9f59780e77bade35ac0fc691fbe53b2db7b4d8348b3da51d621cd2abc2e41d9ea58a75577edc6ad4384cc5d68a8108936a8",
    "68b4a507fb220f6441213f7755a4c33a38d7cf51bf87fb217910dc5917dc5522d3f13ad76faa3e0fea7a1b54c77ee9c90cfc11af3e9f6e7f8d938fd8b0ebb38e"
    "73cb80a936a6b8a513a6986b6ee60b8a319fe8f3a0e9f35ec43c4603f37010a2c4d7c5771a91ef4520df79bcdf3afccc1988fcc6a617f572bcfa4bfdfd3c162b",
    "9f6bc3aebf8da51a778cf5229b5b6ae74f168d13b3b85d5d4cf437d1dfcbf1f92da86ec412fd4df4f7423ed712fdfd3f4f581c54801fd7fca701cfdfd4be7e1b"
    "319f4721f910dc2116650c910c5a6707165576795d14a0c28a9ada02e6f5e9f5cf4bf291f95f86f011fcaace2d4865bb2718bed2c6fcff41f676cce719ef47de",
    "c4c9476cd8f5fc60cd04b92d6111b112a3b4c5e56953102a43709ef10fbd35c03c", "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 11832U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *epFieldName[6] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs", "FullPath", "TimeStamp" };

  const char_T *propFieldName[4] = { "Version", "ResolvedFunctions",
    "EntryPoints", "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 6, epFieldName);
  xInputs = emlrtCreateLogicalMatrix(1, 0);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("grafica_prueba"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(0.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (0.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath", emlrtMxCreateString(
    "grafica_prueba.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp", emlrtMxCreateDoubleScalar
                (738394.83958333335));
  xResult = emlrtCreateStructMatrix(1, 1, 4, propFieldName);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.9.0.1467703 (R2020b)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/* End of code generation (_coder_grafica_prueba_info.c) */
