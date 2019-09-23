
:: This batch file checks input _tri.raw,
@echo on
:: OUTPUT
:: OUTPUT
@echo Run segmentation
Segmentation.exe -i .\example\rod_demo\rod -o .\example\rod_demo\rod_initial_write
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Create polycube structure
PolyCube.exe -i .\example\rod_demo\rod -I 10000 -s 0.01 -n .\example\rod_demo\rod_initial_read  -o .\example\rod_demo\rod_polycube_structure -c .\example\rod_demo\rod_Output_CornerPoints.txt
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Generate hex mesh
GenHex.exe -i .\example\rod_demo\rod -P .\example\rod_demo\rod_paraHex_hex -n .\example\rod_demo\rod_initial_read -c .\example\rod_demo\rod_Output_CornerPoints.txt  -s 2 -o .\example\rod_demo\rod 
@echo Done!
@echo -------------------------------------------------------------------
@pause
@echo Fix interior points 
.\Hex2Spline.exe -I .\example\rod_demo\rod_OctreePhys_hex.vtk -Q -m 0 -n 20 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Rod model with no local refinement
.\Hex2Spline.exe -I .\example\rod_demo\rod_OctreePhys_hex_lap.vtk -S -s 2 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Rod model with level-1 local refinement
.\Hex2Spline.exe -I .\example\rod_demo\rod_OctreePhys_hex_lap.vtk -S -s 2 -l 1
@echo Done!
@echo -------------------------------------------------------------------
@pause

 
