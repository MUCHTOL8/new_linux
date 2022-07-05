# Libraries List

> List of libraries commonly found/used on linux machines.

- command to give show you all installed libraries.

`/sbin/ldconfig -p`



- command to show all installed packages (works backward from the installed libraries i think).

`dpkg -S $(/sbin/ldconfig -p | awk 'NR>1 { print $NF }')`
`this gave me mostly erros..`




- command to show all libraries: better and more descriptive than the previous command.

aptitude search '?and(?section(libs), ~i)'



alsa-topology-conf - ALSA topology configuration files
alsa-ucm-conf - ALSA Use Case Manager configuration files
bind9-libs - Shared Libraries used by BIND 9
dconf-gsettings-backend - simple configuration storage system - GSettings back-end
dconf-service - simple configuration storage system - D-Bus service
fontconfig-config - generic font configuration library - configuration
gamemode - Optimise Linux system performance on demand
gcc-10-base - GCC, the GNU Compiler Collection (base package)
gcc-10-base:i386 - GCC, the GNU Compiler Collection (base package)
gcc-9-base - GCC, the GNU Compiler Collection (base package)
gkbd-capplet - GNOME control center tools for libgnomekbd
glib-networking - network-related giomodules for GLib
glib-networking-common - network-related giomodules for GLib - data files
glib-networking-services - network-related giomodules for GLib - D-Bus services
gnome-keyring-pkcs11 - GNOME keyring module for the PKCS#11 module loading library
gnome-session-canberra - GNOME session log in and log out sound events
gsettings-desktop-schemas - GSettings desktop-wide schemas
gstreamer1.0-alsa - GStreamer plugin for ALSA
gstreamer1.0-clutter-3.0 - Clutter PLugin for GStreamer 1.0
gstreamer1.0-gl - GStreamer plugins for GL
gstreamer1.0-packagekit - GStreamer plugin to install codecs using PackageKit
gstreamer1.0-plugins-base - GStreamer plugins from the "base" set
gstreamer1.0-plugins-good - GStreamer plugins from the "good" set
gstreamer1.0-x - GStreamer plugins for X11 and Pango
gvfs - userspace virtual filesystem - GIO module
gvfs-backends - userspace virtual filesystem - backends
gvfs-bin - userspace virtual filesystem - deprecated command-line tools
gvfs-common - userspace virtual filesystem - common data files
gvfs-daemons - userspace virtual filesystem - servers
gvfs-fuse - userspace virtual filesystem - fuse server
gvfs-libs - userspace virtual filesystem - private libraries
iso-codes - ISO language, territory, currency, script codes and their translations
kactivities-bin - Command Line Tool for KActivities
kde-cli-tools-data - tools to use kioslaves from the command line
kinit - process launcher to speed up launching KDE applications
kio - resource and network access abstraction
klibc-utils - small utilities built with klibc for early boot
kpackagelauncherqml - commandline tool for launching kpackage QML application
ktexteditor-data - provide advanced plain text editing services
ktexteditor-katepart - provide advanced plain text editing services
kwayland-data - Qt library wrapper for Wayland libraries - data files
liba52-0.7.4 - library for decoding ATSC A/52 streams
libaa1 - ASCII art library
libabw-0.1-1 - library for reading and writing AbiWord(tm) documents
libaccounts-glib0 - library for single signon
libaccounts-qt5-1 - QT library for single sign on
libaccountsservice0 - query and manipulate user account information - shared libraries
libacl1 - access control list - shared library
libalut0 - OpenAL Utility Toolkit
libamtk-5-0 - Actions, Menus and Toolbars Kit for GTK+
libamtk-5-common - Actions, Menus and Toolbars Kit for GTK+ - architecture-independent files
libao-common - Cross Platform Audio Output Library (Common files)
libao4 - Cross Platform Audio Output Library
libaom0 - AV1 Video Codec Library
libapparmor1 - changehat AppArmor library
libappindicator3-1 - Application Indicators
libappstream4 - Library to access AppStream services
libapr1 - Apache Portable Runtime Library
libaprutil1 - Apache Portable Runtime Utility Library
libaprutil1-dbd-sqlite3 - Apache Portable Runtime Utility Library - SQLite3 Driver
libaprutil1-ldap - Apache Portable Runtime Utility Library - LDAP Driver
libapt-pkg6.0 - package management runtime library
libarchive13 - Multi-format archive and compression library (shared library)
libargon2-1 - memory-hard hashing function - runtime library
libaribb24-0 - library for ARIB STD-B24 decoding (runtime files)
libasan5 - AddressSanitizer -- a fast memory error detector
libasn1-8-heimdal - Heimdal Kerberos - ASN.1 library
libasound2 - shared library for ALSA applications
libasound2-data - Configuration files and profiles for ALSA drivers
libasound2-plugins - ALSA library additional plugins
libaspell15 - GNU Aspell spell-checker runtime library
libass9 - library for SSA/ASS subtitles rendering
libassuan0 - IPC library for the GnuPG components
libasyncns0 - Asynchronous name service query library
libatasmart4 - ATA S.M.A.R.T. reading and parsing library
libatk-bridge2.0-0 - AT-SPI 2 toolkit bridge - shared library
libatk1.0-0 - ATK accessibility toolkit
libatkmm-1.6-1v5 - C++ wrappers for ATK accessibility toolkit (shared libraries)
libatm1 - shared library for ATM (Asynchronous Transfer Mode)
libatomic1 - support library providing __atomic built-in functions
libatomic1:i386 - support library providing __atomic built-in functions
libatopology2 - shared library for handling ALSA topology definitions
libattr1 - extended attribute handling - shared library
libaudio2 - Network Audio System - shared libraries
libaudit-common - Dynamic library for security auditing - common files
libaudit1 - Dynamic library for security auditing
libavahi-client3 - Avahi client library
libavahi-common-data - Avahi common data files
libavahi-common3 - Avahi common library
libavahi-core7 - Avahi's embeddable mDNS/DNS-SD library
libavahi-glib1 - Avahi GLib integration library
libavc1394-0 - control IEEE 1394 audio/video devices
libavcodec58 - FFmpeg library with de/encoders for audio/video codecs - runtime files
libavdevice58 - FFmpeg library for handling input and output devices - runtime files
libavfilter7 - FFmpeg library containing media filters - runtime files
libavformat58 - FFmpeg library with (de)muxers for multimedia containers - runtime files
libavresample4 - FFmpeg compatibility library for resampling - runtime files
libavutil56 - FFmpeg library with functions for simplifying programming - runtime files
libbabeltrace1 - Babeltrace conversion libraries
libbasicusageenvironment1 - multimedia RTSP streaming library (BasicUsageEnvironment class)
libbdplus0 - implementation of BD+ for reading Blu-ray Discs
libblas3 - Basic Linear Algebra Reference implementations, shared library
libblkid1 - block device ID library
libblockdev-crypto2 - Crypto plugin for libblockdev
libblockdev-fs2 - file system plugin for libblockdev
libblockdev-loop2 - Loop device plugin for libblockdev
libblockdev-part-err2 - Partition error utility functions for libblockdev
libblockdev-part2 - Partitioning plugin for libblockdev
libblockdev-swap2 - Swap plugin for libblockdev
libblockdev-utils2 - Utility functions for libblockdev
libblockdev2 - Library for manipulating block devices
libbluetooth3 - Library to use the BlueZ Linux Bluetooth stack
libbluray2 - Blu-ray disc playback support library (shared library)
libboost-date-time1.71.0 - set of date-time libraries based on generic programming concepts
libboost-filesystem1.71.0 - filesystem operations (portable paths, iteration over directories, etc) in C++
libboost-iostreams1.71.0 - Boost.Iostreams Library
libboost-locale1.71.0 - C++ facilities for localization
libboost-thread1.71.0 - portable C++ multi-threading
libbrlapi0.7 - braille display access via BRLTTY - shared library
libbrotli1 - library implementing brotli encoder and decoder (shared libraries)
libbs2b0 - Bauer stereophonic-to-binaural DSP library
libbsd0 - utility functions from BSD systems - shared library
libbsd0:i386 - utility functions from BSD systems - shared library
libbz2-1.0 - high-quality block-sorting file compressor library - runtime
libc-ares2 - asynchronous name resolver
libc-bin - GNU C Library: Binaries
libc6 - GNU C Library: Shared libraries
libc6:i386 - GNU C Library: Shared libraries
libcaca0 - colour ASCII art library
libcairo-gobject2 - Cairo 2D vector graphics library (GObject library)
libcairo2 - Cairo 2D vector graphics library
libcairomm-1.0-1v5 - C++ wrappers for Cairo (shared libraries)
libcamel-1.2-62 - Evolution MIME message handling library
libcanberra-gtk3-0 - GTK+ 3.0 helper for playing widget event sounds with libcanberra
libcanberra0 - simple abstract interface for playing event sounds
libcap-ng0 - An alternate POSIX capabilities library
libcap2 - POSIX 1003.1e capabilities (library)
libcbor0.6 - library for parsing and generating CBOR (RFC 7049)
libcc1-0 - GCC cc1 plugin for GDB
libcddb2 - library to access CDDB data - runtime files
libcdio-cdda2 - library to read and control digital audio CDs
libcdio-paranoia2 - library to read digital audio CDs with error correction
libcdio18 - library to read and control CD-ROM
libcdr-0.1-1 - library for reading and converting Corel DRAW files
libcheese-gtk25 - tool to take pictures and videos from your webcam - widgets
libcheese8 - tool to take pictures and videos from your webcam - base library
libchm1 - library for dealing with Microsoft CHM files
libchromaprint1 - audio fingerprint library
libclucene-contribs1v5 - language specific text analyzers (runtime)
libclucene-core1v5 - core library for full-featured text search engine (runtime)
libclutter-1.0-0 - Open GL based interactive canvas library
libclutter-1.0-common - Open GL based interactive canvas library (common files)
libclutter-gst-3.0-0 - Open GL based interactive canvas library GStreamer elements
libclutter-gtk-1.0-0 - Open GL based interactive canvas library GTK+ widget
libcmis-0.5-5v5 - CMIS protocol client library
libcodec2-0.9 - Codec2 runtime library
libcogl-common - Object oriented GL/GLES Abstraction/Utility Layer (common files)
libcogl-pango20 - Object oriented GL/GLES Abstraction/Utility Layer
libcogl-path20 - Object oriented GL/GLES Abstraction/Utility Layer
libcogl20 - Object oriented GL/GLES Abstraction/Utility Layer
libcolamd2 - column approximate minimum degree ordering library for sparse matrices
libcolord-gtk1 - GTK+ convenience library for interacting with colord
libcolord2 - system service to manage device colour profiles -- runtime
libcolorhug2 - library to access the ColorHug colourimeter -- runtime
libcom-err2 - common error description library
libcommons-logging-java - common wrapper interface for several logging APIs
libcrack2 - pro-active password checker library
libcroco3 - Cascading Style Sheet (CSS) parsing and manipulation toolkit
libcrypt1 - libcrypt shared library
libcrypt1:i386 - libcrypt shared library
libcryptsetup12 - disk encryption support - shared library
libcue2 - CUE Sheet Parser Library
libcups2 - Common UNIX Printing System(tm) - Core library
libcupsfilters1 - OpenPrinting CUPS Filters - Shared library
libcupsimage2 - Common UNIX Printing System(tm) - Raster image library
libcurl3-gnutls - easy-to-use client-side URL transfer library (GnuTLS flavour)
libcurl4 - easy-to-use client-side URL transfer library (OpenSSL flavour)
libcwidget4 - high-level terminal interface library for C++ (runtime files)
libdaemon0 - lightweight C library for daemons - runtime library
libdaq2 - Data Acquisition library for packet I/O - shared library
libdatrie1 - Double-array trie library
libdb5.3 - Berkeley v5.3 Database Libraries [runtime]
libdbus-1-3 - simple interprocess messaging system (library)
libdbus-glib-1-2 - deprecated library for D-Bus IPC
libdbusmenu-glib4 - library for passing menus over DBus
libdbusmenu-gtk3-4 - library for passing menus over DBus - GTK+ version
libdbusmenu-qt5-2 - Qt implementation of the DBusMenu protocol
libdc1394-22 - high level programming interface for IEEE 1394 digital cameras
libdca0 - decoding library for DTS Coherent Acoustics streams
libdconf1 - simple configuration storage system - runtime library
ibdebconfclient0 - Debian Configuration Management System (C-implementation library)
libdee-1.0-4 - Model to synchronize multiple instances over DBus - shared lib
libdevmapper1.02.1 - Linux Kernel Device Mapper userspace library
libdirectfb-1.7-7 - direct frame buffer graphics (shared libraries)
libdjvulibre-text - Linguistic support files for libdjvulibre
libdjvulibre21 - Runtime support for the DjVu image format
libdns-export1109 - Exported DNS Shared Library
libdotconf0 - Configuration file parser library - runtime files
libdouble-conversion3 - routines to convert IEEE floats to and from strings
libdrm-amdgpu1 - Userspace interface to amdgpu-specific kernel DRM services -- runtime
libdrm-amdgpu1:i386 - Userspace interface to amdgpu-specific kernel DRM services -- runtime
libdrm-common - Userspace interface to kernel DRM services -- common files
libdrm-intel1 - Userspace interface to intel-specific kernel DRM services -- runtime
libdrm-intel1:i386 - Userspace interface to intel-specific kernel DRM services -- runtime
libdrm-nouveau2 - Userspace interface to nouveau-specific kernel DRM services -- runtime
libdrm-nouveau2:i386 - Userspace interface to nouveau-specific kernel DRM services -- runtime
libdrm-radeon1 - Userspace interface to radeon-specific kernel DRM services -- runtime
libdrm-radeon1:i386 - Userspace interface to radeon-specific kernel DRM services -- runtime
libdrm2 - Userspace interface to kernel DRM services -- runtime
libdrm2:i386 - Userspace interface to kernel DRM services -- runtime
libdumbnet1 - dumb, portable networking library -- shared library
libdv4 - software library for DV format digital video (runtime lib)
libdvbpsi10 - library for MPEG TS and DVB PSI tables decoding and generating
libdvdnav4 - DVD navigation library
libdvdread7 - library for reading DVDs
libdw1 - library that provides access to the DWARF debug information
libe-book-0.1-1 - library for reading and converting various  e-book formats
libebackend-1.2-10 - Utility library for evolution data servers
libebml4v5 - access library for the EBML format (shared library)
libebook-1.2-20 - Client library for evolution address books
libebook-contacts-1.2-3 - Client library for evolution contacts books
libecal-2.0-1 - Client library for evolution calendars
libedata-book-1.2-26 - Backend library for evolution address books
libedata-cal-2.0-1 - Backend library for evolution calendars
libedataserver-1.2-24 - Utility library for evolution data servers
libedataserverui-1.2-2 - Utility library for evolution data servers
libedit2 - BSD editline and history libraries
libedit2:i386 - BSD editline and history libraries
libeditorconfig0 - coding style indenter across editors - library
libefiboot1 - Library to manage UEFI variables
libefivar1 - Library to manage UEFI variables
libegl-mesa0 - free implementation of the EGL API -- Mesa vendor library
libegl1 - Vendor neutral GL dispatch library -- EGL support
libelf1 - library to read and write ELF files
libelf1:i386 - library to read and write ELF files
libenca0 - Extremely Naive Charset Analyser - shared library files
libenchant-2-2 - Wrapper library for various spell checker engines (runtime libs)
libeot0 - Library for parsing/converting Embedded OpenType files
libepoxy0 - OpenGL function pointer management library
libepub0 - library to work with the EPUB file format - runtime library
libepubgen-0.1-1 - EPUB generator library
libespeak-ng1 - Multi-lingual software speech synthesizer: shared library
libestr0 - Helper functions for handling strings (lib)
libetonyek-0.1-1 - library for reading and converting Apple Keynote presentations
libevdev2 - wrapper library for evdev devices
libevdocument3-4 - Document (PostScript, PDF) rendering library
libevent-2.1-7 - Asynchronous event notification library
libevview3-3 - Document (PostScript, PDF) rendering library - Gtk+ widgets
libexempi8 - library to parse XMP metadata (Library)
libexif12 - library to parse EXIF files
libexiv2-27 - EXIF/IPTC/XMP metadata manipulation library
libexpat1 - XML parsing C library - runtime library
libexpat1:i386 - XML parsing C library - runtime library
libext2fs2 - ext2/ext3/ext4 file system libraries
libexttextcat-2.0-0 - Language detection library
libfaad2 - freeware Advanced Audio Decoder - runtime files
libfakekey0 - library for converting characters to X key-presses [runtime]
libfam0 - Client library to control the FAM daemon
libfastjson4 - fast json library for C
libfbclient2 - Firebird client library
libfdisk1 - fdisk partitioning library
libffi7 - Foreign Function Interface library runtime
libffi7:i386 - Foreign Function Interface library runtime
libfftw3-double3 - Library for computing Fast Fourier Transforms - Double precision
libfftw3-single3 - Library for computing Fast Fourier Transforms - Single precision
libfido2-1 - library for generating and verifying FIDO 2.0 objects
libflac8 - Free Lossless Audio Codec - runtime C library
libflite1 - Small run-time speech synthesis engine - shared libraries
libfontconfig1 - generic font configuration library - runtime
libfontembed1 - OpenPrinting CUPS Filters - Font Embed Shared library
libfprint-2-2 - async fingerprint library of fprint project, shared libraries
libfprint-2-tod1 - async fingerprint library of fprint project, drivers shared libraries
libfreehand-0.1-1 - Library for parsing the FreeHand file format structure
libfreetype6 - FreeType 2 font engine, shared library files
libfribidi0 - Free Implementation of the Unicode BiDi algorithm
libfuse2 - Filesystem in Userspace (library)
libfwupd2 - Firmware update daemon library
libfwupdplugin1 - Firmware update daemon plugin library
libgail-common - GNOME Accessibility Implementation Library -- common modules
libgail18 - GNOME Accessibility Implementation Library -- shared libraries
libgamemode0 - Optimise Linux system performance on demand (libraries)
libgamemodeauto0 - Automatically optimise Linux system performance on demand
libgbm1 - generic buffer management API -- runtime
libgcab-1.0-0 - Microsoft Cabinet file manipulation library
libgcc-s1 - GCC support library
libgcc-s1:i386 - GCC support library
libgck-1-0 - Glib wrapper library for PKCS#11 - runtime
libgcr-base-3-1 - Library for Crypto related tasks
libgcr-ui-3-1 - Library for Crypto UI related tasks
libgcrypt20 - LGPL Crypto library - runtime library
libgd3 - GD Graphics Library
libgdata-common - Library for accessing GData webservices - common data files
libgdata22 - Library for accessing GData webservices - shared libraries
libgdbm-compat4 - GNU dbm database routines (legacy support runtime version) 
libgdbm6 - GNU dbm database routines (runtime version) 
libgdiplus - interface library for System.Drawing of Mono
libgdk-pixbuf2.0-0 - GDK Pixbuf library
libgdk-pixbuf2.0-bin - GDK Pixbuf library (thumbnailer)
libgdk-pixbuf2.0-common - GDK Pixbuf library - data files
libgdm1 - GNOME Display Manager (shared library)
libgee-0.8-2 - GObject based collection and utility library
libgeoclue-2-0 - convenience library to interact with geoinformation service
libgeocode-glib0 - geocoding and reverse geocoding GLib library using Nominatim
libgexiv2-2 - GObject-based wrapper around the Exiv2 library
libgif7 - library for GIF images (library)
libgirepository-1.0-1 - Library for handling GObject introspection data (runtime library)
libgit2-28 - low-level Git library
libgjs0g - Mozilla-based javascript bindings for the GNOME platform
libgl1 - Vendor neutral GL dispatch library -- legacy GL support
libgl1:i386 - Vendor neutral GL dispatch library -- legacy GL support
libgl1-mesa-dri - free implementation of the OpenGL API -- DRI modules
libgl1-mesa-dri:i386 - free implementation of the OpenGL API -- DRI modules
libgl1-mesa-glx:i386 - transitional dummy package
libglade2-0 - library to load .glade files at runtime
libglade2.0-cil - CLI binding for the Glade libraries 2.6
libglapi-mesa - free implementation of the GL API -- shared library
libglapi-mesa:i386 - free implementation of the GL API -- shared library
libglc0 - QuesoGLC OpenGL Character Renderer (GLC) implementation
libgles2 - Vendor neutral GL dispatch library -- GLESv2 support
libglewmx1.13 - OpenGL Extension Wrangler (Multiple Rendering Contexts)
libglib2.0-0 - GLib library of C routines
libglib2.0-cil - CLI binding for the GLib utility library 2.12
libglibmm-2.4-1v5 - C++ wrapper for the GLib toolkit (shared libraries)
libglu1-mesa - Mesa OpenGL utility library (GLU)
libglvnd0 - Vendor neutral GL dispatch library
libglvnd0:i386 - Vendor neutral GL dispatch library
libglx-mesa0 - free implementation of the OpenGL API -- GLX vendor library
libglx-mesa0:i386 - free implementation of the OpenGL API -- GLX vendor library
libglx0 - Vendor neutral GL dispatch library -- GLX support
libglx0:i386 - Vendor neutral GL dispatch library -- GLX support
libgme0 - Playback library for video game music files - shared library
libgmp10 - Multiprecision arithmetic library
libgnome-autoar-0-0 - Archives integration support for GNOME
libgnome-bluetooth13 - GNOME Bluetooth tools - support library
libgnome-desktop-3-19 - Utility library for loading .desktop files - runtime files
libgnomekbd-common - GNOME library to manage keyboard configuration - common files
libgnomekbd8 - GNOME library to manage keyboard configuration - shared library
libgnutls30 - GNU TLS library - main runtime library
libgoa-1.0-0b - library for GNOME Online Accounts
libgoa-1.0-common - library for GNOME Online Accounts - common files
libgoa-backend-1.0-1 - backend library for GNOME Online Accounts
libgomp1 - GCC OpenMP (GOMP) support library
libgpg-error0 - GnuPG development runtime library
libgpg-error0:i386 - GnuPG development runtime library
libgpgme11 - GPGME - GnuPG Made Easy (library)
libgpgmepp6 - C++ wrapper library for GPGME
libgphoto2-6 - gphoto2 digital camera library
libgphoto2-port12 - gphoto2 digital camera port library
libgpm2 - General Purpose Mouse - shared library
libgraphene-1.0-0 - library of graphic data types
libgraphite2-3 - Font rendering engine for Complex Scripts -- library
libgroupsock8 - multimedia RTSP streaming library (network interfaces and sockets)
libgs9 - interpreter for the PostScript language and for PDF - Library
libgs9-common - interpreter for the PostScript language and for PDF - common files
libgsf-1-114 - Structured File Library - runtime version
libgsf-1-common - Structured File Library - common files
libgsm1 - Shared libraries for GSM speech compressor
libgsound0 - small library for playing system sounds
libgspell-1-2 - spell-checking library for GTK+ applications
libgspell-1-common - libgspell architecture-independent files
libgssapi-krb5-2 - MIT Kerberos runtime libraries - krb5 GSS-API Mechanism
libgssapi3-heimdal - Heimdal Kerberos - GSSAPI support library
libgssdp-1.2-0 - GObject-based library for SSDP
libgstreamer-gl1.0-0 - GStreamer GL libraries
libgstreamer-plugins-base1.0-0 - GStreamer libraries from the "base" set
libgstreamer-plugins-good1.0-0 - GStreamer development files for libraries from the "good" set
libgstreamer1.0-0 - Core GStreamer libraries and elements
libgtk-3-0 - GTK graphical user interface library
libgtk2.0-0 - GTK graphical user interface library - old version
libgtk2.0-cil - CLI binding for the GTK+ toolkit 2.12
libgtkmm-3.0-1v5 - C++ wrappers for GTK+ (shared libraries)
libgtksourceview-4-0 - shared libraries for the GTK+ syntax highlighting widget
libgtksourceview-4-common - common files for the GTK+ syntax highlighting widget
libgtop-2.0-11 - gtop system monitoring library (shared)
libgtop2-common - gtop system monitoring library (common)
libgudev-1.0-0 - GObject-based wrapper library for libudev
libgupnp-1.2-0 - GObject-based library for UPnP
libgupnp-av-1.0-2 - Audio/Visual utility library for GUPnP
libgupnp-dlna-2.0-3 - DLNA utility library for GUPnP
libgusb2 - GLib wrapper around libusb1
libgweather-3-16 - GWeather shared library
libgweather-common - GWeather common files
libgxps2 - handling and rendering XPS documents (library)
libhandy-0.0-0 - Library with GTK widgets for mobile phones
libharfbuzz-icu0 - OpenType text shaping engine ICU backend
libharfbuzz0b - OpenType text shaping engine (shared library)
libhcrypto4-heimdal - Heimdal Kerberos - crypto library
libheimbase1-heimdal - Heimdal Kerberos - Base library
libheimntlm0-heimdal - Heimdal Kerberos - NTLM support library
libhfstospell10 - HFST spell checker runtime libraries
libhogweed5 - low level cryptographic library (public-key cryptos)
libhpmud0 - HP Multi-Point Transport Driver (hpmud) run-time libraries
libhttp-parser2.9 - parser for HTTP messages written in C
libhunspell-1.7-0 - spell checker and morphological analyzer (shared library)
libhx509-5-heimdal - Heimdal Kerberos - X509 support library
libhyphen0 - ALTLinux hyphenation library - shared library
libib-util - Firebird UDF support library
libibus-1.0-5 - Intelligent Input Bus - shared library
libical3 - iCalendar library implementation in C (runtime)
libice6 - X11 Inter-Client Exchange library
libicu66 - International Components for Unicode
libidn11 - GNU Libidn library, implementation of IETF IDN specifications
libidn2-0 - Internationalized domain names (IDNA2008/TR46) library
libidn2-0:i386 - Internationalized domain names (IDNA2008/TR46) library
libiec61883-0 - partial implementation of IEC 61883 (shared lib)
libieee1284-3 - cross-platform library for parallel port access
libigdgmm11 - Intel Graphics Memory Management Library -- shared library
libijs-0.35 - IJS raster image transport protocol: shared library
libilmbase24 - several utility libraries from ILM used by OpenEXR
libimagequant0 - palette quantization library
libimobiledevice6 - Library for communicating with iPhone and other Apple devices
libinput-bin - input device management and event handling library - udev quirks
libinput10 - input device management and event handling library - shared library
libip4tc2 - netfilter libip4tc library
libip6tc2 - netfilter libip6tc library
libisc-export1105 - Exported ISC Shared Library
libisl22 - manipulating sets and relations of integer points bounded by linear constraints
libitm1 - GNU Transactional Memory Library
libiw30 - Wireless tools - library
libixml10 - Portable SDK for UPnP Devices, version 1.8 (ixml shared library)
libjack-jackd2-0 - JACK Audio Connection Kit (libraries)
libjansson4 - C library for encoding, decoding and manipulating JSON data
libjavascriptcoregtk-4.0-18 - JavaScript engine library from WebKitGTK
libjbig0 - JBIGkit libraries
libjbig2dec0 - JBIG2 decoder library - shared libraries
libjpeg-turbo8 - IJG JPEG compliant runtime library.
libjpeg8 - Independent JPEG Group's JPEG runtime library (dependency package)
libjson-c4 - JSON manipulation library - shared library
libjson-glib-1.0-0 - GLib JSON manipulation library
libjson-glib-1.0-common - GLib JSON manipulation library (common files)
libjxr0 - JPEG-XR lib - libraries
libk5crypto3 - MIT Kerberos runtime libraries - Crypto Library
libkate1 - Codec for karaoke and text encapsulation
libkf5activities5 - Library to organize the user work in separate activities.
libkf5archive5 - Qt 5 addon providing access to numerous types of archives
libkf5attica5 - Qt library that implements the Open Collaboration Services API
libkf5auth-data - Abstraction to system policy and authentication features
libkf5auth5 - Abstraction to system policy and authentication features
libkf5authcore5 - Abstraction to system policy and authentication features
libkf5bluezqt-data - data files for bluez-qt
libkf5bluezqt6 - Qt wrapper for bluez
libkf5bookmarks-data - Qt library with support for bookmarks and the XBEL format.
libkf5bookmarks5 - Qt library with support for bookmarks and the XBEL format.
libkf5calendarevents5 - provides integration of QML and KDE frameworks -- calendarevents
libkf5completion-data - Widgets with advanced auto-completion features.
libkf5completion5 - Widgets with advanced auto-completion features.
libkf5config-bin - configuration settings framework for Qt
libkf5config-data - configuration settings framework for Qt
libkf5configcore5 - configuration settings framework for Qt
libkf5configgui5 - configuration settings framework for Qt
libkf5configwidgets-data - Extra widgets for easier configuration support.
libkf5configwidgets5 - Extra widgets for easier configuration support.
libkf5contacts-data - data files for kcontacts
libkf5contacts5 - address book API for KDE frameworks
libkf5coreaddons-data - KDE Frameworks 5 addons to QtCore - data files
libkf5coreaddons5 - KDE Frameworks 5 addons to QtCore
libkf5crash5 - Support for application crash analysis and bug report from apps
libkf5dbusaddons-bin - class library for qtdbus
libkf5dbusaddons-data - class library for qtdbus
libkf5dbusaddons5 - class library for qtdbus
libkf5declarative-data - provides integration of QML and KDE frameworks
libkf5declarative5 - provides integration of QML and KDE frameworks
libkf5globalaccel-bin - Configurable global shortcut support.
libkf5globalaccel-data - Configurable global shortcut support.
libkf5globalaccel5 - Configurable global shortcut support.
libkf5globalaccelprivate5 - Configurable global shortcut support - private runtime library
libkf5guiaddons5 - additional addons for QtGui
libkf5i18n-data - Advanced internationalization framework.
libkf5i18n5 - Advanced internationalization framework.
libkf5iconthemes-bin - Support for icon themes
libkf5iconthemes-data - Support for icon themes.
libkf5iconthemes5 - Support for icon themes.
libkf5idletime5 - library to provide information about idle time
libkf5itemmodels5 - additional item/view models for Qt Itemview
libkf5itemviews-data - Qt library with additional widgets for ItemModels
libkf5itemviews5 - Qt library with additional widgets for ItemModels
libkf5jobwidgets-data - Widgets for tracking KJob instances
libkf5jobwidgets5 - Widgets for tracking KJob instances
libkf5js5 - Support for JS scripting in Qt applications
libkf5jsapi5 - Support for JS scripting in Qt applications
libkf5kcmutils-data - Extra APIs to write KConfig modules.
libkf5kcmutils5 - Extra APIs to write KConfig modules.
libkf5kexiv2-15.0.0 - Qt like interface for the libexiv2 library
libkf5khtml-bin - HTML widget and component
libkf5khtml-data - HTML widget and component
libkf5khtml5 - HTML widget and component
libkf5kiocore5 - resource and network access abstraction (KIO core library)
libkf5kiofilewidgets5 - resource and network access abstraction (KIO file widgets library)
libkf5kiogui5 - resource and network access abstraction (KIO gui library)
libkf5kiontlm5 - resource and network access abstraction (KIO NTLM library)
libkf5kiowidgets5 - resource and network access abstraction (KIO widgets library)
libkf5kirigami2-5 - set of QtQuick components targeted for mobile use
libkf5newstuff-data - Support for downloading application assets from the network.
libkf5newstuff5 - Support for downloading application assets from the network.
libkf5newstuffcore5 - Support for downloading application assets from the network.
libkf5notifications-data - Framework for desktop notifications
libkf5notifications5 - Framework for desktop notifications
libkf5package-data - non-binary asset management framework
libkf5package5 - non-binary asset management framework
libkf5parts-data - Document centric plugin system.
libkf5parts-plugins - Document centric plugin system.
libkf5parts5 - Document centric plugin system.
libkf5people-data - data files for kpeople
libkf5people5 - framework providing unified access to contacts aggregated by person
libkf5peoplebackend5 - framework providing unified access to contacts aggregated by person
libkf5peoplewidgets5 - framework providing unified access to contacts aggregated by person
libkf5plasma5 - Plasma Runtime components
libkf5plasmaquick5 - Plasma Runtime components
libkf5pty-data - Pty abstraction.
libkf5pty5 - Pty abstraction.
libkf5pulseaudioqt2 - Pulseaudio bindings library for Qt
libkf5purpose-bin - abstraction to provide and leverage actions of a specific kind, runtime
libkf5purpose5 - library for abstractions to get the developer's purposes fulfilled
libkf5quickaddons5 - provides integration of QML and KDE frameworks -- quickaddons
libkf5service-bin - Advanced plugin and service introspection
libkf5service-data - Advanced plugin and service introspection
libkf5service5 - Advanced plugin and service introspection
libkf5solid5 - Qt library to query and control hardware
libkf5solid5-data - Qt library to query and control hardware
libkf5sonnet5-data - spell checking library for Qt, data files
libkf5sonnetcore5 - spell checking library for Qt, core lib
libkf5sonnetui5 - spell checking library for Qt, ui lib
libkf5su-bin - runtime files for kdesu
libkf5su-data - translation files for kdesu
libkf5su5 - Integration with su for elevated privileges.
libkf5syntaxhighlighting-data - Syntax highlighting Engine - translations
libkf5syntaxhighlighting5 - Syntax highlighting Engine
libkf5texteditor-bin - provide advanced plain text editing services (binaries)
libkf5texteditor5 - provide advanced plain text editing services
libkf5texteditor5-libjs-underscore - Bridge package for libjs-underscore
libkf5textwidgets-data - Advanced text editing widgets.
libkf5textwidgets5 - Advanced text editing widgets.
libkf5threadweaver5 - ThreadWeaver library to help multithreaded programming in Qt
libkf5wallet-bin - Secure and unified container for user passwords.
libkf5wallet-data - Secure and unified container for user passwords.
libkf5wallet5 - Secure and unified container for user passwords.
libkf5waylandclient5 - Qt library wrapper for Wayland libraries
libkf5widgetsaddons-data - add-on widgets and classes for applications that use the Qt Widgets module
libkf5widgetsaddons5 - add-on widgets and classes for applications that use the Qt Widgets module
libkf5windowsystem-data - Convenience access to certain properties and features of the window manager
libkf5windowsystem5 - Convenience access to certain properties and features of the window manager
libkf5xmlgui-bin - User configurable main windows.
libkf5xmlgui-data - User configurable main windows.
libkf5xmlgui5 - User configurable main windows.
libklibc - minimal libc subset for use with initramfs
libkmod2 - libkmod shared library
libkpathsea6 - TeX Live: path search library for TeX (runtime part)
libkrb5-26-heimdal - Heimdal Kerberos - libraries
libkrb5-3 - MIT Kerberos runtime libraries
libkrb5support0 - MIT Kerberos runtime libraries - Support library
libksba8 - X.509 and CMS support library
libkwalletbackend5-5 - Secure and unified container for user passwords.
liblangtag-common - library to access tags for identifying languages -- data
liblangtag1 - library to access tags for identifying languages
liblcms2-2 - Little CMS 2 color management library
libldap-2.4-2 - OpenLDAP libraries
libldap-common - OpenLDAP common files for libraries
libldb2 - LDAP-like embedded database - shared library
liblilv-0-0 - library for simple use of LV2 plugins
liblinear4 - Library for Large Linear Classification
liblirc-client0 - infra-red remote control support - client library
liblivemedia77 - multimedia RTSP streaming library
libllvm10 - Modular compiler and toolchain technologies, runtime library
libllvm11 - Modular compiler and toolchain technologies, runtime library
libllvm11:i386 - Modular compiler and toolchain technologies, runtime library
ibllvm9 - Modular compiler and toolchain technologies, runtime library
liblmdb0 - Lightning Memory-Mapped Database shared library
liblouis20 - Braille translation library - shared libs
liblouisutdml9 - Braille UTDML translation library - shared libs
liblqr-1-0 - converts plain array images into multi-size representation
liblsan0 - LeakSanitizer -- a memory leak detector (runtime)
libltdl7 - System independent dlopen wrapper for GNU libtool
liblua5.2-0 - Shared library for the Lua interpreter version 5.2
liblua5.3-0 - Shared library for the Lua interpreter version 5.3
liblz4-1 - Fast LZ compression algorithm library - runtime
liblzma5 - XZ-format compression library
liblzo2-2 - data compression library
libmad0 - MPEG audio decoder library
libmagic-mgc - File type determination library using "magic" numbers (compiled magic file)
libmagic1 - Recognize the type of data in a file using "magic" numbers - library
libmagickcore-6.q16-6 - low-level image manipulation library -- quantum depth Q16
libmagickcore-6.q16-6-extra - low-level image manipulation library - extra codecs (Q16)
libmagickwand-6.q16-6 - image manipulation library -- quantum depth Q16
libmarkdown2 - implementation of the Markdown markup language in C (library)
libmatroska6v5 - extensible open standard audio/video container format (shared library)
libmaxminddb0 - IP geolocation database library
libmbedcrypto3 - lightweight crypto and SSL/TLS library - crypto library
libmbedtls12 - lightweight crypto and SSL/TLS library - tls library
libmbedx509-0 - lightweight crypto and SSL/TLS library - x509 certificate library
libmbim-glib4 - Support library to use the MBIM protocol
libmediaart-2.0-0 - media art extraction and cache management library
libmhash2 - Library for cryptographic hashing and message authentication
libminizip1 - compression library - minizip library
libmm-glib0 - D-Bus service for managing modems - shared libraries
libmng2 - Multiple-image Network Graphics library
libmnl0 - minimalistic Netlink communication library
libmount1 - device mounting library
libmozjs-68-0 - SpiderMonkey JavaScript library
libmp3lame0 - MP3 encoding library
libmpc3 - multiple precision complex floating-point library
libmpcdec6 - MusePack decoder - library
libmpdec2 - library for decimal floating point arithmetic (runtime library)
libmpeg2-4 - MPEG1 and MPEG2 video decoder library
libmpfr6 - multiple precision floating-point computation
libmpg123-0 - MPEG layer 1/2/3 audio decoder (shared library)
libmsgpackc2 - binary-based efficient object serialization library
libmspub-0.1-1 - library for parsing the mspub file structure
libmtdev1 - Multitouch Protocol Translation Library - shared library
libmtp-common - Media Transfer Protocol (MTP) common files
libmtp-runtime - Media Transfer Protocol (MTP) runtime tools
libmtp9 - Media Transfer Protocol (MTP) library
libmutter-6-0 - window manager library from the Mutter window manager
libmwaw-0.3-3 - import library for some old Mac text documents
libmysofa1 - library to read HRTFs stored in the AES69-2015 SOFA format
libmysqlclient21 - MySQL database client library
libmythes-1.2-0 - simple thesaurus library
libnautilus-extension1a - libraries for nautilus components - runtime version
libncurses6 - shared libraries for terminal handling
libncursesw6 - shared libraries for terminal handling (wide character support)
libndp0 - Library for Neighbor Discovery Protocol
libneon27-gnutls - HTTP and WebDAV client library (GnuTLS enabled)
libnetfilter-conntrack3 - Netfilter netlink-conntrack library
libnetpbm10 - Graphics conversion tools shared libraries
libnettle7 - low level cryptographic library (symmetric and one-way cryptos)
libnewt0.52 - Not Erik's Windowing Toolkit - text mode windowing with slang
libnfnetlink0 - Netfilter netlink library
libnfs13 - NFS client library (shared library)
libnftnl11 - Netfilter nftables userspace API library
libnghttp2-14 - library implementing HTTP/2 protocol (shared library)
libnl-3-200 - library for dealing with netlink sockets
libnl-genl-3-200 - library for dealing with netlink sockets - generic netlink
libnl-route-3-200 - library for dealing with netlink sockets - route interface
libnm0 - GObject-based client library for NetworkManager
libnma0 - library for wireless and mobile dialogs (libnm version)
libnorm1 - NACK-Oriented Reliable Multicast (NORM) library
libnotify4 - sends desktop notifications to a notification daemon
libnpth0 - replacement for GNU Pth using system threads
libnspr4 - NetScape Portable Runtime Library
libnss3 - Network Security Service libraries
libntfs-3g883 - read/write NTFS driver for FUSE (runtime library)
libnuma1 - Libraries for controlling NUMA policy
libodfgen-0.1-1 - library to generate ODF documents
libogg0 - Ogg bitstream library
libokular5core9 - libraries for the Okular document viewer
libopenal-data - Software implementation of the OpenAL audio API (data files)
libopenal1 - Software implementation of the OpenAL audio API (shared library)
libopenexr24 - runtime files for the OpenEXR image library
libopenjp2-7 - JPEG 2000 image compression/decompression library
libopenmpt-modplug1 - module music library based on OpenMPT -- modplug compat library
libopenmpt0 - module music library based on OpenMPT -- shared library
libopus0 - Opus codec runtime library
liborc-0.4-0 - Library of Optimized Inner Loops Runtime Compiler
liborcus-0.15-0 - library for processing spreadsheet documents
libp11-kit0 - library for loading and coordinating access to PKCS#11 modules - runtime
libpackagekit-glib2-18 - Library for accessing PackageKit using GLib
libpagemaker-0.0-0 - Library for importing and converting PageMaker Documents
libpam-cap - POSIX 1003.1e capabilities (PAM module)
libpam0g - Pluggable Authentication Modules library
libpango-1.0-0 - Layout and rendering of internationalized text
libpangocairo-1.0-0 - Layout and rendering of internationalized text
libpangoft2-1.0-0 - Layout and rendering of internationalized text
libpangomm-1.4-1v5 - C++ Wrapper for pango (shared libraries)
libpangoxft-1.0-0 - Layout and rendering of internationalized text
libpaper1 - library for handling paper characteristics
libparted-fs-resize0 - disk partition manipulator - shared FS resizing library
libparted2 - disk partition manipulator - shared library
libpcap0.8 - system interface for user-level packet capture
libpcaudio0 - C API to different audio devices - shared library
libpci3 - PCI utilities (shared library)
libpciaccess0 - Generic PCI access library for X
libpciaccess0:i386 - Generic PCI access library for X
libpcre2-16-0 - New Perl Compatible Regular Expression Library - 16 bit runtime files
libpcre2-32-0 - New Perl Compatible Regular Expression Library - 32 bit runtime files
libpcre2-8-0 - New Perl Compatible Regular Expression Library- 8 bit runtime files
libpcre3 - Old Perl 5 Compatible Regular Expression Library - runtime files
libpcsclite1 - Middleware to access a smart card using PC/SC (library)
libpeas-1.0-0 - Application plugin library
libpeas-common - Application plugin library (common files)
libperl5.30 - shared Perl library
libpgm-5.2-0 - OpenPGM shared library
libphonenumber7 - parsing/formatting/validating phone numbers
libphonon4qt5-4 - multimedia framework from KDE using Qt 5 - core library
libpipeline1 - Unix process pipeline manipulation library
libpixman-1-0 - pixel-manipulation library for X and cairo
libpkcs11-helper1 - library that simplifies the interaction with PKCS#11
libplacebo7 - GPU-accelerated video/image rendering primitives (shared library)
libplist3 - Library for handling Apple binary and XML property lists
libplymouth5 - graphical boot animation and logger - shared libraries
libpng16-16 - PNG library - runtime (version 1.6)
libpodofo0.9.6 - PoDoFo - library to work with the PDF file format
libpolkit-agent-1-0 - PolicyKit Authentication Agent API
libpolkit-gobject-1-0 - PolicyKit Authorization API
libpolkit-qt5-1-1 - PolicyKit-qt5-1 library
libpoppler-cpp0v5 - PDF rendering library (CPP shared library)
libpoppler-glib8 - PDF rendering library (GLib-based shared library)
libpoppler-qt5-1 - PDF rendering library (Qt 5 based shared library)
libpoppler97 - PDF rendering library
libpopt0 - lib for parsing cmdline parameters
libpostproc55 - FFmpeg library for post processing - runtime files
libpq5 - PostgreSQL C client library
libprocps8 - library for accessing process information from /proc
libprotobuf-lite17 - protocol buffers C++ library (lite version)
libprotobuf17 - protocol buffers C++ library
libproxy-tools - automatic proxy configuration management library (tools)
libproxy1-plugin-gsettings - automatic proxy configuration management library (GSettings plugin)
libproxy1-plugin-networkmanager - automatic proxy configuration management library (Network Manager plugin)
libproxy1v5 - automatic proxy configuration management library (shared)
libpsl5 - Library for Public Suffix List (shared libraries)
libpulse0 - PulseAudio client libraries
libpwquality-common - library for password quality checking and generation (data files)
libpwquality1 - library for password quality checking and generation
libpython3.8 - Shared Python runtime library (version 3.8)
libqca-qt5-2 - libraries for the Qt Cryptographic Architecture
libqca-qt5-2-plugins - QCA plugins for libqca2
libqmi-glib5 - Support library to use the Qualcomm MSM Interface (QMI) protocol
libqmobipocket2 - library for reading Mobipocket documents
libqpdf26 - runtime library for PDF transformation/inspection software
libqt5core5a - Qt 5 core module
libqt5dbus5 - Qt 5 D-Bus module
libqt5designer5 - Qt 5 designer module
libqt5gui5 - Qt 5 GUI module
libqt5help5 - Qt 5 help module
libqt5multimedia5 - Qt 5 Multimedia module
libqt5multimedia5-plugins - Qt 5 Multimedia module plugins
libqt5multimediagsttools5 - GStreamer tools for  Qt 5 Multimedia module
libqt5multimediawidgets5 - Qt 5 Multimedia Widgets module
libqt5network5 - Qt 5 network module
libqt5opengl5 - Qt 5 OpenGL module
libqt5positioning5 - Qt Positioning module
libqt5printsupport5 - Qt 5 print support module
libqt5qml5 - Qt 5 QML module
libqt5quick5 - Qt 5 Quick library
libqt5quickcontrols2-5 - Qt 5 Quick Controls 2 library
libqt5quicktemplates2-5 - Qt 5 Quick Templates 2 library
libqt5quickwidgets5 - Qt 5 Quick Widgets library
libqt5sql5 - Qt 5 SQL module
libqt5sql5-sqlite - Qt 5 SQLite 3 database driver
libqt5svg5 - Qt 5 SVG module
libqt5test5 - Qt 5 test module
libqt5texttospeech5 - Speech library for Qt - libraries
libqt5waylandclient5 - QtWayland client library
libqt5waylandcompositor5 - QtWayland compositor library
libqt5webchannel5 - Web communication library for Qt
libqt5webengine-data - Web content engine library for Qt - Data
libqt5webengine5 - Web content engine library for Qt
libqt5webenginecore5 - Web content engine library for Qt - Core
libqt5webenginewidgets5 - Web content engine library for Qt - Widget
libqt5widgets5 - Qt 5 widgets module
libqt5x11extras5 - Qt 5 X11 extras
libqt5xml5 - Qt 5 XML module
libquadmath0 - GCC Quad-Precision Math Library
libraptor2-0 - Raptor 2 RDF syntax library
librasqal3 - Rasqal RDF query library
libraw1394-11 - library for direct access to IEEE 1394 bus (aka FireWire)
libraw19 - raw image decoder library
librdf0 - Redland Resource Description Framework (RDF) library
libre2-5 - efficient, principled regular expression library
libreadline8 - GNU readline and history libraries, run-time libraries
libresid-builder0c2a - SID chip emulation class based on resid
librest-0.7-0 - REST service access library
librevenge-0.0-0 - Base Library for writing document interface filters
libroken18-heimdal - Heimdal Kerberos - roken support library
librsvg2-2 - SAX-based renderer library for SVG files (runtime)
librsvg2-common - SAX-based renderer library for SVG files (extra runtime)
librtmp1 - toolkit for RTMP streams (shared library)
librubberband2 - audio time-stretching and pitch-shifting library
librygel-core-2.6-2 - GNOME UPnP/DLNA services - core library
librygel-db-2.6-2 - GNOME UPnP/DLNA services - db library
librygel-renderer-2.6-2 - GNOME UPnP/DLNA services - renderer library
librygel-server-2.6-2 - GNOME UPnP/DLNA services - server library
libsamplerate0 - Audio sample rate conversion library
libsane - API library for scanners
libsane-common - API library for scanners -- documentation and support files
libsane-hpaio - HP SANE backend for multi-function peripherals
libsasl2-2 - Cyrus SASL - authentication abstraction library
libsasl2-modules-db - Cyrus SASL - pluggable authentication modules (DB)
libsbc1 - Sub Band CODEC library - runtime
libsdl-image1.2 - Image loading library for Simple DirectMedia Layer 1.2, libraries
libsdl1.2debian - Simple DirectMedia Layer
libsdl2-2.0-0 - Simple DirectMedia Layer
libsdl2-image-2.0-0 - Image loading library for Simple DirectMedia Layer 2, libraries
libseccomp2 - high level interface to Linux seccomp filter
libsecret-1-0 - Secret store
libsecret-common - Secret store (common files)
libselinux1 - SELinux runtime shared libraries
libsemanage-common - Common files for SELinux policy management libraries
libsemanage1 - SELinux policy management library
libsensors5 - library to read temperature/voltage/fan sensors
libsensors5:i386 - library to read temperature/voltage/fan sensors
libsepol1 - SELinux library for manipulating binary security policies
libserd-0-0 - lightweight RDF syntax library
libshine3 - Fixed-point MP3 encoding library - runtime files
libshout3 - MP3/Ogg Vorbis broadcast streaming library
libsidplay2 - SID (MOS 6581) emulation library
libsigc++-2.0-0v5 - type-safe Signal Framework for C++ - runtime
libsignon-plugins-common1 - Single Sign On framework
libsignon-qt5-1 - Single Sign On framework
libsigsegv2 - Library for handling page faults in a portable way
libslang2 - S-Lang programming library - runtime version
libsm6 - X11 Session Management library
libsmartcols1 - smart column output alignment library
libsmbclient - shared library for communication with SMB/CIFS servers
libsmbios-c2 - Provide access to (SM)BIOS information -- dynamic library
libsmi2ldbl - library to access SMI MIB information
libsnapd-glib1 - GLib snapd library
libsnappy1v5 - fast compression/decompression library
libsndfile1 - Library for reading/writing audio files
libsndio7.0 - Small audio and MIDI framework from OpenBSD, runtime libraries
libsnmp-base - SNMP configuration script, MIBs and documentation
libsnmp35 - SNMP (Simple Network Management Protocol) library
libsodium23 - Network communication, cryptography and signaturing library
libsonic0 - Simple library to speed up or slow down speech
libsoup-gnome2.4-1 - HTTP library implementation in C -- GNOME support library
libsoup2.4-1 - HTTP library implementation in C -- Shared library
libsoxr0 - High quality 1D sample-rate conversion library
libspandsp2 - Telephony signal processing library
libspatialaudio0 - library for ambisonic encoding and decoding (runtime files)
libspectre1 - Library for rendering PostScript documents
libspeechd2 - Speech Dispatcher: Shared libraries
libspeex1 - The Speex codec runtime library
libspeexdsp1 - The Speex extended runtime library
libsqlite3-0 - SQLite 3 shared library
libsratom-0-0 - library for serialising LV2 atoms to/from Turtle
libsrt1 - Secure Reliable Transport UDP streaming library
libss2 - command-line interface parsing library
libssh-4 - tiny C SSH library (OpenSSL flavor)
libssh-gcrypt-4 - tiny C SSH library (gcrypt flavor)
libssh2-1 - SSH2 client-side library
libssl1.1 - Secure Sockets Layer toolkit - shared libraries
libstartup-notification0 - library for program launch feedback (shared library)
libstdc++6 - GNU Standard C++ Library v3
libstdc++6:i386 - GNU Standard C++ Library v3
libstemmer0d - Snowball stemming algorithms for use in Information Retrieval
libsuitesparseconfig5 - configuration routines for all SuiteSparse modules
libswresample3 - FFmpeg library for audio resampling, rematrixing etc. - runtime files
libswscale5 - FFmpeg library for image scaling and various conversions - runtime files
libsynctex2 - TeX Live: SyncTeX parser library
libsysmetrics1 - Report hardware and other collected metrics - shared lib
libsystemd0 - systemd utility library
libtag1v5 - audio meta-data library
libtag1v5-vanilla - audio meta-data library - vanilla flavour
libtalloc2 - hierarchical pool based memory allocator
libtasn1-6 - Manage ASN.1 structures (runtime)
libtdb1 - Trivial Database - shared library
libtepl-4-0 - Text editor library for GTK
libtermkey1 - library for processing keyboard input
libtevent0 - talloc-based event loop library - shared library
libthai-data - Data files for Thai language support library
libthai0 - Thai language support library
libtheora0 - Theora Video Compression Codec
libtiff5 - Tag Image File Format (TIFF) library
libtinfo6 - shared low-level terminfo library for terminal handling
libtinfo6:i386 - shared low-level terminfo library for terminal handling
libtommath1 - multiple-precision integer library [runtime]
libtotem-plparser-common - Totem Playlist Parser library - common files
libtotem-plparser18 - Totem Playlist Parser library - runtime files
libtracker-control-2.0-0 - library to control/monitor tracker miners
libtracker-miner-2.0-0 - tracker data miner library
libtracker-sparql-2.0-0 - metadata database, indexer and search tool - library
libtsan0 - ThreadSanitizer -- a Valgrind-based detector of data races (runtime)
libtss2-esys0 - TPM2 Software stack library - TSS and TCTI libraries
libtwolame0 - MPEG Audio Layer 2 encoding library
libu2f-udev - Universal 2nd Factor (U2F) common files
libubsan1 - UBSan -- undefined behaviour sanitizer (runtime)
libuchardet0 - universal charset detection library - shared library
libudev1 - libudev shared library
libudev1:i386 - libudev shared library
libudisks2-0 - GObject based library to access udisks2
libunibilium4 - simple, self-contained terminfo library
libunistring2 - Unicode string library for C
libunistring2:i386 - Unicode string library for C
libunity-protocol-private0 - binding to get places into the launcher - private library
libunity9 - binding to get places into the launcher - shared library
libuno-cppu3 - LibreOffice UNO runtime environment -- CPPU public library
libuno-cppuhelpergcc3-3 - LibreOffice UNO runtime environment -- CPPU helper library
libuno-purpenvhelpergcc3-3 - LibreOffice UNO runtime environment -- "purpose environment" helper
libuno-sal3 - LibreOffice UNO runtime environment -- SAL public library
libuno-salhelpergcc3-3 - LibreOffice UNO runtime environment -- SAL helpers for C++ library
libunwind8 - library to determine the call-chain of a program - runtime
libupnp13 - Portable SDK for UPnP Devices, version 1.8 (shared library)
libupower-glib3 - abstraction for power management - shared library
libusageenvironment3 - multimedia RTSP streaming library (UsageEnvironment classes)
libusb-1.0-0 - userspace USB programming library
libusbmuxd6 - USB multiplexor daemon for iPhone and iPod Touch devices - library
libuuid1 - Universally Unique ID library
libuv1 - asynchronous event notification library - runtime library
libv4l-0 - Collection of video4linux support libraries
libv4lconvert0 - Video4linux frame format conversion library
libva-drm2 - Video Acceleration (VA) API for Linux -- DRM runtime
libva-wayland2 - Video Acceleration (VA) API for Linux -- Wayland runtime
libva-x11-2 - Video Acceleration (VA) API for Linux -- X11 runtime
libva2 - Video Acceleration (VA) API for Linux -- runtime
libvdpau1 - Video Decode and Presentation API for Unix (libraries)
libvidstab1.1 - video stabilization library (shared library)
libvisio-0.1-1 - library for parsing the visio file structure
libvisual-0.4-0 - audio visualization framework
libvlc5 - multimedia player and streamer library
libvlccore9 - base library for VLC and its modules
libvoikko1 - Library of free natural language processing tools
libvolume-key1 - Library for manipulating storage encryption keys and passphrases
libvorbis0a - decoder library for Vorbis General Audio Compression Codec
libvorbisenc2 - encoder library for Vorbis General Audio Compression Codec
libvorbisfile3 - high-level API for Vorbis General Audio Compression Codec
libvorbisidec1 - Integer-only Ogg Vorbis decoder, AKA "tremor"
libvpx6 - VP8 and VP9 video codec (shared library)
libvte-2.91-0 - Terminal emulator widget for GTK+ 3.0 - runtime files
libvte-2.91-common - Terminal emulator widget for GTK+ 3.0 - common files
libvterm0 - abstract terminal library
libvulkan1 - Vulkan loader library
libvulkan1:i386 - Vulkan loader library
libwacom-bin - Wacom model feature query library -- binaries
libwacom-common - Wacom model feature query library (common files)
libwacom2 - Wacom model feature query library
libwavpack1 - audio codec (lossy and lossless) - library
libwayland-client0 - wayland compositor infrastructure - client library
libwayland-client0:i386 - wayland compositor infrastructure - client library
libwayland-cursor0 - wayland compositor infrastructure - cursor library
libwayland-egl1 - wayland compositor infrastructure - EGL library
libwayland-server0 - wayland compositor infrastructure - server library
libwbclient0 - Samba winbind client library
libwebkit2gtk-4.0-37 - Web content engine library for GTK
libwebp6 - Lossy compression of digital photographic images.
libwebpdemux2 - Lossy compression of digital photographic images.
libwebpmux3 - Lossy compression of digital photographic images.
libwebrtc-audio-processing1 - AudioProcessing module from the WebRTC project.
libwhoopsie-preferences0 - Ubuntu error tracker submission settings - shared library
libwhoopsie0 - Ubuntu error tracker submission - shared library
libwind0-heimdal - Heimdal Kerberos - stringprep implementation
libwireshark-data - network packet dissection library -- data files
libwireshark13 - network packet dissection library -- shared library
libwiretap10 - network packet capture library -- shared library
libwmf0.2-7 - Windows metafile conversion library
libwmf0.2-7-gtk - Windows metafile conversion library
libwnck-3-0 - Window Navigator Construction Kit - runtime files
libwnck-3-common - Window Navigator Construction Kit - common files
libwoff1 - library for converting fonts to WOFF 2.0
libwpd-0.10-10 - Library for handling WordPerfect documents (shared library)
libwpg-0.3-3 - WordPerfect graphics import/convert library (shared library)
libwps-0.4-4 - Works text file format import filter library (shared library)
libwrap0 - Wietse Venema's TCP wrappers library
libwsutil11 - network packet dissection utilities library -- shared library
libx11-6 - X11 client-side library
libx11-6:i386 - X11 client-side library
libx11-xcb1 - Xlib/XCB interface library
libx11-xcb1:i386 - Xlib/XCB interface library
libx264-155 - x264 video coding library
libx265-179 - H.265/HEVC video stream encoder (shared library)
libxapian30 - Search engine library
libxatracker2 - X acceleration library -- runtime
libxau6 - X11 authorisation library
libxau6:i386 - X11 authorisation library
libxaw7 - X11 Athena Widget library
libxcb-composite0 - X C Binding, composite extension
libxcb-damage0 - X C Binding, damage extension
libxcb-dri2-0 - X C Binding, dri2 extension
libxcb-dri2-0:i386 - X C Binding, dri2 extension
libxcb-dri3-0 - X C Binding, dri3 extension
libxcb-dri3-0:i386 - X C Binding, dri3 extension
libxcb-glx0 - X C Binding, glx extension
libxcb-glx0:i386 - X C Binding, glx extension
libxcb-icccm4 - utility libraries for X C Binding -- icccm
libxcb-keysyms1 - utility libraries for X C Binding -- keysyms
libxcb-present0 - X C Binding, present extension
libxcb-present0:i386 - X C Binding, present extension
libxcb-randr0 - X C Binding, randr extension
libxcb-randr0:i386 - X C Binding, randr extension
libxcb-render-util0 - utility libraries for X C Binding -- render-util
libxcb-render0 - X C Binding, render extension
libxcb-res0 - X C Binding, res extension
libxcb-shape0 - X C Binding, shape extension
libxcb-shm0 - X C Binding, shm extension
libxcb-sync1 - X C Binding, sync extension
libxcb-sync1:i386 - X C Binding, sync extension
libxcb-util1 - utility libraries for X C Binding -- atom, aux and event
libxcb-xfixes0 - X C Binding, xfixes extension
libxcb-xfixes0:i386 - X C Binding, xfixes extension
libxcb-xinerama0 - X C Binding, xinerama extension
libxcb-xinput0 - X C Binding, xinput extension
libxcb-xkb1 - X C Binding, XKEYBOARD extension
libxcb-xv0 - X C Binding, xv extension
libxcb1 - X C Binding
libxcb1:i386 - X C Binding
libxcomposite1 - X11 Composite extension library
libxcursor1 - X cursor management library
libxdamage1 - X11 damaged region extension library
libxdamage1:i386 - X11 damaged region extension library
libxdmcp6 - X11 Display Manager Control Protocol library
libxdmcp6:i386 - X11 Display Manager Control Protocol library
libxext6 - X11 miscellaneous extension library
libxext6:i386 - X11 miscellaneous extension library
libxfixes3 - X11 miscellaneous 'fixes' extension library
libxfixes3:i386 - X11 miscellaneous 'fixes' extension library
libxfont2 - X11 font rasterisation library
libxft2 - FreeType-based font drawing library for X
libxi6 - X11 Input extension library
libxinerama1 - X11 Xinerama extension library
libxinerama1:i386 - X11 Xinerama extension library
libxkbcommon-x11-0 - library to create keymaps with the XKB X11 protocol
libxkbcommon0 - library interface to the XKB compiler - shared library
libxkbfile1 - X11 keyboard file manipulation library
libxklavier16 - X Keyboard Extension high-level API
libxml2 - GNOME XML library
libxmlb1 - Binary XML library
libxmlsec1 - XML security library
libxmlsec1-nss - Nss engine for the XML security library
libxmu6 - X11 miscellaneous utility library
libxmuu1 - X11 miscellaneous micro-utility library
libxpm4 - X11 pixmap library
libxrandr2 - X11 RandR extension library
libxrender1 - X Rendering Extension client library
libxres1 - X11 Resource extension library
libxshmfence1 - X shared memory fences - shared library
libxshmfence1:i386 - X shared memory fences - shared library
libxslt1.1 - XSLT 1.0 processing library - runtime library
libxss1 - X11 Screen Saver extension library
libxss1:i386 - X11 Screen Saver extension library
libxt6 - X11 toolkit intrinsics library
libxtables12 - netfilter xtables library
libxtst6 - X11 Testing -- Record extension library
libxv1 - X11 Video extension library
libxvidcore4 - Open source MPEG-4 video codec (library)
libxvmc1 - X11 Video extension library
libxxf86dga1 - X11 Direct Graphics Access extension library
libxxf86vm1 - X11 XFree86 video mode extension library
libxxf86vm1:i386 - X11 XFree86 video mode extension library
libyajl2 - Yet Another JSON Library
libyaml-0-2 - Fast YAML 1.1 parser and emitter library
libyelp0 - Library for the GNOME help browser
libzip5 - library for reading, creating, and modifying zip archives (runtime)
libzmq5 - lightweight messaging kernel (shared library)
libzstd1 - fast lossless compression algorithm
libzstd1:i386 - fast lossless compression algorithm
libzvbi0 - Vertical Blanking Interval decoder (VBI) - runtime files
ocales - GNU C Library: National Language (locale) data [support]
mesa-va-drivers - Mesa VA-API video acceleration drivers
mesa-vdpau-drivers - Mesa VDPAU video acceleration drivers
mesa-vulkan-drivers - Mesa Vulkan graphics drivers
mesa-vulkan-drivers:i386 - Mesa Vulkan graphics drivers
ocl-icd-libopencl1 - Generic OpenCL ICD Loader
packagekit-tools - Provides PackageKit command-line tools
perl-modules-5.30 - Core Perl modules
plasma-framework - Plasma Runtime components
qml-module-org-kde-bluezqt - QML wrapper for bluez
qml-module-org-kde-kconfig - provides integration of QML and KDE Frameworks - kconfig
qml-module-org-kde-kquickcontrols - provides integration of QML and KDE frameworks - kquickcontrols
qml-module-org-kde-kquickcontrolsaddons - provides integration of QML and KDE Frameworks - kquickcontrolsaddons
qml-module-org-kde-newstuff - Support for downloading application assets from the network.
qml-module-org-kde-people - framework providing unified access to contacts aggregated by person
qml-module-org-kde-purpose - abstraction to provide and leverage actions of a specific kind, qml bindings
qml-module-qtgraphicaleffects - Qt 5 Graphical Effects module
qml-module-qtqml-models2 - Qt 5 Models2 QML module
qml-module-qtquick-controls - Qt 5 Quick Controls QML module
qml-module-qtquick-controls2 - Qt 5 Qt Quick Controls 2 QML module
qml-module-qtquick-dialogs - Qt 5 Dialogs QML module
qml-module-qtquick-privatewidgets - Qt 5 Private Widgets QML module
qml-module-qtquick-templates2 - Qt 5 Qt Quick Templates 2 QML module
qml-module-qtquick-window2 - Qt 5 window 2 QML module
qml-module-qtquick2 - Qt 5 Qt Quick 2 QML module
qml-module-ubuntu-onlineaccounts - Expose the Online Accounts API to QML applications
qt5-gtk-platformtheme - Qt 5 GTK+ 3 platform theme
qtspeech5-flite-plugin - Speech library for Qt - Flite plugin
qtwayland5 - QtWayland platform plugin
samba-libs - Samba core libraries
signon-plugin-oauth2 - Single Signon oauth2 plugin
tzdata - time zone and daylight-saving time data
uno-libs-private - LibreOffice UNO runtime environment -- private libraries used by public ones
ure - LibreOffice UNO runtime environment
uid-runtime - runtime components for the Universally Unique ID library
zlib1g - compression library - runtime
zlib1g:i386 - compression library - runtime
