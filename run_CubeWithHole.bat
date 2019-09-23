
:: This batch file checks input _tri.raw,
@echo on
:: OUTPUT
@echo Run segmentation
Segmentation.exe -i .\example\cube_with_hole\cube_with_hole -o .\example\cube_with_hole\cube_with_hole_initial_write
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Create polycube structure
PolyCube.exe -i .\example\cube_with_hole\cube_with_hole -I 10000 -s 0.01 -n .\example\cube_with_hole\cube_with_hole_initial_read  -o .\example\cube_with_hole\cube_with_hole_polycube_structure -c .\example\cube_with_hole\cube_with_hole_Output_CornerPoints.txt
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Generate hex mesh
GenHex.exe -i .\example\cube_with_hole\cube_with_hole -P .\example\cube_with_hole\cube_with_hole_paraHex_hex -n .\example\cube_with_hole\cube_with_hole_initial_read -c .\example\cube_with_hole\cube_with_hole_corner_point.txt  -s 2 -o .\example\cube_with_hole\cube_with_hole 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Fix interior points
.\Hex2Spline.exe -I .\example\cube_with_hole\cube_with_hole_OctreePhys_hex.vtk -Q -m 0 -n 7 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Cube with hole model with no local refinement
.\Hex2Spline.exe -I .\example\cube_with_hole\cube_with_hole_OctreePhys_hex_lap.vtk -S -s 1 --stol 0.7 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Cube with hole model with level-1 local refinement
.\Hex2Spline.exe -I .\example\cube_with_hole\cube_with_hole_OctreePhys_hex_lap.vtk -S -s 1 --stol 0.7 -l 1
@echo Done!
@echo -------------------------------------------------------------------
@pause


 
