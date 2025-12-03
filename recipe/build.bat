@echo on
@setlocal EnableDelayedExpansion

cmake -S . -G Ninja -B build ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_VERBOSE_MAKEFILE=ON ^
    -Wno-dev ^
    -DBUILD_TESTING=OFF ^
	-DBUILD_SHARED_LIBS=ON ^
	-DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
	%CMAKE_ARGS% || goto :error
cmake --build build || goto :error
cmake --install build || goto :error
copy build\unibilium.dll %LIBRARY_PREFIX%\bin || goto :error

goto :eof

:error
echo Failed with error #%errorlevel%.
exit 1
