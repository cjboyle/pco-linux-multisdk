-------------------------------------------------------------------
                 P C O  AG
     TECHNICAL  INFORMATION  DOCUMENT
-------------------------------------------------------------------

README FOR SOFTWARE:  
pco_usb_pl

FOR PCO PRODUCT:
pco.edge, pco.pixelfly or pco.camera with usb interface

DESCRIPTION:
This package includes a communication and a grabber class and
simple testprograms, which show the use of the class functions.
Functionality is also shown with the QT-GUI program. 
Library libusb (version > 1.0.19) is used to handle data through usb-port(s).

This version does not use any other PCO-libraries.
All sources are from the x64 usb project, see readme_x64.txt for further information.
Some additional files are included in this package (see description below) and
the makefiles have been changed accordingly.  


VERSION 1
SUBVERSION 1
SUBAGE 19


CONTENTS:

Archive File Name: PCO_usb_pl_1_01_xx.tar.gz

Installation Instructions:

Copy the pco_usb_pl_1_01_xx.tar.gz to a distinct directory (e.g. PCO).
Use "tar -xpvzf pco_usb_pl_1_01_xx.tar.gz" to get the sources.
After this you will find the following new directories and files as noted below.

To compile the example files change to directory pco_camera/pco_usb_pl and type "make"

To build the the QT- program use either script make_pco_qt or the QT-IDE-Application.
Load the project file qt_pco_camera_usb.pro from pco_camera/pco_common/qt_pco_camera and use the Qt-Build command.
Qt Version 5.5.0 and QT-Creator 3.4.2 have been used for this project.

In all programs no logging is enabled by default.
Commandline parameter -l can be used to enable logging and to set the loglevel.

To use the dynamic libraries script 'symlink_pco' can be used to create symbolic links to the 
pco libraries in libdyn. 
'symlink_pco -b' will create the links in directory ./libdyn
'symlink_pco -u' will create the links in directory /usr/local/lib (write permissions needed)
'symlink_pco "path"' will create the links in user selected directory "path"
To update the linker cache '/sbin/ldconfig' should be used afterwards 


./pco_camera/pco_usb_pl/Makefile
Makefile to compile pco_usb libraries and testprograms.
Does also call 'symlink_pco -b'

./pco_camera/pco_usb_pl/pco_usb.rules 
udev rules to allow user access to all pco_usb cameras
Must be copied to etc/udev/rules.d or appropriate directory in current distribution

./pco_camera/pco_usb_pl/pco_classes
Source code Cpcolog.cpp for Class CPCO_log. Only a dummy class. Code has to be added to achieve functionality 
Source code files12.cpp for writing image files. Has to be treated as example only and might need
 some changes in the source to achieve functionality.
Makefile for creating libraries (libpcocam_usb, libpcocom_usb) in ./lib and ./libdyn.

./pco_camera/pco_usb/pco_ser_con
Source files and makefile for creating console testprogram
 for testing the camera communication

./pco_camera/pco_usb/pco_camera_grab
Source files and makefile for creating console testprogram
 for grabbing images from a pco.camera 

./pco_camera/pco_usb/listdev
Source files and makefile for creating console testprogram
 to list all connected pco usb devices

./pco_camera/pco_usb/qt_pco_camera_me4
Specific source files and project file for creating Qt based application

./pco_camera/PCO_usb/bin
executable binaries linked to static libraries

./pco_camera/PCO_usb/bindyn
executable binaries linked to dynamic libraries

SYSTEM_VERSION:
This package was sucessfully tested on
 Ubuntu kernel-release 4.0.0
 Debian kernel-release 4.0.0
 Debian kernel-release 3.19.5
 Debian kernel-release 3.2.0-4-amd64 kernel-version SMP Debian 3.2.65


VERSION HISTORY:

ver01_01_19
set version to pco_usb version used for this build
next version with changes from pco_usb see readme_pco_usb_version
Cpcolog.cpp: use defines to write either to file or to stdout or do nothing


ver01_01_01
initial project


KNOWN BUGS:

-------------------------------------------------------------------
 PCO AG
 DONAUPARK 11
 93309 KELHEIM / GERMANY
 PHONE +49 (9441) 20050
 FAX   +49 (9441) 200520
 info@pco.de, support@pco.de
 http://www.pco.de
-------------------------------------------------------------------
 DISCLAIMER
 THE ORIGIN OF THIS INFORMATION MAY BE INTERNAL OR EXTERNAL TO PCO.
 PCO MAKES EVERY EFFORT WITHIN ITS MEANS TO VERIFY THIS INFORMATION.
 HOWEVER, THE INFORMATION PROVIDED IN THIS DOCUMENT IS FOR YOUR
 INFORMATION ONLY. PCO MAKES NO EXPLICIT OR IMPLIED CLAIMS TO THE
 VALIDITY OF THIS INFORMATION.
-------------------------------------------------------------------
 Any trademarks referenced in this document are the property of
 their respective owners.
-------------------------------------------------------------------
