Avira AntiVir Command Line Scanner
*******************

Copyright © 2010 Avira GmbH. 
All rights reserved.

Content
*******
1. Content of the Package
2. Necessary Update Files 
3. Licensing  
4. Command Line Mode   
5. Contact Address



1. Content of the Package 
*************************

The archive contains the command line scanner, the license agreement and this readme:

scancl binary for the respective platform
eula.txt
readme.txt
scancl.conf - the configuration file example

You will find here a unicode version command line scanner for the operating system 
specified in the archive name (Windows or Linux glibc 2.2. and above, both for the 32 bits versions).


2. Necessary Update Files
*************************

2.1 Windows

All necessary files are located in our update package fusebundle, which is available on our homepage:
http://www.avira.com/en/support/vdf_update_info.html

AntiVir unicode update package (Windows 2000, XP, XP 64Bit, Vista 32 Bit and Vista 64 Bit):
http://dl.antivir.de/down/vdf/ivdf_fusebundle_nt_en.zip

Please, download the file and unpack all contained files into the same directory as the command line scanner.

The following files are necessary:

vbaseX.vdf - AntiVir virus definition files
ae*.* - AntiVir Engine libraries

2.2 Linux

Scancl is meant to be a tool for the admins using our existing server products. This is why it has no package, 
no updating mechanisms, no key and no installation directory of its own. Please, unpack the present archive 
into an existing product folder. The command line scanner will use the product engine  and signatures, the updating
mechanisms and  license key automatically.

The following files are necessary:

vbaseX.vdf - AntiVir virus definition files
ae*.* - AntiVir Engine libraries

3. Licensing
************

Furthermore you need a digital license file in order to run the command line scanner as a full version.
The license file must have *.key or *.KEY extensions. Files with other extensions are not recognized as valid licenses.
The usual license files will be supported (AntiVir Workstation, Premium, Premium Security Suite). 
The command line scanner will not work as a full version with the free classic license. 


4. Command Line Mode
********************

Please, use the integrated help in order to find the parameters and return codes:
scancl --help


5. Contact Address
******************

Avira GmbH
Lindauer Str. 21
D-88069 Tettnang

Phone: +49 (0) 7542 - 500 0
Fax: +49 (0) 7542 - 525 10

Internet: http://www.avira.com
Email:    info@avira.com
