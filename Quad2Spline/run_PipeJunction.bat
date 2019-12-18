
:: This batch file checks input _tri.raw,
@echo off
:: OUTPUT
@echo Spline construction of Pipe junction model with no local refinement
.\Quad2Spline.exe -i .\example\pipe_junction_global0\pj_input.vtk
@echo Done!
@echo -------------------------------------------------------------------
pause

@echo Spline construction of Pipe junction model with level-1 local refinement
.\Quad2Spline.exe -i .\example\pipe_junction_global0\pj_input.vtk -l 1
@echo Done!
@echo -------------------------------------------------------------------
pause

@echo Spline construction of Pipe junction model with level-2 local refinement
.\Quad2Spline.exe -i .\example\pipe_junction_global0\pj_input.vtk -l 2
@echo Done!
@echo -------------------------------------------------------------------
pause

@echo Spline construction of Pipe junction model with level-1 global refinement
.\Quad2Spline.exe -i .\example\pipe_junction_global1\pj_input.vtk -g 1
@echo Done!
@echo -------------------------------------------------------------------
 
pause
 
@echo Spline construction of Pipe junction model with level-1 global refinement and level-1 local refinement
.\Quad2Spline.exe -i .\example\pipe_junction_global1\pj_input.vtk -g 1 -l 1
@echo Done!
@echo -------------------------------------------------------------------


 
