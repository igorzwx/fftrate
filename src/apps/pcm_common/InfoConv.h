#ifndef _PCM_INFOCONV_H_
#define _PCM_INFOCONV_H_

//=============================================================================
// Definition
//-----------------------------------------------------------------------------
#define SZ_FFT				"fft"
#define SZ_DCT				"dct"

#define SZ_HANNING			"hanning"
#define SZ_VORBIS			"vorbis"
#define SZ_RECT				"rect"

#ifdef __cplusplus
extern "C" {
#endif

//================================================================
//  Function prototypes
//----------------------------------------------------------------
VOID PrintConvMatrix( HCONVERT hConv );
VOID PrintConvInfo( HCONVERT hConv );

#ifdef __cplusplus
}
#endif

#endif // _PCM_INFOCONV_H_
