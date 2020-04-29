cd c_files
for file = dir('*.c')'; eval(['mex ' file.name]) ; end
if ispc, movefile '*.mexw64' '../mex_files/'; end
if isunix, movefile '*.mexa64' '../mex_files/'; end
cd ..