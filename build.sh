pushd crankshaft
if [ ! -d obj ]; then mkdir obj; fi
make lib
popd
pushd build
if [ -f cardswithfriends ]; then rm cardswithfriends; fi
if [ ! -f CMakeCache.txt ]; then cmake ../CMakeLists.txt; fi
cmake --build .
popd
