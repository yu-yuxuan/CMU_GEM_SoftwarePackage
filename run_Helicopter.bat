
:: This batch file checks input _tri.raw,
@echo on
:: OUTPUT
@echo Run segmentation
Segmentation.exe -i .\example\helicopter\heli -o .\example\helicopter\heli_initial_write
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Create polycube structure
PolyCube.exe -i .\example\helicopter\heli -I 10000 -s 0.01 -n .\example\helicopter\heli_initial_read  -o .\example\helicopter\heli_polycube_structure -c .\example\helicopter\heli_Output_CornerPoints.txt
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Generate hex mesh
GenHex.exe -i .\example\helicopter\heli -P .\example\helicopter\heli_paraHex_hex -n .\example\helicopter\heli_initial_read -f 1 -p .\example\helicopter\heli_indexPatch_read  -c .\example\helicopter\heli_corner_point.txt  -s 0 -o .\example\helicopter\heli 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Helicopter model with no refinement
.\Hex2Spline.exe -I .\example\helicopter\heli_OctreePhys_hex.vtk -S -s 2 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Helicopter model with level-1 global refinement
.\Hex2Spline.exe -I .\example\helicopter\heli_OctreePhys_hex.vtk -S -s 2 -g 1
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Helicopter model with level-1 local refinement
.\Hex2Spline.exe -I .\example\helicopter\heli_OctreePhys_hex.vtk -S -s 2 -l 1
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Helicopter model with level-2 local refinement
.\Hex2Spline.exe -I .\example\helicopter\heli_OctreePhys_hex.vtk -S -s 2 -l 2
@echo Done!
@echo -------------------------------------------------------------------
@pause

 
