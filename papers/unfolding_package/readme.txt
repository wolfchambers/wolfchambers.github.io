This package requires Mathematica 9.  Also, before installing, ensure that a C#/.NET environment be available.  This is automatic on Windows installations, but you will have to download a .NET development package such as Mono on a Mac.

To configure Mono on a mac:
1. Download and install Mono Runtime Environment v3 or higher
2. Then, with Mathematica and Mono not running, you must link Mathematica and mono by typing:
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Applications/Mathematica.app/Contents/Frameworks/mathlink.framework
in the terminal.

Installing the package:
Once the PolyLink.zip file is downloaded, extract the zip file in your Mathematica $UserBaseDirectory.  (This can be found by executing $UserBaseDirectory in Mathematica, but is generally under Library/Mathematica in your home directory.)  This will create a PolyLink folder in $UserBaseDirectory.

From here, simply go to File->Install, and select the following:
Type of item: Package
Source: from file (and navigate to unzipped source folder)
