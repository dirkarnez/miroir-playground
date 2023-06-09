@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

@REM SET PATH=^
@REM %DOWNLOADS_DIR%\PortableGit\bin;^
@REM %DOWNLOADS_DIR%\winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4\mingw64;^
@REM %DOWNLOADS_DIR%\winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4\mingw64\bin;^
@REM %DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;

set PATH=^
D:\Softwares\winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4\mingw64;^
D:\Softwares\winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4\mingw64\bin;^
D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Debug ^
-Dmiroir_DIR="%DOWNLOADS_DIR_LINUX%/miroir-c19c43c909fa621cc8adb23cdc3616b18a121dd85-winlibs-x86_64-posix-seh-gcc-12.2.0-mingw-w64ucrt-10.0.0-r4/lib/cmake/miroir" ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . &&^
echo "Successful build"
pause