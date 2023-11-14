cmake -S . -G Ninja -B build ^
	-DBUILD_SHARED_LIBS=ON ^
	-DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
	%CMAKE_ARGS% || goto :error
cmake --build build || goto :error
cmake --install build || goto :error
copy build\unibilium.dll %LIBRARY_PREFIX%\bin || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
