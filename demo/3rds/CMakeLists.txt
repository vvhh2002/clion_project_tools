cmake_minimum_required(VERSION 3.12)
project(libredtea_3rds)
include(ExternalProject)
#SET(EXTERNAL_LIB_INSTALL_PATH  ${CMAKE_CURRENT_SOURCE_DIR}/3rd)
get_filename_component(EXTERNAL_LIB_INSTALL_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../3rd ABSOLUTE)
message("INSTALL DIR:${EXTERNAL_LIB_INSTALL_PATH}")
#EXTERNALPROJECT_ADD(
#        yasm
#        # URL http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/yasm-1.3.0.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh yasm
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        zlib
#        # URL https://github.com/madler/zlib/archive/v1.2.11.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/zlib-v1.2.11.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh zlib
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --static
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        openssl
#        # URL http://www.openssl.org/source/openssl-1.0.2-latest.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/openssl-1.0.2-latest.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh openssl
#        CONFIGURE_COMMAND ./config no-shared no-idea no-mdc2 no-rc5 --prefix=${CMAKE_BINARY_DIR}
#        BUILD_COMMAND make depend && make
#        INSTALL_COMMAND make install_sw
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        opencore-amr
#        # URL http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.5.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/opencore-amr-0.1.5.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh opencore-amr
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared
#        BUILD_IN_SOURCE 1
#)
EXTERNALPROJECT_ADD(fdk-aac
        PREFIX  ${EXTERNAL_LIB_INSTALL_PATH}
        GIT_REPOSITORY  https://github.com/mstorsjo/fdk-aac.git
        GIT_TAG     v0.1.6
        CONFIGURE_COMMAND  echo fdk-acc build from <SOURCE_DIR> && cd <SOURCE_DIR>  && ./autogen.sh --noconfigure && ./configure --prefix=<INSTALL_DIR> --disable-shared --enable-static --with-pic
        BUILD_COMMAND   cd <SOURCE_DIR> && make
        INSTALL_COMMAND     cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE     1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)
#EXTERNALPROJECT_ADD(
#        lame
#        # URL http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/lame-3.99.5.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh lame
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        libogg
#        # URL http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/libogg-1.3.2.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libogg
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        speex
#        DEPENDS libogg
#        # URL http://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/speex-1.2.0.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh speex
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-sse  --disable-oggtest --with-ogg=${CMAKE_BINARY_DIR}
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        libvorbis
#        DEPENDS libogg
#        # URL http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/libvorbis-1.3.5.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libvorbis
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --disable-oggtest
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        libtheora
#        DEPENDS libogg
#        # URL http://downloads.xiph.org/releases/theora/libtheora-1.2.0alpha1.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/libtheora-1.2.0alpha1.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libtheora
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --disable-oggtest --disable-examples --with-ogg=${CMAKE_BINARY_DIR}
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        opus
#        # URL http://downloads.xiph.org/releases/opus/opus-1.1.4.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/opus-1.1.4.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh opus
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --disable-doc
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        xvidcore
#        DEPENDS yasm
#        # URL http://downloads.xvid.org/downloads/xvidcore-1.3.4.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/xvidcore-1.3.4.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh xvidcore
#        CONFIGURE_COMMAND cd build/generic && PATH=$ENV{PATH} ./configure --prefix=${CMAKE_BINARY_DIR}
#        BUILD_COMMAND cd build/generic && PATH=$ENV{PATH} make
#        INSTALL_COMMAND cd build/generic && make install
#        BUILD_IN_SOURCE 1
#)
EXTERNALPROJECT_ADD(
        x264
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
        GIT_REPOSITORY https://git.videolan.org/git/x264.git
        GIT_TAG origin/stable
        CONFIGURE_COMMAND cd <SOURCE_DIR> && ./configure --prefix=<INSTALL_DIR> --enable-static --disable-shared --enable-pic  --disable-avs --disable-gpac  --disable-lsmash
        BUILD_COMMAND cd <SOURCE_DIR> && make
        INSTALL_COMMAND cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)

#EXTERNALPROJECT_ADD(
#        x265
#        DEPENDS yasm
#        # DOWNLOAD_COMMAND hg clone --insecure https://bitbucket.org/multicoreware/x265
#        # UPDATE_COMMAND hg update -r stable
#        URL ${CMAKE_SOURCE_DIR}/vendor/x265_2.5.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh x265
#        CONFIGURE_COMMAND cd build/linux && PATH=$ENV{PATH} cmake -G "Unix Makefiles" -D CMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR} -D ENABLE_CLI:BOOL=OFF -D ENABLE_SHARED:BOOL=OFF ../../source
#        BUILD_COMMAND cd build/linux && PATH=$ENV{PATH} make
#        INSTALL_COMMAND cd build/linux && PATH=$ENV{PATH} make install
#        BUILD_IN_SOURCE 1
#)

EXTERNALPROJECT_ADD(
        davs2
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://github.com/pkuvcl/davs2.git
        GIT_REPOSITORY https://github.com/vvhh2002/davs2.git
        GIT_TAG redtea/10bit
#        PATCH_COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/patches/patch-manager.sh davs2 <SOURCE_DIR>
        CONFIGURE_COMMAND cd <SOURCE_DIR>/build/linux && ./configure --prefix=<INSTALL_DIR>  --enable-static --enable-pic --bit-depth=10
        BUILD_COMMAND cd <SOURCE_DIR>/build/linux && make
        INSTALL_COMMAND cd <SOURCE_DIR>/build/linux && make install
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
        BUILD_IN_SOURCE 1
)
#        BUILD_IN_SOURCE 1
EXTERNALPROJECT_ADD(
        xavs2
        GIT_REPOSITORY https://github.com/pkuvcl/xavs2.git
        GIT_TAG origin/master
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
        PATCH_COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/patches/patch-manager.sh xavs2 <SOURCE_DIR>
        CONFIGURE_COMMAND cd <SOURCE_DIR>/build/linux && ./configure --prefix=<INSTALL_DIR>   --enable-static --enable-pic
        BUILD_COMMAND cd <SOURCE_DIR>/build/linux &&  make
        INSTALL_COMMAND cd <SOURCE_DIR>/build/linux &&  make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)

#EXTERNALPROJECT_ADD(
#        libvpx
#        DEPENDS yasm
#        # URL http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.6.1.tar.bz2
#        URL ${CMAKE_SOURCE_DIR}/vendor/libvpx-1.6.1.tar.bz2
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libvpx
#        CONFIGURE_COMMAND PATH=$ENV{PATH} ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared
#        BUILD_COMMAND PATH=$ENV{PATH} make
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        rtmpdump
#        DEPENDS zlib openssl
#        # GIT_REPOSITORY git://git.ffmpeg.org/rtmpdump
#        # UPDATE_COMMAND ""
#        URL ${CMAKE_SOURCE_DIR}/vendor/rtmpdump-2.4.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh rtmpdump
#        CONFIGURE_COMMAND ""
#        BUILD_COMMAND make PREFIX=${CMAKE_BINARY_DIR} SHARED= XCFLAGS=-I${CMAKE_BINARY_DIR}/include XLDFLAGS=-L${CMAKE_BINARY_DIR}/lib XLIBS=-ldl
#        INSTALL_COMMAND make PREFIX=${CMAKE_BINARY_DIR} SHARED= install
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        freetype
#        # URL http://download.savannah.gnu.org/releases/freetype/freetype-2.7.1.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/freetype-2.7.1.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh freetype
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static --without-png
#        INSTALL_COMMAND make install && ln -s ${CMAKE_BINARY_DIR}/include/freetype2 ${CMAKE_BINARY_DIR}/include/freetype2/freetype
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        fribidi
#        # URL http://fribidi.org/download/fribidi-0.19.7.tar.bz2
#        URL ${CMAKE_SOURCE_DIR}/vendor/fribidi-0.19.7.tar.bz2
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh fribidi
#        CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        expat
#        # URL http://downloads.sourceforge.net/project/expat/expat/2.2.0/expat-2.2.0.tar.bz2
#        URL ${CMAKE_SOURCE_DIR}/vendor/expat-2.2.0.tar.bz2
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh expat
#        CONFIGURE_COMMAND PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH} ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        fontconfig
#        DEPENDS freetype expat
#        # URL http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2
#        URL ${CMAKE_SOURCE_DIR}/vendor/fontconfig-2.12.1.tar.bz2
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh fontconfig
#        CONFIGURE_COMMAND PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH} ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        libass
#        DEPENDS yasm freetype fribidi fontconfig
#        # URL https://github.com/libass/libass/releases/download/0.13.6/libass-0.13.6.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/libass-0.13.6.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libass
#        CONFIGURE_COMMAND PATH=$ENV{PATH} PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH} ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static
#        BUILD_COMMAND PATH=$ENV{PATH} make
#        BUILD_IN_SOURCE 1
#)
EXTERNALPROJECT_ADD(
        ffmpeg
        DEPENDS fdk-aac davs2 xavs2 x264
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
#        GIT_REPOSITORY https://git.ffmpeg.org/ffmpeg.git
        GIT_REPOSITORY https://github.com/vvhh2002/ffmpeg.git
        GIT_TAG redtea/4.1
#        PATCH_COMMAND sh ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh ffmpeg <SOURCE_DIR>
        CONFIGURE_COMMAND cd <SOURCE_DIR> && PKG_CONFIG_PATH=${EXTERNAL_LIB_INSTALL_PATH}/lib/pkgconfig ./configure --prefix=<INSTALL_DIR>  --disable-shared --enable-static --enable-gpl --enable-version3 --enable-nonfree --disable-doc --disable-debug --disable-ffplay --disable-outdevs --extra-cflags=-I<INSTALL_DIR>/include\ --static --extra-ldflags=-L<INSTALL_DIR>/lib --extra-libs=-lstdc++\ -ldl  --enable-libfdk-aac --enable-libdavs2 --enable-libx264 --enable-libxavs2 --disable-xlib --disable-libxcb --enable-pic --enable-hardcoded-tables
        BUILD_COMMAND   cd <SOURCE_DIR> && make
        INSTALL_COMMAND cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)
#LOG_DOWNLOAD TRUE
#LOG_UPDATE TRUE
#LOG_CONFIGURE TRUE
#LOG_BUILD TRUE
#LOG_INSTALL TRUE
#EXTERNALPROJECT_ADD(
#        libpng
#        DEPENDS zlib
#        # URL http://download.sourceforge.net/libpng/libpng-1.6.29.tar.gz
#        URL ${CMAKE_SOURCE_DIR}/vendor/libpng-1.6.29.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libpng
#        CONFIGURE_COMMAND CFLAGS=-I${CMAKE_BINARY_DIR}/include CPPFLAGS=-I${CMAKE_BINARY_DIR}/include LDFLAGS=-L${CMAKE_BINARY_DIR}/lib ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared --enable-static
#        BUILD_IN_SOURCE 1
#)
#EXTERNALPROJECT_ADD(
#        frmxtract
#        DEPENDS ffmpeg libpng
#        URL ${CMAKE_SOURCE_DIR}/vendor/frmxtract-3.3.3.tar.gz
#        PATCH_COMMAND ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh frmxtract
#        CONFIGURE_COMMAND CC=${CMAKE_C_COMPILER} PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH} ./configure --prefix=${CMAKE_BINARY_DIR}
#        BUILD_IN_SOURCE 1
#)

EXTERNALPROJECT_ADD(
        rapidjson
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
        GIT_REPOSITORY https://github.com/Tencent/rapidjson.git
        GIT_TAG v1.1.0
        CONFIGURE_COMMAND cd <SOURCE_DIR> && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DENABLE_SHARED:BOOL=OFF -DRAPIDJSON_HAS_STDSTRING=ON -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_DOC=OFF .
        BUILD_COMMAND cd <SOURCE_DIR> && make
        INSTALL_COMMAND cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)

EXTERNALPROJECT_ADD(
        spdlog
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
        GIT_REPOSITORY https://github.com/gabime/spdlog.git
        GIT_TAG v1.2.1
        CONFIGURE_COMMAND  cd <SOURCE_DIR> && cmake -G "Unix\ Makefiles" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DSPDLOG_BUILD_EXAMPLES=0 -DSPDLOG_BUILD_TESTING=0 -DSPDLOG_BUILD_BENCH=0  .
        BUILD_COMMAND cd <SOURCE_DIR> && make
        INSTALL_COMMAND cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)

EXTERNALPROJECT_ADD(
        libyuv
        PREFIX ${EXTERNAL_LIB_INSTALL_PATH}
        GIT_REPOSITORY https://github.com/vvhh2002/libyuv.git
        GIT_TAG master
        PATCH_COMMAND sh ${CMAKE_SOURCE_DIR}/patches/patch-manager.sh libyuv <SOURCE_DIR>
        CONFIGURE_COMMAND cd <SOURCE_DIR> && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DTEST=0 .
        BUILD_COMMAND cd <SOURCE_DIR> && make
        INSTALL_COMMAND cd <SOURCE_DIR> && make install
        BUILD_IN_SOURCE 1
#        LOG_DOWNLOAD true
#        LOG_UPDATE true
#        LOG_CONFIGURE true
#        LOG_BUILD true
#        LOG_INSTALL true
)

#EXTERNALPROJECT_ADD(
#        libconfig
#        URL ${CMAKE_CURRENT_SOURCE_DIR}/libconfig-1.4.8.tar.gz
#
#        PREFIX ${LIBCONFIG_PREFIX}
#
#        CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR> --disable-examples
#        # We patch in order to avoid building the tests.
#        # Otherwise compilation will fail due to relative paths used in libconfig.
#        PATCH_COMMAND patch < ${CMAKE_CURRENT_SOURCE_DIR}/libconfig.patch
#        BUILD_COMMAND make
#        INSTALL_COMMAND make install
#)

ExternalProject_Get_Property(ffmpeg INSTALL_DIR)

message("$$$$$$$$$%%%%%%%%%%%%%%%%%")
message("3rds INSTALL_DIR:${INSTALL_DIR}")
message("3rds INCLUDE_DIRECTORIES:${INCLUDE_DIRECTORIES}")
message("$$$$$$$$$%%%%%%%%%%%%%%%%%")
