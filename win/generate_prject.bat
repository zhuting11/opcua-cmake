
set CMAKE_PREFIX_PATH=C:\libxml2\
rem set path=%path%;C:\boost_1_55_0\lib64-msvc-12.0
set BOOST_ROOT=c:\boost_1_55_0\
set BOOST_LIBRARYDIR=C:\boost_1_55_0\lib64-msvc-12.0
del CMakeCache.txt
del *.vcx*
del *.sln*
rem cmake -DBUILD_PYTHON=NO -DBUILD_ADDON=OFF -DBUILD64BIT=ON -G "Visual Studio 12" ..
cmake -DBUILD_PYTHON=NO -DBUILD_ADDON=OFF -G "Visual Studio 12 Win64" ..


rem cmake --build build --target ALL_BUILD --config Debug --D BUILD_ADDON=OFF -D BUILD_PYTHON=ON
