cmake_minimum_required(VERSION 3.12)
project(toccobird_3rds)
include(ExternalProject)
get_filename_component(EXTERNAL_LIB_INSTALL_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../3rd ABSOLUTE)
message("INSTALL DIR:${EXTERNAL_LIB_INSTALL_PATH}")
set(CMAKE_OSX_SYSROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk)

#EXTERNALPROJECT_ADD(
#        btstack
#        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://github.com/vvhh2002/btstack.git
#        GIT_TAG master
#        CONFIGURE_COMMAND ""
#        BUILD_COMMAND ""
#        INSTALL_COMMAND ""
#)
#
#EXTERNALPROJECT_ADD(
#        mongoose
#        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://github.com/vvhh2002/mongoose.git
#        GIT_TAG 6.18
#        CONFIGURE_COMMAND ""
#        BUILD_COMMAND ""
#        INSTALL_COMMAND ""
#        BUILD_IN_SOURCE 1
#        #        LOG_DOWNLOAD true
#        #        LOG_UPDATE true
#        #        LOG_CONFIGURE true
#        #        LOG_BUILD true
#        #        LOG_INSTALL true
#)
#
#EXTERNALPROJECT_ADD(
#        arduinojson
#        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://github.com/vvhh2002/ArduinoJson.git
#        GIT_TAG 6.x
#        CONFIGURE_COMMAND ""
#        BUILD_COMMAND ""
#        INSTALL_COMMAND ""
#        BUILD_IN_SOURCE 1
#        #        LOG_DOWNLOAD true
#        #        LOG_UPDATE true
#        #        LOG_CONFIGURE true
#        #        LOG_BUILD true
#        #        LOG_INSTALL true
#)
#
#EXTERNALPROJECT_ADD(
#        libusb
#        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://github.com/libusb/libusb.git
#        GIT_TAG v1.0.23
#        CONFIGURE_COMMAND  cd <SOURCE_DIR> && ./autogen.sh && bash -c "export CFLAGS='-fno-omit-frame-pointer -fsanitize=leak -g'"&& bash -c "export CC=/opt/local/bin/clang-mp-8.0" && ./configure --prefix=<INSTALL_DIR> --disable-shared --enable-static --with-pic   --enable-shared=no
#        BUILD_COMMAND cd <SOURCE_DIR> && make
#        INSTALL_COMMAND cd <SOURCE_DIR> && make install
#        BUILD_IN_SOURCE 1
#        #        LOG_DOWNLOAD true
#        #        LOG_UPDATE true
#        #        LOG_CONFIGURE true
#        #        LOG_BUILD true
#        #        LOG_INSTALL true
#)