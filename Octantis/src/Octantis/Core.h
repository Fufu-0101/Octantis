#pragma once

#ifdef  OCT_PLATFORM_WINDOWS
	#ifdef OCT_BUILD_DLL
		#define OCT_API __declspec(dllexport)
	#else // OCT_BUILD_DLL
		#define OCT_API __declspec(dllimport)
	#endif
#else
	#error Octantis only support Windows!
#endif
