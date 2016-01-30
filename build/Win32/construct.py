import sys
import os

from genconst import constructMakefile

""" This file makes the Makefile for the 'Win32' platform """ 
""" This file imports ../genconst.py for most of its functionality """
""" To use this file as a main script, you cannot do relative imports and
therefore must have ../genconst in your PYTHONPATH """
""" Since the author was lazy I just made a soft link in this directoy to
../genconst.py """

if __name__ == '__main__':
    if '/' in __file__:
        os.chdir(os.path.dirname(__file__))

    makefile = open('Makefile.make', 'w')
    target = '/bin/Ultra-Fighters32.exe'
    res_dest = '/bin/Win32/Resources'
    c_flags = '-m32'
    link_flags = '../../lib/Win32/glew32s.lib ../../lib/Win32/glew32.lib ../../lib/Win32/libglfw3.a -lopengl32 -lglu32 -lgdi32 -m32 -static'
    copy_cmd = 'robocopy $(RES_SOURCE) $(RES_DEST) /MIR > nul'
    clean_cmd = 'DEL $(OBJECTS) /Q'

    constructMakefile(makefile, target, res_dest, c_flags, link_flags, copy_cmd, clean_cmd, exclude=[])
