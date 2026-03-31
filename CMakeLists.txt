cmake_minimum_required(VERSION 3.24)

project( cardswithfriends )

if ( ${CMAKE_SYSTEM_NAME} MATCHES "Darwin" )
set(MACOSX TRUE)
find_package(OpenSSL)
else()
endif()

set( SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src )

set(CMAKE_BUILD_TYPE Debug)

file( GLOB SOURCES ${SOURCE_DIR}/*.cpp ${SOURCE_DIR}/*.c )

add_executable( cardswithfriends ${SOURCES} )

target_include_directories( cardswithfriends PUBLIC crankshaft/include )

target_link_directories( cardswithfriends PUBLIC crankshaft/lib )

if( MACOSX )
if( OPENSSL_FOUND )
target_include_directories( cardswithfriends PUBLIC ${OPENSSL_INCLUDE_DIR} )
target_link_libraries( cardswithfriends ${OPENSSL_LIBRARIES} )
target_link_libraries( cardswithfriends -lcrankshaft )
endif()
else()
target_link_libraries( cardswithfriends m ssl crypto pthread m z dl crankshaft )
endif()
