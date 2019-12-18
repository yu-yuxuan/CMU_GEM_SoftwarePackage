
:: This batch file checks input _tri.raw,
@echo on
:: OUTPUT
@echo Run segmentation
Segmentation.exe -i .\example\rod_quality\rod -o .\example\rod_quality\rod_initial_write
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Create polycube structure
PolyCube.exe -i .\example\rod_quality\rod -I 10000 -s 0.01 -n .\example\rod_quality\rod_initial_read  -o .\example\rod_quality\rod_polycube_structure -c .\example\rod_quality\rod_Output_CornerPoints.txt
@echo Done!
@echo -------------------------------------------------------------------
@pause
:: OUTPUT
@echo Generate hex mesh
GenHex.exe -i .\example\rod_quality\rod -P .\example\rod_quality\rod_paraHex_hex -n .\example\rod_quality\rod_initial_read -c .\example\rod_quality\rod_Output_CornerPoints.txt  -s 2 -o .\example\rod_quality\rod 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Fix interior points 
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex.vtk -Q -m 0 -n 20 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Pillowing
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap.vtk -Q --method 1 --number 1
@echo Done!
@echo If needed, prepare sharp feature in sharp.txt before moving to next step
@echo -------------------------------------------------------------------
@pause

@echo Smooth surface points
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow.vtk -Q --method 2 --parameter 0.001 --number 50 --sharp 2 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Optimize element with minimum Jacobian
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow_smooth.vtk -Q --method 3 --parameter 0.001 --number 15
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Rod model with no local refinement
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow_smooth_opt.vtk -S -s 2 
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Rod model with level-1 local refinement
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow_smooth_opt.vtk -S -s 2 -l 1
@echo Done!
@echo -------------------------------------------------------------------
@pause

@echo Spline construction of Rod model with level-2 local refinement
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow_smooth_opt.vtk -S -s 2 -l 2
@echo Done!
@echo -------------------------------------------------------------------
@pause
 
@echo Spline construction of Rod model with level-1 global refinement
.\Hex2Spline.exe -I .\example\rod_quality\rod_OctreePhys_hex_lap_pillow_smooth_opt.vtk -S -s 2 -g 1
@echo Done!
@echo -------------------------------------------------------------------
@pause