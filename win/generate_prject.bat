
set CMAKE_PREFIX_PATH=C:\libxml2\
set BOOST_ROOT=c:\boost_1_55_0\
rem set PATH=%PATH%;C:\libxml2\libxml2-2.7.8.win32\lib
rem set BOOST_ROOT=C:\boost_1_55_0\boost
rem set BOOST_INCLUDEDIR=C:\boost_1_55_0\boost
set BOOST_LIBRARYDIR=C:\boost_1_55_0\lib64-msvc-12.0
del CMakeCache.txt
del *.vcx*
del *.sln*
cmake -DBUILD_PYTHON=NO -G "Visual Studio 12" ..


rem cmake --build . --target ALL_BUILD --config Debug
