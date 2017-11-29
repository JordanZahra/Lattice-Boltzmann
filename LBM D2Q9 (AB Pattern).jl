####################################################################################################
####################################################################################################
####################################################################################################

# 2D Lattice Boltzmann (BGK) Model
# D2Q9 Quadrature

####################################################################################################
####################################################################################################
####################################################################################################

# IS THIS A CONTINUATION OF AN EXISTING RUN ??? INPUT THE DATA TO READ
Restart_Calculation = "No" # Input as "Yes" or "No". If "Yes" no changes are required to the input parameters, these will be ignored. If "No", the following input parameters are required
Printer_Current_Timestep = 0
Printer_Nx = 902 # Added 2 for the boundary nodes
Printer_Ny = 302 # Added 2 for the boundary nodes
Printer_Re = 150.0
Title = "VKV Cylinder"

# INPUT PARAMETERS {NEEDS TO BE CONGRUENT WITH EXISTING RUN IF A CALCULATION IS RESTARTED}
Nx = 600 # Number of cells in the x-direction in units of 100
Ny = 200 # Number of cells in the y-direction in units of 100
Re = 220.0 # Reynolds Number of the flow
Ma = 0.1 # Mach Number of the flow
Rho_Initial = 1 # Macroscopic density
Maximum_Iterations = 100000 # Total number of iterations (TIME STEP)
Cycle_Plot = 2000 # Cycle evaluated for plotting at this increment of cycles
Force_Plot = 10 # Force evaluated for plotting at this increment of cycles
Force_Plot_Crop = 20000 # This integer to the maximum iterations is what will be accounted for during post-processing (prior to this is spooling up time)
VorticityCrop = 0.01 # Crops the vorticity values above and below this value for better visiaulisation
StreamfunctionCrop = Inf #1 # Crops the streamfunction values above and below this value for better visiaulisation
ArrowScaleFactor = 10 # Scaling factor for quiver plot arrows
Boundary_Walls = 0 # Set to 0 for no walls or set to 1 for walls at the upper and lower surface
Square_Cylinder = 0 # Set to 0 for circular cylinder or set to 1 for square cylinder

# ADDITIONAL REQUIREMENTS {REQUIRED FOR NEW OR EXISTING RUNS BUT DO NOT NEED TO BE CONGRUENT WITH EXISITING RUNS (FOR EXAMPLE A DIFFERENT COLLISION MODEL MAY BE USED)}
Autosave_Data_Maximum_Iterations = "No" # Set to "Yes" or "No" to save the data at the end of the run
Autosave_Data_Incrementally = "No" # Set to "Yes" or "No" to save data at the following increments
Autosave_Increment = 100000
Ramp_Up_Test = "No" # Set to "Yes" or "No" to ramp up the Reynolds number with time
Ramp_Up_Initial = 100000
Ramp_Up_Increment = 0.0
Collision_Model = "CMRT_LBM" # Valid inputs are "SRT_LBM", "TRT_LBM", "MRT_LBM", "CMRT_LBM", "Cumulant_LBM", "RLBM". Ensure the following relaxation times are adjusted accordingly as these may be changed upon starting a new run or using an existing run (Note this only applies for models using more than one relaxation time)
# TRT LBM input variable
TRT_Magic_Number = 1/4 # Set to 1/4 for best stability and solution for the steady-state case dependant only on the equilibrium function, 1/12 for no third order error (best advection), 1/6 for no fourth order error (best diffusion), or 3/16 for exact location of bounce-back walls for the Poiseuille flow
# MRT LBM input variables
MRT_Omega2 = 1.0 # [BULK VISCOSITY][e term] Should be 1.1 or 1.2 or 1.4 or 1.64 depending on literature followed
MRT_Omega3 = 1.0 # [Epsilon term] should be 1.0 or 1.2 or 1.4 or 1.54 depending on literature followed
MRT_Omega4 = 1.0 # [qx and qy term] Should be 1.2 depending on literature followed
# Cascaded MRT LBM input variables
CMRT_Omega2 = 1.0 # [BULK VISCOSITY] Adjust between approximately 0.2 to 1.8 to improve numerical stability
CMRT_Omega3 = 1.0 # Adjust between approximately 0.2 to 1.8 to improve numerical stability
CMRT_Omega4 = 1.0 # Adjust between approximately 0.2 to 1.8 to improve numerical stability
# Cumulant LBM input variables
Cumulant_Omega2 = 1.0 # [BULK VISCOSITY] Adjust between approximately 0.2 to 1.8 to improve numerical stability
Cumulant_Omega3 = 1.0 # Adjust between approximately 0.2 to 1.8 to improve numerical stability
Cumulant_Omega4 = 1.0 # Adjust between approximately 0.2 to 1.8 to improve numerical stability
Second_Order_Velocity_Derivatives = 0 # Set to 1 to include second order velocity derivatives or 0 to exclude. Note that when the viscosity is small (Omega approaches 2), these derivatives are large and are therefore likely to cause instability, hence only use for highly accurate low velocity calculations

# Note: for stability the following must occur:
  # Inflow velocity less than 0.1
  # Kinematic viscosity (Nu) less than 0.2
  # Relaxation parameter (Omega) less than 2

#
#
#
#
#
#
#
#
#
#

# IMPORT AND MANIPULATION
Previous_Current_Timestep = 0
Previous_Cycle_Plot = 0
if Restart_Calculation == "Yes"
  Import_Data_1 = readstring("LBM D2Q9 $Title - #1 INPUT PARAMETERS - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part1 = readstring("LBM D2Q9 $Title - #2.1 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part2 = readstring("LBM D2Q9 $Title - #2.2 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part3 = readstring("LBM D2Q9 $Title - #2.3 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part4 = readstring("LBM D2Q9 $Title - #2.4 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part5 = readstring("LBM D2Q9 $Title - #2.5 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part6 = readstring("LBM D2Q9 $Title - #2.6 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part7 = readstring("LBM D2Q9 $Title - #2.7 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part8 = readstring("LBM D2Q9 $Title - #2.8 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_2part9 = readstring("LBM D2Q9 $Title - #2.9 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part1 = readstring("LBM D2Q9 $Title - #3.1 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part2 = readstring("LBM D2Q9 $Title - #3.2 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part3 = readstring("LBM D2Q9 $Title - #3.3 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part4 = readstring("LBM D2Q9 $Title - #3.4 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part5 = readstring("LBM D2Q9 $Title - #3.5 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part6 = readstring("LBM D2Q9 $Title - #3.6 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part7 = readstring("LBM D2Q9 $Title - #3.7 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part8 = readstring("LBM D2Q9 $Title - #3.8 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_3part9 = readstring("LBM D2Q9 $Title - #3.9 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part1 = readstring("LBM D2Q9 $Title - #4.1 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part2 = readstring("LBM D2Q9 $Title - #4.2 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part3 = readstring("LBM D2Q9 $Title - #4.3 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part4 = readstring("LBM D2Q9 $Title - #4.4 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part5 = readstring("LBM D2Q9 $Title - #4.5 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part6 = readstring("LBM D2Q9 $Title - #4.6 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part7 = readstring("LBM D2Q9 $Title - #4.7 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part8 = readstring("LBM D2Q9 $Title - #4.8 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_4part9 = readstring("LBM D2Q9 $Title - #4.9 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_5 = readstring("LBM D2Q9 $Title - #5 Ux - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_6 = readstring("LBM D2Q9 $Title - #6 Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_7 = readstring("LBM D2Q9 $Title - #7 Rho - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_8 = readstring("LBM D2Q9 $Title - #8 X_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_9 = readstring("LBM D2Q9 $Title - #9 Y_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_10 = readstring("LBM D2Q9 $Title - #10 Ut_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_11 = readstring("LBM D2Q9 $Title - #11 Ux_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_12 = readstring("LBM D2Q9 $Title - #12 Uy_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_13 = readstring("LBM D2Q9 $Title - #13 Rho_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_14 = readstring("LBM D2Q9 $Title - #14 Vorticity - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_15 = readstring("LBM D2Q9 $Title - #15 Vorticity MOD - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_16 = readstring("LBM D2Q9 $Title - #16 DelUy_Delx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_17 = readstring("LBM D2Q9 $Title - #17 DelUx_Dely - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_18 = readstring("LBM D2Q9 $Title - #18 Streamfunction - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_19 = readstring("LBM D2Q9 $Title - #19 Streamfunction MOD - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_20 = readstring("LBM D2Q9 $Title - #20 IntUx_dy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_21 = readstring("LBM D2Q9 $Title - #21 IntUy_dx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_22 = readstring("LBM D2Q9 $Title - #22 C_IntUx_dy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_23 = readstring("LBM D2Q9 $Title - #23 C_IntUy_dx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_24 = readstring("LBM D2Q9 $Title - #24 Fx Cylinder - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_25 = readstring("LBM D2Q9 $Title - #25 Fy Cylinder - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_26 = readstring("LBM D2Q9 $Title - #26 Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")
  Import_Data_27 = readstring("LBM D2Q9 $Title - #27 Drag Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat")

  Import_Data_1 = Import_Data_1[1 + 2: end - 2]; Import_Data_1 = replace(Import_Data_1, " ", ","); Import_Data_1 = include_string(Import_Data_1); Import_Data_1 = collect(Import_Data_1); Import_Data_1 = Import_Data_1.';
  Import_Data_2part1 = Import_Data_2part1[1 + 2: end - 2]; Import_Data_2part1 = replace(Import_Data_2part1, " ", ","); Import_Data_2part1 = include_string(Import_Data_2part1); Import_Data_2part1 = collect(Import_Data_2part1); Import_Data_2part1 = Import_Data_2part1.'; Import_Data_2part1 = reshape(Import_Data_2part1, Printer_Nx, Printer_Ny)
  Import_Data_2part2 = Import_Data_2part2[1 + 2: end - 2]; Import_Data_2part2 = replace(Import_Data_2part2, " ", ","); Import_Data_2part2 = include_string(Import_Data_2part2); Import_Data_2part2 = collect(Import_Data_2part2); Import_Data_2part2 = Import_Data_2part2.'; Import_Data_2part2 = reshape(Import_Data_2part2, Printer_Nx, Printer_Ny)
  Import_Data_2part3 = Import_Data_2part3[1 + 2: end - 2]; Import_Data_2part3 = replace(Import_Data_2part3, " ", ","); Import_Data_2part3 = include_string(Import_Data_2part3); Import_Data_2part3 = collect(Import_Data_2part3); Import_Data_2part3 = Import_Data_2part3.'; Import_Data_2part3 = reshape(Import_Data_2part3, Printer_Nx, Printer_Ny)
  Import_Data_2part4 = Import_Data_2part4[1 + 2: end - 2]; Import_Data_2part4 = replace(Import_Data_2part4, " ", ","); Import_Data_2part4 = include_string(Import_Data_2part4); Import_Data_2part4 = collect(Import_Data_2part4); Import_Data_2part4 = Import_Data_2part4.'; Import_Data_2part4 = reshape(Import_Data_2part4, Printer_Nx, Printer_Ny)
  Import_Data_2part5 = Import_Data_2part5[1 + 2: end - 2]; Import_Data_2part5 = replace(Import_Data_2part5, " ", ","); Import_Data_2part5 = include_string(Import_Data_2part5); Import_Data_2part5 = collect(Import_Data_2part5); Import_Data_2part5 = Import_Data_2part5.'; Import_Data_2part5 = reshape(Import_Data_2part5, Printer_Nx, Printer_Ny)
  Import_Data_2part6 = Import_Data_2part6[1 + 2: end - 2]; Import_Data_2part6 = replace(Import_Data_2part6, " ", ","); Import_Data_2part6 = include_string(Import_Data_2part6); Import_Data_2part6 = collect(Import_Data_2part6); Import_Data_2part6 = Import_Data_2part6.'; Import_Data_2part6 = reshape(Import_Data_2part6, Printer_Nx, Printer_Ny)
  Import_Data_2part7 = Import_Data_2part7[1 + 2: end - 2]; Import_Data_2part7 = replace(Import_Data_2part7, " ", ","); Import_Data_2part7 = include_string(Import_Data_2part7); Import_Data_2part7 = collect(Import_Data_2part7); Import_Data_2part7 = Import_Data_2part7.'; Import_Data_2part7 = reshape(Import_Data_2part7, Printer_Nx, Printer_Ny)
  Import_Data_2part8 = Import_Data_2part8[1 + 2: end - 2]; Import_Data_2part8 = replace(Import_Data_2part8, " ", ","); Import_Data_2part8 = include_string(Import_Data_2part8); Import_Data_2part8 = collect(Import_Data_2part8); Import_Data_2part8 = Import_Data_2part8.'; Import_Data_2part8 = reshape(Import_Data_2part8, Printer_Nx, Printer_Ny)
  Import_Data_2part9 = Import_Data_2part9[1 + 2: end - 2]; Import_Data_2part9 = replace(Import_Data_2part9, " ", ","); Import_Data_2part9 = include_string(Import_Data_2part9); Import_Data_2part9 = collect(Import_Data_2part9); Import_Data_2part9 = Import_Data_2part9.'; Import_Data_2part9 = reshape(Import_Data_2part9, Printer_Nx, Printer_Ny)
  Import_Data_3part1 = Import_Data_3part1[1 + 2: end - 2]; Import_Data_3part1 = replace(Import_Data_3part1, " ", ","); Import_Data_3part1 = include_string(Import_Data_3part1); Import_Data_3part1 = collect(Import_Data_3part1); Import_Data_3part1 = Import_Data_3part1.'; Import_Data_3part1 = reshape(Import_Data_3part1, Printer_Nx, Printer_Ny)
  Import_Data_3part2 = Import_Data_3part2[1 + 2: end - 2]; Import_Data_3part2 = replace(Import_Data_3part2, " ", ","); Import_Data_3part2 = include_string(Import_Data_3part2); Import_Data_3part2 = collect(Import_Data_3part2); Import_Data_3part2 = Import_Data_3part2.'; Import_Data_3part2 = reshape(Import_Data_3part2, Printer_Nx, Printer_Ny)
  Import_Data_3part3 = Import_Data_3part3[1 + 2: end - 2]; Import_Data_3part3 = replace(Import_Data_3part3, " ", ","); Import_Data_3part3 = include_string(Import_Data_3part3); Import_Data_3part3 = collect(Import_Data_3part3); Import_Data_3part3 = Import_Data_3part3.'; Import_Data_3part3 = reshape(Import_Data_3part3, Printer_Nx, Printer_Ny)
  Import_Data_3part4 = Import_Data_3part4[1 + 2: end - 2]; Import_Data_3part4 = replace(Import_Data_3part4, " ", ","); Import_Data_3part4 = include_string(Import_Data_3part4); Import_Data_3part4 = collect(Import_Data_3part4); Import_Data_3part4 = Import_Data_3part4.'; Import_Data_3part4 = reshape(Import_Data_3part4, Printer_Nx, Printer_Ny)
  Import_Data_3part5 = Import_Data_3part5[1 + 2: end - 2]; Import_Data_3part5 = replace(Import_Data_3part5, " ", ","); Import_Data_3part5 = include_string(Import_Data_3part5); Import_Data_3part5 = collect(Import_Data_3part5); Import_Data_3part5 = Import_Data_3part5.'; Import_Data_3part5 = reshape(Import_Data_3part5, Printer_Nx, Printer_Ny)
  Import_Data_3part6 = Import_Data_3part6[1 + 2: end - 2]; Import_Data_3part6 = replace(Import_Data_3part6, " ", ","); Import_Data_3part6 = include_string(Import_Data_3part6); Import_Data_3part6 = collect(Import_Data_3part6); Import_Data_3part6 = Import_Data_3part6.'; Import_Data_3part6 = reshape(Import_Data_3part6, Printer_Nx, Printer_Ny)
  Import_Data_3part7 = Import_Data_3part7[1 + 2: end - 2]; Import_Data_3part7 = replace(Import_Data_3part7, " ", ","); Import_Data_3part7 = include_string(Import_Data_3part7); Import_Data_3part7 = collect(Import_Data_3part7); Import_Data_3part7 = Import_Data_3part7.'; Import_Data_3part7 = reshape(Import_Data_3part7, Printer_Nx, Printer_Ny)
  Import_Data_3part8 = Import_Data_3part8[1 + 2: end - 2]; Import_Data_3part8 = replace(Import_Data_3part8, " ", ","); Import_Data_3part8 = include_string(Import_Data_3part8); Import_Data_3part8 = collect(Import_Data_3part8); Import_Data_3part8 = Import_Data_3part8.'; Import_Data_3part8 = reshape(Import_Data_3part8, Printer_Nx, Printer_Ny)
  Import_Data_3part9 = Import_Data_3part9[1 + 2: end - 2]; Import_Data_3part9 = replace(Import_Data_3part9, " ", ","); Import_Data_3part9 = include_string(Import_Data_3part9); Import_Data_3part9 = collect(Import_Data_3part9); Import_Data_3part9 = Import_Data_3part9.'; Import_Data_3part9 = reshape(Import_Data_3part9, Printer_Nx, Printer_Ny)
  Import_Data_4part1 = Import_Data_4part1[1 + 2: end - 2]; Import_Data_4part1 = replace(Import_Data_4part1, " ", ","); Import_Data_4part1 = include_string(Import_Data_4part1); Import_Data_4part1 = collect(Import_Data_4part1); Import_Data_4part1 = Import_Data_4part1.'; Import_Data_4part1 = reshape(Import_Data_4part1, Printer_Nx, Printer_Ny)
  Import_Data_4part2 = Import_Data_4part2[1 + 2: end - 2]; Import_Data_4part2 = replace(Import_Data_4part2, " ", ","); Import_Data_4part2 = include_string(Import_Data_4part2); Import_Data_4part2 = collect(Import_Data_4part2); Import_Data_4part2 = Import_Data_4part2.'; Import_Data_4part2 = reshape(Import_Data_4part2, Printer_Nx, Printer_Ny)
  Import_Data_4part3 = Import_Data_4part3[1 + 2: end - 2]; Import_Data_4part3 = replace(Import_Data_4part3, " ", ","); Import_Data_4part3 = include_string(Import_Data_4part3); Import_Data_4part3 = collect(Import_Data_4part3); Import_Data_4part3 = Import_Data_4part3.'; Import_Data_4part3 = reshape(Import_Data_4part3, Printer_Nx, Printer_Ny)
  Import_Data_4part4 = Import_Data_4part4[1 + 2: end - 2]; Import_Data_4part4 = replace(Import_Data_4part4, " ", ","); Import_Data_4part4 = include_string(Import_Data_4part4); Import_Data_4part4 = collect(Import_Data_4part4); Import_Data_4part4 = Import_Data_4part4.'; Import_Data_4part4 = reshape(Import_Data_4part4, Printer_Nx, Printer_Ny)
  Import_Data_4part5 = Import_Data_4part5[1 + 2: end - 2]; Import_Data_4part5 = replace(Import_Data_4part5, " ", ","); Import_Data_4part5 = include_string(Import_Data_4part5); Import_Data_4part5 = collect(Import_Data_4part5); Import_Data_4part5 = Import_Data_4part5.'; Import_Data_4part5 = reshape(Import_Data_4part5, Printer_Nx, Printer_Ny)
  Import_Data_4part6 = Import_Data_4part6[1 + 2: end - 2]; Import_Data_4part6 = replace(Import_Data_4part6, " ", ","); Import_Data_4part6 = include_string(Import_Data_4part6); Import_Data_4part6 = collect(Import_Data_4part6); Import_Data_4part6 = Import_Data_4part6.'; Import_Data_4part6 = reshape(Import_Data_4part6, Printer_Nx, Printer_Ny)
  Import_Data_4part7 = Import_Data_4part7[1 + 2: end - 2]; Import_Data_4part7 = replace(Import_Data_4part7, " ", ","); Import_Data_4part7 = include_string(Import_Data_4part7); Import_Data_4part7 = collect(Import_Data_4part7); Import_Data_4part7 = Import_Data_4part7.'; Import_Data_4part7 = reshape(Import_Data_4part7, Printer_Nx, Printer_Ny)
  Import_Data_4part8 = Import_Data_4part8[1 + 2: end - 2]; Import_Data_4part8 = replace(Import_Data_4part8, " ", ","); Import_Data_4part8 = include_string(Import_Data_4part8); Import_Data_4part8 = collect(Import_Data_4part8); Import_Data_4part8 = Import_Data_4part8.'; Import_Data_4part8 = reshape(Import_Data_4part8, Printer_Nx, Printer_Ny)
  Import_Data_4part9 = Import_Data_4part9[1 + 2: end - 2]; Import_Data_4part9 = replace(Import_Data_4part9, " ", ","); Import_Data_4part9 = include_string(Import_Data_4part9); Import_Data_4part9 = collect(Import_Data_4part9); Import_Data_4part9 = Import_Data_4part9.'; Import_Data_4part9 = reshape(Import_Data_4part9, Printer_Nx, Printer_Ny)
  Import_Data_5 = Import_Data_5[1 + 2: end - 2]; Import_Data_5 = replace(Import_Data_5, " ", ","); Import_Data_5 = include_string(Import_Data_5); Import_Data_5 = collect(Import_Data_5); Import_Data_5 = Import_Data_5.'; Import_Data_5 = reshape(Import_Data_5, Printer_Nx, Printer_Ny)
  Import_Data_6 = Import_Data_6[1 + 2: end - 2]; Import_Data_6 = replace(Import_Data_6, " ", ","); Import_Data_6 = include_string(Import_Data_6); Import_Data_6 = collect(Import_Data_6); Import_Data_6 = Import_Data_6.'; Import_Data_6 = reshape(Import_Data_6, Printer_Nx, Printer_Ny)
  Import_Data_7 = Import_Data_7[1 + 2: end - 2]; Import_Data_7 = replace(Import_Data_7, " ", ","); Import_Data_7 = include_string(Import_Data_7); Import_Data_7 = collect(Import_Data_7); Import_Data_7 = Import_Data_7.'; Import_Data_7 = reshape(Import_Data_7, Printer_Nx, Printer_Ny)
  Import_Data_8 = Import_Data_8[1 + 2: end - 2]; Import_Data_8 = replace(Import_Data_8, " ", ","); Import_Data_8 = include_string(Import_Data_8); Import_Data_8 = collect(Import_Data_8); Import_Data_8 = Import_Data_8.'; Import_Data_8 = reshape(Import_Data_8, Printer_Nx, Printer_Ny)
  Import_Data_9 = Import_Data_9[1 + 2: end - 2]; Import_Data_9 = replace(Import_Data_9, " ", ","); Import_Data_9 = include_string(Import_Data_9); Import_Data_9 = collect(Import_Data_9); Import_Data_9 = Import_Data_9.'; Import_Data_9 = reshape(Import_Data_9, Printer_Nx, Printer_Ny)
  Import_Data_10 = Import_Data_10[1 + 2: end - 2]; Import_Data_10 = replace(Import_Data_10, " ", ","); Import_Data_10 = include_string(Import_Data_10); Import_Data_10 = collect(Import_Data_10); Import_Data_10 = Import_Data_10.'; Import_Data_10 = reshape(Import_Data_10, Printer_Nx, Printer_Ny)
  Import_Data_11 = Import_Data_11[1 + 2: end - 2]; Import_Data_11 = replace(Import_Data_11, " ", ","); Import_Data_11 = include_string(Import_Data_11); Import_Data_11 = collect(Import_Data_11); Import_Data_11 = Import_Data_11.'; Import_Data_11 = reshape(Import_Data_11, Printer_Nx, Printer_Ny)
  Import_Data_12 = Import_Data_12[1 + 2: end - 2]; Import_Data_12 = replace(Import_Data_12, " ", ","); Import_Data_12 = include_string(Import_Data_12); Import_Data_12 = collect(Import_Data_12); Import_Data_12 = Import_Data_12.'; Import_Data_12 = reshape(Import_Data_12, Printer_Nx, Printer_Ny)
  Import_Data_13 = Import_Data_13[1 + 2: end - 2]; Import_Data_13 = replace(Import_Data_13, " ", ","); Import_Data_13 = include_string(Import_Data_13); Import_Data_13 = collect(Import_Data_13); Import_Data_13 = Import_Data_13.'; Import_Data_13 = reshape(Import_Data_13, Printer_Nx, Printer_Ny)
  Import_Data_14 = Import_Data_14[1 + 2: end - 2]; Import_Data_14 = replace(Import_Data_14, " ", ","); Import_Data_14 = include_string(Import_Data_14); Import_Data_14 = collect(Import_Data_14); Import_Data_14 = Import_Data_14.'; Import_Data_14 = reshape(Import_Data_14, Printer_Nx, Printer_Ny)
  Import_Data_15 = Import_Data_15[1 + 2: end - 2]; Import_Data_15 = replace(Import_Data_15, " ", ","); Import_Data_15 = include_string(Import_Data_15); Import_Data_15 = collect(Import_Data_15); Import_Data_15 = Import_Data_15.'; Import_Data_15 = reshape(Import_Data_15, Printer_Nx, Printer_Ny)
  Import_Data_16 = Import_Data_16[1 + 2: end - 2]; Import_Data_16 = replace(Import_Data_16, " ", ","); Import_Data_16 = include_string(Import_Data_16); Import_Data_16 = collect(Import_Data_16); Import_Data_16 = Import_Data_16.'; Import_Data_16 = reshape(Import_Data_16, Printer_Nx, Printer_Ny)
  Import_Data_17 = Import_Data_17[1 + 2: end - 2]; Import_Data_17 = replace(Import_Data_17, " ", ","); Import_Data_17 = include_string(Import_Data_17); Import_Data_17 = collect(Import_Data_17); Import_Data_17 = Import_Data_17.'; Import_Data_17 = reshape(Import_Data_17, Printer_Nx, Printer_Ny)
  Import_Data_18 = Import_Data_18[1 + 2: end - 2]; Import_Data_18 = replace(Import_Data_18, " ", ","); Import_Data_18 = include_string(Import_Data_18); Import_Data_18 = collect(Import_Data_18); Import_Data_18 = Import_Data_18.'; Import_Data_18 = reshape(Import_Data_18, Printer_Nx, Printer_Ny)
  Import_Data_19 = Import_Data_19[1 + 2: end - 2]; Import_Data_19 = replace(Import_Data_19, " ", ","); Import_Data_19 = include_string(Import_Data_19); Import_Data_19 = collect(Import_Data_19); Import_Data_19 = Import_Data_19.'; Import_Data_19 = reshape(Import_Data_19, Printer_Nx, Printer_Ny)
  Import_Data_20 = Import_Data_20[1 + 2: end - 2]; Import_Data_20 = replace(Import_Data_20, " ", ","); Import_Data_20 = include_string(Import_Data_20); Import_Data_20 = collect(Import_Data_20); Import_Data_20 = Import_Data_20.'; Import_Data_20 = reshape(Import_Data_20, Printer_Nx, Printer_Ny)
  Import_Data_21 = Import_Data_21[1 + 2: end - 2]; Import_Data_21 = replace(Import_Data_21, " ", ","); Import_Data_21 = include_string(Import_Data_21); Import_Data_21 = collect(Import_Data_21); Import_Data_21 = Import_Data_21.'; Import_Data_21 = reshape(Import_Data_21, Printer_Nx, Printer_Ny)
  Import_Data_22 = Import_Data_22[1 + 2: end - 2]; Import_Data_22 = replace(Import_Data_22, "; ", ","); Import_Data_22 = include_string(Import_Data_22); Import_Data_22 = collect(Import_Data_22); Import_Data_22 = Import_Data_22.';
  Import_Data_23 = Import_Data_23[1 + 2: end - 2]; Import_Data_23 = replace(Import_Data_23, "; ", ","); Import_Data_23 = include_string(Import_Data_23); Import_Data_23 = collect(Import_Data_23);
  Import_Data_24 = Import_Data_24[1 + 2: end - 2]; Import_Data_24 = replace(Import_Data_24, " ", ","); Import_Data_24 = include_string(Import_Data_24); Import_Data_24 = collect(Import_Data_24);
  Import_Data_25 = Import_Data_25[1 + 2: end - 2]; Import_Data_25 = replace(Import_Data_25, " ", ","); Import_Data_25 = include_string(Import_Data_25); Import_Data_25 = collect(Import_Data_25);
  Import_Data_26 = Import_Data_26[1 + 2: end - 2]; Import_Data_26 = replace(Import_Data_26, " ", ","); Import_Data_26 = include_string(Import_Data_26); Import_Data_26 = collect(Import_Data_26);
  Import_Data_27 = Import_Data_27[1 + 2: end - 2]; Import_Data_27 = replace(Import_Data_27, " ", ","); Import_Data_27 = include_string(Import_Data_27); Import_Data_27 = collect(Import_Data_27);

  # INPUT PARAMETERS
  Nx = Int64(Import_Data_1[1] - 2) # Number of cells in the x-direction
  Ny = Int64(Import_Data_1[2] - 2) # Number of cells in the y-direction
  Re = Import_Data_1[3] # Reynolds Number of the flow
  Inflow_Velocity = Import_Data_1[4]
  Rho_Initial = Import_Data_1[5]
  Rho = Import_Data_7 # Macroscopic density
  Previous_Maximum_Iterations = Int64(Import_Data_1[6]) # Total number of iterations (TIME STEP)
  Previous_Cycle_Plot = Int64(Import_Data_1[7]) # Cycle evaluated for plotting at this increment of cycles
  Previous_Force_Plot = Int64(Import_Data_1[8]) # Force evaluated for plotting at this increment of cycles
  Previous_Force_Plot_Crop = Int64(Import_Data_1[9]) # This integer to the maximum iterations is what will be accounted for during post-processing (prior to this is spooling up time)
  Previous_VorticityCrop = Import_Data_1[10] # Crops the vorticity values above and below this value for better visiaulisation
  Previous_StreamfunctionCrop = Import_Data_1[11] #1 # Crops the streamfunction values above and below this value for better visiaulisation
  Previous_ArrowScaleFactor = Int64(Import_Data_1[12]) # Scaling factor for quiver plot arrows
  Boundary_Walls = Int64(Import_Data_1[13]) # Set to 0 for no walls or set to 1 for walls at the upper and lower surface
  Square_Cylinder = Int64(Import_Data_1[14]) # Set to 0 for circular cylinder or set to 1 for square cylinder
  Previous_Current_Timestep = Int64(Import_Data_1[15])
end

#
#
#
#
#
#
#
#
#
#

# INPUT BOUNDARIES
Nx = Nx + 2 # To account for loss of boundary nodes at a later stage
Ny = Ny + 2 # To account for loss of boundary nodes at a later stage
Cylinder_Center_x = Int64(round(Nx/6, RoundUp))
Cylinder_Center_y = Int64(round(Ny/2, RoundUp))
Cylinder_Radius = Ny/30

# Initial Calculations
Inflow_Velocity = Ma/sqrt.(3)
Nu = Inflow_Velocity*2*Cylinder_Radius/Re # Kinematic Viscosity
Omega = 1/(3*Nu + 1/2) # Relaxation Parameter
Omega_Positive = Omega
Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
MRT_Omega1 = Omega
CMRT_Omega1 = Omega
Cumulant_Omega1 = Omega

# D2Q9 Lattice constants
Wi = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36]
Cx = [0, 1, 0, -1, 0, 1, -1, -1, 1]
Cy = [0, 0, 1, 0, -1, 1, 1, -1, -1]
Opp = [1, 4, 5, 2, 3, 8, 9, 6, 7]
if Boundary_Walls == 1
  Col = 2:(Ny - 1)
end
if Boundary_Walls == 0
  Col = 1:Ny
end
Inlet = 1 # Position of the inlet
Outlet = Nx # Position of the outlet
Gx = 1:Nx # Grid x-locations
Gy = 1:Ny # Grid y-locations

# Determination of boundary grid points
Cylinder = zeros(Nx, Ny)
if Square_Cylinder == 0
  for i = Gx
    for j = Gy
      Cylinder[i, j] = (Gx[i] - Cylinder_Center_x).^2 + (Gy[j] - Cylinder_Center_y).^2 <= Cylinder_Radius.^2
    end
  end
end
if Square_Cylinder == 1
  for i = Gx
    for j = Gy
      if (i > (Cylinder_Center_x - Cylinder_Radius)) && (i < (Cylinder_Center_x + Cylinder_Radius)) && (j > (Cylinder_Center_y - Cylinder_Radius)) && (j < (Cylinder_Center_y + Cylinder_Radius))
        Cylinder[i, j] = 1
      end
    end
  end
end
Wall = zeros(Nx, Ny)
if Boundary_Walls == 1
  Wall[:, 1] = 1
  Wall[:, Ny] = 1
end
if Boundary_Walls == 0
  Wall[:, 1] = 0
  Wall[:, Ny] = 0
end

# Bounce Back Region
BBR_Indices_i = zeros(Nx, Ny)
BBR_Indices_j = zeros(Nx, Ny)
for i = Gx
  for j = Gy
    BBR_Indices_i[i, j] = i
    BBR_Indices_j[i, j] = j
  end
end
BBR_Indices_i = BBR_Indices_i.*(Cylinder + Wall)
BBR_Indices_j = BBR_Indices_j.*(Cylinder + Wall)
BBR_Indices = find(Cylinder + Wall)

f_IN = zeros(Nx, Ny, 9)
f_EQ = zeros(Nx, Ny, 9)
f_OUT = zeros(Nx, Ny, 9)
Rho = zeros(Nx, Ny)
Fx_Cylinder = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Fy_Cylinder = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Lift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Drag_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
X_Plot = ones(Nx, Ny).*(1:Nx).'.'
Y_Plot = ones(Nx, Ny).*(1:Ny).'
Ut_Plot = zeros(Nx, Ny)
Ux_Plot = zeros(Nx, Ny)
Uy_Plot = zeros(Nx, Ny)
Rho_Plot = zeros(Nx, Ny)
Vorticity = zeros(Nx, Ny)
Vorticity_Mod = zeros(Nx, Ny)
DelUy_Delx = zeros(Nx, Ny)
DelUx_Dely = zeros(Nx, Ny)
Streamfunction = zeros(Nx, Ny)
Streamfunction_Mod = zeros(Nx, Ny)
IntUx_dy = zeros(Nx, Ny)
IntUy_dx = zeros(Nx, Ny)
C_IntUx_dy = zeros(1, Ny)
C_IntUy_dx = zeros(Nx, 1)

# Additional variables for alternate collision models
# TRT LBM collision setup
f_IN_Positive = zeros(Nx, Ny, 9)
f_IN_Negative = zeros(Nx, Ny, 9)
f_EQ_Positive = zeros(Nx, Ny, 9)
f_EQ_Negative = zeros(Nx, Ny, 9)
# MRT LBM collision setup
MRT_M00raw = zeros(Nx, Ny)
MRT_M10raw = zeros(Nx, Ny)
MRT_M01raw = zeros(Nx, Ny)
MRT_M11raw = zeros(Nx, Ny)
MRT_M20raw = zeros(Nx, Ny)
MRT_M02raw = zeros(Nx, Ny)
MRT_Praw_IN = zeros(Nx, Ny)
MRT_Nraw_IN = zeros(Nx, Ny)
MRT_Eraw_IN =  zeros(Nx, Ny)
MRT_M21raw_IN = zeros(Nx, Ny)
MRT_M12raw_IN = zeros(Nx, Ny)
MRT_M22raw_IN = zeros(Nx, Ny)
MRT_Praw_EQ = zeros(Nx, Ny)
MRT_Nraw_EQ = zeros(Nx, Ny)
MRT_Eraw_EQ = zeros(Nx, Ny)
MRT_M21raw_EQ = zeros(Nx, Ny)
MRT_M12raw_EQ = zeros(Nx, Ny)
MRT_M22raw_EQ = zeros(Nx, Ny)
MRT_Praw_OUT = zeros(Nx, Ny)
MRT_Nraw_OUT = zeros(Nx, Ny)
MRT_Eraw_OUT = zeros(Nx, Ny)
MRT_M21raw_OUT = zeros(Nx, Ny)
MRT_M12raw_OUT = zeros(Nx, Ny)
MRT_M22raw_OUT = zeros(Nx, Ny)
# CMRT LBM collision setup
CMRT_M00raw = zeros(Nx, Ny)
CMRT_M10raw = zeros(Nx, Ny)
CMRT_M01raw = zeros(Nx, Ny)
CMRT_M11raw = zeros(Nx, Ny)
CMRT_M20raw = zeros(Nx, Ny)
CMRT_M02raw = zeros(Nx, Ny)
CMRT_Praw_IN = zeros(Nx, Ny)
CMRT_Nraw_IN = zeros(Nx, Ny)
CMRT_Eraw_IN =  zeros(Nx, Ny)
CMRT_M21raw_IN = zeros(Nx, Ny)
CMRT_M12raw_IN = zeros(Nx, Ny)
CMRT_M22raw_IN = zeros(Nx, Ny)
CMRT_Pcentral_IN = zeros(Nx, Ny)
CMRT_Ncentral_IN = zeros(Nx, Ny)
CMRT_Ecentral_IN = zeros(Nx, Ny)
CMRT_M21central_IN = zeros(Nx, Ny)
CMRT_M12central_IN = zeros(Nx, Ny)
CMRT_M22central_IN = zeros(Nx, Ny)
CMRT_Pcentral_EQ = 0
CMRT_Ncentral_EQ = 0
CMRT_Ecentral_EQ = 2/3
CMRT_M21central_EQ = 0
CMRT_M12central_EQ = 0
CMRT_M22central_EQ = 1/9
CMRT_Praw_OUT = zeros(Nx, Ny)
CMRT_Nraw_OUT = zeros(Nx, Ny)
CMRT_Eraw_OUT = zeros(Nx, Ny)
CMRT_M21raw_OUT = zeros(Nx, Ny)
CMRT_M12raw_OUT = zeros(Nx, Ny)
CMRT_M22raw_OUT = zeros(Nx, Ny)
CMRT_Pcentral_OUT = zeros(Nx, Ny)
CMRT_Ncentral_OUT = zeros(Nx, Ny)
CMRT_Ecentral_OUT = zeros(Nx, Ny)
CMRT_M21central_OUT = zeros(Nx, Ny)
CMRT_M12central_OUT = zeros(Nx, Ny)
CMRT_M22central_OUT = zeros(Nx, Ny)
# Cumulant LBM collision setup
Cumulant_M00raw = zeros(Nx, Ny)
Cumulant_M10raw = zeros(Nx, Ny)
Cumulant_M01raw = zeros(Nx, Ny)
Cumulant_M11raw = zeros(Nx, Ny)
Cumulant_M20raw = zeros(Nx, Ny)
Cumulant_M02raw = zeros(Nx, Ny)
Cumulant_Praw_IN = zeros(Nx, Ny)
Cumulant_Nraw_IN = zeros(Nx, Ny)
Cumulant_Eraw_IN =  zeros(Nx, Ny)
Cumulant_M21raw_IN = zeros(Nx, Ny)
Cumulant_M12raw_IN = zeros(Nx, Ny)
Cumulant_M22raw_IN = zeros(Nx, Ny)
Cumulant_Pcentral_IN = zeros(Nx, Ny)
Cumulant_Ncentral_IN = zeros(Nx, Ny)
Cumulant_Ecentral_IN = zeros(Nx, Ny)
Cumulant_M21central_IN = zeros(Nx, Ny)
Cumulant_M12central_IN = zeros(Nx, Ny)
Cumulant_M22central_IN = zeros(Nx, Ny)
Cumulant_Pcentral_EQ = 0
Cumulant_Ncentral_EQ = 0
Cumulant_Ecentral_EQ = 2/3
Cumulant_M21central_EQ = 0
Cumulant_M12central_EQ = 0
Cumulant_Praw_OUT = zeros(Nx, Ny)
Cumulant_Nraw_OUT = zeros(Nx, Ny)
Cumulant_Eraw_OUT = zeros(Nx, Ny)
Cumulant_M21raw_OUT = zeros(Nx, Ny)
Cumulant_M12raw_OUT = zeros(Nx, Ny)
Cumulant_M22raw_OUT = zeros(Nx, Ny)
Cumulant_Pcentral_OUT = zeros(Nx, Ny)
Cumulant_Ncentral_OUT = zeros(Nx, Ny)
Cumulant_Ecentral_OUT = zeros(Nx, Ny)
Cumulant_M21central_OUT = zeros(Nx, Ny)
Cumulant_M12central_OUT = zeros(Nx, Ny)
Cumulant_M22central_OUT = zeros(Nx, Ny)
Cumulant_M22FOURTHORDERCUMULANT_IN = zeros(Nx, Ny)
Cumulant_M22FOURTHORDERCUMULANT_EQ = 0
Cumulant_M22FOURTHORDERCUMULANT_OUT = zeros(Nx, Ny)
Dx_Ux = zeros(Nx, Ny)
Dy_Uy = zeros(Nx, Ny)
Dxx_Ux = zeros(Nx, Ny)
Dyy_Uy = zeros(Nx, Ny)
Combined_Cumulant_SecondDerivatives_N = zeros(Nx, Ny)
Combined_Cumulant_SecondDerivatives_E = zeros(Nx, Ny)
# RLBM collision setup
f_IN_FirstOrder = zeros(Nx, Ny, 9)
RLBM_Pxx = zeros(Nx, Ny, 9)
RLBM_Pyy = zeros(Nx, Ny, 9)
RLBM_Pxy = zeros(Nx, Ny, 9)
RLBM_Pxx_EQ = zeros(Nx, Ny, 9)
RLBM_Pyy_EQ = zeros(Nx, Ny, 9)
RLBM_Pxy_EQ = zeros(Nx, Ny, 9)
RLBM_Pxx_NEQ = zeros(Nx, Ny, 9)
RLBM_Pyy_NEQ = zeros(Nx, Ny, 9)
RLBM_Pxy_NEQ = zeros(Nx, Ny, 9)
RLBM_Qxx = Cx.*Cx - 1/3
RLBM_Qyy = Cy.*Cy - 1/3
RLBM_Qxy = Cx.*Cy

# INITIAL CONDITIONS: Poiseuille Profile at Equilibrium
if Boundary_Walls == 1
  L = Ny - 2
  y_Phys = Gy - 3/2
  Ux = 4*Inflow_Velocity./(L.^2)*(y_Phys.*L - (y_Phys.^2))
  Ux = ones(Nx, Ny).*(1 - (Cylinder + Wall)).*Ux.'
  Uy = zeros(Nx, Ny)
  for k = 1:9
    CUxy = 3*(Cx[k].*Ux + Cy[k].*Uy)
    f_IN[:, :, k] = Rho_Initial.*Wi[k].*(1 + CUxy + 1/2.*(CUxy.^2) - 3/2.*(Ux.^2 + Uy.^2))
  end
end

# ALTERNATE INITIAL CONDITIONS: Uniform Flow
if Boundary_Walls == 0
  Ux = Inflow_Velocity
  Ux = ones(Nx, Ny).*(1 - (Cylinder + Wall)).*Ux.'
  Uy = zeros(Nx, Ny)
  for k = 1:9
    CUxy = 3*(Cx[k].*Ux + Cy[k].*Uy)
    f_IN[:, :, k] = Rho_Initial.*Wi[k].*(1 + CUxy + 1/2.*(CUxy.^2) - 3/2.*(Ux.^2 + Uy.^2))
  end
end

# RESTARTED INITIAL CONDITIONS: Read from file
if Restart_Calculation == "Yes"
  f_IN[:, :, 1] = Import_Data_2part1
  f_IN[:, :, 2] = Import_Data_2part2
  f_IN[:, :, 3] = Import_Data_2part3
  f_IN[:, :, 4] = Import_Data_2part4
  f_IN[:, :, 5] = Import_Data_2part5
  f_IN[:, :, 6] = Import_Data_2part6
  f_IN[:, :, 7] = Import_Data_2part7
  f_IN[:, :, 8] = Import_Data_2part8
  f_IN[:, :, 9] = Import_Data_2part9
  f_EQ[:, :, 1] = Import_Data_3part1
  f_EQ[:, :, 2] = Import_Data_3part2
  f_EQ[:, :, 3] = Import_Data_3part3
  f_EQ[:, :, 4] = Import_Data_3part4
  f_EQ[:, :, 5] = Import_Data_3part5
  f_EQ[:, :, 6] = Import_Data_3part6
  f_EQ[:, :, 7] = Import_Data_3part7
  f_EQ[:, :, 8] = Import_Data_3part8
  f_EQ[:, :, 9] = Import_Data_3part9
  f_OUT[:, :, 1] = Import_Data_4part1
  f_OUT[:, :, 2] = Import_Data_4part2
  f_OUT[:, :, 3] = Import_Data_4part3
  f_OUT[:, :, 4] = Import_Data_4part4
  f_OUT[:, :, 5] = Import_Data_4part5
  f_OUT[:, :, 6] = Import_Data_4part6
  f_OUT[:, :, 7] = Import_Data_4part7
  f_OUT[:, :, 8] = Import_Data_4part8
  f_OUT[:, :, 9] = Import_Data_4part9
  Ux = Import_Data_5
  Uy = Import_Data_6
  Rho = Import_Data_7
  X_Plot = Import_Data_8
  Y_Plot = Import_Data_9
  Ut_Plot = Import_Data_10
  Ux_Plot = Import_Data_11
  Uy_Plot = Import_Data_12
  Rho_Plot = Import_Data_13
  Vorticity = Import_Data_14
  Vorticity_MOD = Import_Data_15
  DelUy_Delx = Import_Data_16
  DelUx_Dely = Import_Data_17
  Streamfunction = Import_Data_18
  Streamfunction_MOD = Import_Data_19
  IntUx_dy = Import_Data_20
  IntUy_dx = Import_Data_21
  C_IntUx_dy = Import_Data_22
  C_IntUy_dx = Import_Data_23
  Fx_Cylinder = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Fy_Cylinder = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Lift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Drag_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Fx_Cylinder[1:Previous_Current_Timestep] = Import_Data_24[1:Previous_Current_Timestep]
  Fy_Cylinder[1:Previous_Current_Timestep] = Import_Data_25[1:Previous_Current_Timestep]
  Lift_Coefficient[1:Previous_Current_Timestep] = Import_Data_26[1:Previous_Current_Timestep]
  Drag_Coefficient[1:Previous_Current_Timestep] = Import_Data_27[1:Previous_Current_Timestep]
end

# Quiver plotting
QuiverLength_x = Int64(round(Nx/ArrowScaleFactor, RoundDown))
QuiverLength_y = Int64(round(Ny/ArrowScaleFactor, RoundDown))
X_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
Y_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
Ux_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
Uy_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
for i = 1:QuiverLength_x
  for j = 1:QuiverLength_y
    X_Plot_Resized[i, j] = X_Plot[i*ArrowScaleFactor, j*ArrowScaleFactor]
    Y_Plot_Resized[i, j] = Y_Plot[i*ArrowScaleFactor, j*ArrowScaleFactor]
  end
end
X_Plot_Resized = X_Plot_Resized.'
Y_Plot_Resized = Y_Plot_Resized.'
X_Plot_Resized = vec(reshape(X_Plot_Resized, 1, QuiverLength_x*QuiverLength_y))
Y_Plot_Resized = vec(reshape(Y_Plot_Resized, 1, QuiverLength_x*QuiverLength_y))

println(" ")
println("Reynolds Number = ", Re)
println("Mach Number = ", Inflow_Velocity*sqrt(3))
println("Knudsen Number = ", sqrt(pi/2)/(2*Omega*Cylinder_Radius))
println(" ")
println("Nu = ", Nu, " (Kinematic Viscosity)")
println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
println(" ")
println("Total Nodes = ", Nx*Ny)
println("Total Active Nodes = ", Nx*Ny - Int64(length(BBR_Indices)))
println(" ")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
println(" ")

#
#
#
#
#
#
#
#
#
#

# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
tic()
Cycle = 1
Current_Timestep = Cycle + Previous_Current_Timestep
while Cycle < Maximum_Iterations + 1
  println("Cycle = ", Cycle, " out of ", Maximum_Iterations)

  # MACROSCOPIC Variables
  Rho = Rho.*0
  for k = 1:9
    Rho = Rho + f_IN[:, :, k]
  end
  Ux = Ux.*0
  Uy = Uy.*0
  for k = 1:9
    Ux = Ux + f_IN[:, :, k].*Cx[k]./Rho
    Uy = Uy + f_IN[:, :, k].*Cy[k]./Rho
  end

  # MACROSCOPIC (Dirichlet) Boundary Conditions
  # Inlet: Poiseuille Profile
  if Boundary_Walls == 1
    for j = 2:(Ny - 1)
      y_Phys = j - 3/2
      Ux[Inlet, j] = 4.*Inflow_Velocity./(L.^2).*(y_Phys.*L - (y_Phys.^2))
      Uy[Inlet, j] = 0
      Rho[Inlet, j] = 1./(1 - Ux[Inlet, j]).*(f_IN[Inlet, j, 1] + f_IN[Inlet, j, 3] + f_IN[Inlet, j, 5] + 2*f_IN[Inlet, j, 4] + 2*f_IN[Inlet, j, 7] + 2*f_IN[Inlet, j, 8])
    end
  end

  # ALTERNATE Inlet: Uniform Flow
  if Boundary_Walls == 0
    Ux[Inlet, Col] = Inflow_Velocity
    Uy[Inlet, Col] = 0
    for j = Gy
      Rho[Inlet, j] = 1./(1 - Ux[Inlet, j]).*(f_IN[Inlet, j, 1] + f_IN[Inlet, j, 3] + f_IN[Inlet, j, 5] + 2*f_IN[Inlet, j, 4] + 2*f_IN[Inlet, j, 7] + 2*f_IN[Inlet, j, 8])
    end
  end

  # Outlet: Constant Pressure
  if Boundary_Walls == 1
    for j = 2:(Ny - 1)
      Rho[Outlet, j] = 1
      Ux[Outlet, j] = -1 + 1./Rho[Outlet, j].*(f_IN[Outlet, j, 1] + f_IN[Outlet, j, 3] + f_IN[Outlet, j, 5] + 2*f_IN[Outlet, j, 2] + 2*f_IN[Outlet, j, 6] + 2*f_IN[Outlet, j, 9])
      Uy[Outlet, j] = 0
    end
  end
  if Boundary_Walls == 0
    for j = Gy
      Rho[Outlet, j] = 1
      Ux[Outlet, j] = -1 + 1./Rho[Outlet, j].*(f_IN[Outlet, j, 1] + f_IN[Outlet, j, 3] + f_IN[Outlet, j, 5] + 2*f_IN[Outlet, j, 2] + 2*f_IN[Outlet, j, 6] + 2*f_IN[Outlet, j, 9])
      Uy[Outlet, j] = 0
    end
  end

  # MESOSCOPIC Boundary Conditions
  # Inlet: Zou/He Boundary Conditions
  f_IN[Inlet, Col, 2] = f_IN[Inlet, Col, 4] + 2/3*Rho[Inlet, Col].*Ux[Inlet, Col]
  f_IN[Inlet, Col, 6] = f_IN[Inlet, Col, 8] + 1/2*(f_IN[Inlet, Col, 5] - f_IN[Inlet, Col, 3]) + 1/2*Rho[Inlet, Col].*Uy[Inlet, Col] + 1/6*Rho[Inlet, Col].*Ux[Inlet, Col]
  f_IN[Inlet, Col, 9] = f_IN[Inlet, Col, 7] + 1/2*(f_IN[Inlet, Col, 3] - f_IN[Inlet, Col, 5]) - 1/2*Rho[Inlet, Col].*Uy[Inlet, Col] + 1/6*Rho[Inlet, Col].*Ux[Inlet, Col]
  # Outlet: Zou/He Boundary Conditions
  f_IN[Outlet, Col, 4] = f_IN[Outlet, Col, 2] - 2/3*Rho[Outlet, Col].*Ux[Outlet, Col]
  f_IN[Outlet, Col, 7] = f_IN[Outlet, Col, 9] + 1/2*(f_IN[Outlet, Col, 5] - f_IN[Outlet, Col, 3]) + 1/2*Rho[Outlet, Col].*Uy[Outlet, Col] - 1/6*Rho[Outlet, Col].*Ux[Outlet, Col]
  f_IN[Outlet, Col, 8] = f_IN[Outlet, Col, 6] + 1/2*(f_IN[Outlet, Col, 3] - f_IN[Outlet, Col, 5]) - 1/2*Rho[Outlet, Col].*Uy[Outlet, Col] - 1/6*Rho[Outlet, Col].*Ux[Outlet, Col]

  # COLLISION STEP
  # SRT LBM COLLISION MODEL
  if Collision_Model == "SRT_LBM"
    for k = 1:9
      CUxy = 3.*(Cx[k]*Ux + Cy[k]*Uy)
      f_EQ[:, :, k] = Rho.*Wi[k].*(1 + CUxy + 1/2.*(CUxy.^2) - 3/2.*(Ux.^2 + Uy.^2))
      f_OUT[:, :, k] = f_IN[:, :, k] - Omega.*(f_IN[:, :, k] - f_EQ[:, :, k])
    end
  end
  # TRT LBM COLLISION MODEL
  if Collision_Model == "TRT_LBM"
    for k = 1:9
      CUxy = 3.*(Cx[k]*Ux + Cy[k]*Uy)
      f_EQ[:, :, k] = Rho.*Wi[k].*(1 + CUxy + 1/2.*(CUxy.^2) - 3/2.*(Ux.^2 + Uy.^2))
    end
    for k = 1:9
      f_EQ_Positive[:, :, k] = (f_EQ[:, :, k] + f_EQ[:, :, Opp[k]])/2
      f_EQ_Negative[:, :, k] = (f_EQ[:, :, k] - f_EQ[:, :, Opp[k]])/2
      f_IN_Positive[:, :, k] = (f_IN[:, :, k] + f_IN[:, :, Opp[k]])/2
      f_IN_Negative[:, :, k] = (f_IN[:, :, k] - f_IN[:, :, Opp[k]])/2
    end
    for k = 1:9
      f_OUT[:, :, k] = f_IN[:, :, k] - Omega_Positive.*(f_IN_Positive[:, :, k] - f_EQ_Positive[:, :, k]) - Omega_Negative.*(f_IN_Negative[:, :, k] - f_EQ_Negative[:, :, k])
    end
  end
  # MRT LBM COLLISION MODEL
  if Collision_Model == "MRT_LBM"
    # 0th order raw moment (conservation of mass)
        # MRT_M00raw
    # 1st order raw moments (conservation of momentum)
        # MRT_M10raw
        # MRT_M01raw
    # 2nd order raw moments
        # MRT_M11raw
        # MRT_M20raw
        # MRT_M02raw
    # third order raw moments
        # MRT_M21raw
        # MRT_M12raw
    # fourth order raw moment
        # MRT_M22raw
    # Input block - from velocity space to raw moment space
    MRT_M00raw = ones(Nx, Ny)
    MRT_M10raw = Ux
    MRT_M01raw = Uy
    MRT_M11raw = MRT_M11raw.*0
    MRT_M20raw = MRT_M20raw.*0
    MRT_M02raw = MRT_M02raw.*0
    for k = 1:9
      MRT_M11raw = MRT_M11raw + f_IN[:, :, k].*Cx[k].*Cy[k]./Rho
      MRT_M20raw = MRT_M20raw + f_IN[:, :, k].*(Cx[k].^2)./Rho
      MRT_M02raw = MRT_M02raw + f_IN[:, :, k].*(Cy[k].^2)./Rho
    end
    MRT_Praw_IN = MRT_M11raw
    MRT_Nraw_IN = MRT_M20raw - MRT_M02raw
    MRT_Eraw_IN = MRT_M20raw + MRT_M02raw
    MRT_M21raw_IN = MRT_M21raw_IN.*0
    MRT_M12raw_IN = MRT_M12raw_IN.*0
    MRT_M22raw_IN = MRT_M22raw_IN.*0
    for k = 1:9
      MRT_M21raw_IN = MRT_M21raw_IN + f_IN[:, :, k].*(Cx[k].^2).*Cy[k]./Rho
      MRT_M12raw_IN = MRT_M12raw_IN + f_IN[:, :, k].*Cx[k].*(Cy[k].^2)./Rho
      MRT_M22raw_IN = MRT_M22raw_IN + f_IN[:, :, k].*(Cx[k].^2).*(Cy[k].^2)./Rho
    end
    # Equilibrium block
    MRT_Praw_EQ = MRT_M10raw.*MRT_M01raw
    MRT_Nraw_EQ = (MRT_M10raw.^2) - (MRT_M01raw.^2)
    MRT_Eraw_EQ = 2/3 + (MRT_M10raw.^2) + (MRT_M01raw.^2)
    MRT_M21raw_EQ = MRT_M01raw.*(1/3 + (MRT_M10raw.^2))
    MRT_M12raw_EQ = MRT_M10raw.*(1/3 + (MRT_M01raw.^2))
    MRT_M22raw_EQ = (1/3 + (MRT_M10raw.^2)).*(1/3 + (MRT_M01raw.^2))
    # Relaxation block - in raw moment space
    MRT_Praw_OUT = MRT_Omega1.*MRT_Praw_EQ + (1 - MRT_Omega1).*MRT_Praw_IN
    MRT_Nraw_OUT = MRT_Omega1.*MRT_Nraw_EQ + (1 - MRT_Omega1).*MRT_Nraw_IN
    MRT_Eraw_OUT = MRT_Omega2.*MRT_Eraw_EQ + (1 - MRT_Omega2).*MRT_Eraw_IN
    MRT_M21raw_OUT = MRT_Omega3.*MRT_M21raw_EQ + (1 - MRT_Omega3).*MRT_M21raw_IN
    MRT_M12raw_OUT = MRT_Omega3.*MRT_M12raw_EQ + (1 - MRT_Omega3).*MRT_M12raw_IN
    MRT_M22raw_OUT = MRT_Omega4.*MRT_M22raw_EQ + (1 - MRT_Omega4).*MRT_M22raw_IN
    # Output block - from raw moment space to velocity space
    #MRT_M20raw_OUT = 1/2.*(MRT_Eraw_OUT + MRT_Nraw_OUT)
    #MRT_M02raw_OUT = 1/2.*(MRT_Eraw_OUT - MRT_Nraw_OUT)
    f_OUT[:, :, 1] = Rho.*(MRT_M00raw - MRT_Eraw_OUT + MRT_M22raw_OUT)
    f_OUT[:, :, 2] = 1/2.*Rho.*(MRT_M10raw + 1/2.*(MRT_Eraw_OUT + MRT_Nraw_OUT) - MRT_M12raw_OUT - MRT_M22raw_OUT)
    f_OUT[:, :, 3] = 1/2.*Rho.*(MRT_M01raw + 1/2.*(MRT_Eraw_OUT - MRT_Nraw_OUT) - MRT_M21raw_OUT - MRT_M22raw_OUT)
    f_OUT[:, :, 4] = 1/2.*Rho.*(- MRT_M10raw + 1/2.*(MRT_Eraw_OUT + MRT_Nraw_OUT) + MRT_M12raw_OUT - MRT_M22raw_OUT)
    f_OUT[:, :, 5] = 1/2.*Rho.*(- MRT_M01raw + 1/2.*(MRT_Eraw_OUT - MRT_Nraw_OUT) + MRT_M21raw_OUT - MRT_M22raw_OUT)
    f_OUT[:, :, 6] = 1/4.*Rho.*(MRT_Praw_OUT + MRT_M21raw_OUT + MRT_M12raw_OUT + MRT_M22raw_OUT)
    f_OUT[:, :, 7] = 1/4.*Rho.*(- MRT_Praw_OUT + MRT_M21raw_OUT - MRT_M12raw_OUT + MRT_M22raw_OUT)
    f_OUT[:, :, 8] = 1/4.*Rho.*(MRT_Praw_OUT - MRT_M21raw_OUT - MRT_M12raw_OUT + MRT_M22raw_OUT)
    f_OUT[:, :, 9] = 1/4.*Rho.*(- MRT_Praw_OUT - MRT_M21raw_OUT + MRT_M12raw_OUT + MRT_M22raw_OUT)
  end
  # CMRT LBM COLLISION MODEL
  if Collision_Model == "CMRT_LBM"
    # 0th order raw moment (conservation of mass)
        # CMRT_M00raw
    # 1st order raw moments (conservation of momentum)
        # CMRT_M10raw
        # CMRT_M01raw
    # 2nd order raw moments
        # CMRT_M11raw = CMRT_Praw
        # CMRT_M20raw = 1/2*(CMRT_Eraw + CMRT_Nraw)
        # CMRT_M02raw = 1/2*(CMRT_Eraw - CMRT_Nraw)
    # third order raw moments
        # CMRT_M21raw
        # CMRT_M12raw
    # fourth order raw moment
        # CMRT_M22raw
    # Input block - from velocity space to raw moment space
    CMRT_M00raw = ones(Nx, Ny)
    CMRT_M10raw = Ux
    CMRT_M01raw = Uy
    CMRT_M11raw = CMRT_M11raw.*0
    CMRT_M20raw = CMRT_M20raw.*0
    CMRT_M02raw = CMRT_M02raw.*0
    for k = 1:9
      CMRT_M11raw = CMRT_M11raw + f_IN[:, :, k].*Cx[k].*Cy[k]./Rho
      CMRT_M20raw = CMRT_M20raw + f_IN[:, :, k].*(Cx[k].^2)./Rho
      CMRT_M02raw = CMRT_M02raw + f_IN[:, :, k].*(Cy[k].^2)./Rho
    end
    CMRT_Praw_IN = CMRT_M11raw
    CMRT_Nraw_IN = CMRT_M20raw - CMRT_M02raw
    CMRT_Eraw_IN = CMRT_M20raw + CMRT_M02raw
    CMRT_M21raw_IN = CMRT_M21raw_IN.*0
    CMRT_M12raw_IN = CMRT_M12raw_IN.*0
    CMRT_M22raw_IN = CMRT_M22raw_IN.*0
    for k = 1:9
      CMRT_M21raw_IN = CMRT_M21raw_IN + f_IN[:, :, k].*(Cx[k].^2).*Cy[k]./Rho
      CMRT_M12raw_IN = CMRT_M12raw_IN + f_IN[:, :, k].*Cx[k].*(Cy[k].^2)./Rho
      CMRT_M22raw_IN = CMRT_M22raw_IN + f_IN[:, :, k].*(Cx[k].^2).*(Cy[k].^2)./Rho
    end
    # Construct input block -  from raw moment space to central moment space
    CMRT_Pcentral_IN = CMRT_Praw_IN - CMRT_M10raw.*CMRT_M01raw
    CMRT_Ncentral_IN = CMRT_Nraw_IN - (CMRT_M10raw.^2) + (CMRT_M01raw.^2)
    CMRT_Ecentral_IN = CMRT_Eraw_IN - (CMRT_M10raw.^2) - (CMRT_M01raw.^2)
    CMRT_M21central_IN = CMRT_M21raw_IN - 2.*CMRT_M10raw.*CMRT_Praw_IN - 1/2.*CMRT_M01raw.*(CMRT_Eraw_IN + CMRT_Nraw_IN) + 2.*(CMRT_M10raw.^2).*CMRT_M01raw
    CMRT_M12central_IN = CMRT_M12raw_IN - 2.*CMRT_M01raw.*CMRT_Praw_IN - 1/2.*CMRT_M10raw.*(CMRT_Eraw_IN - CMRT_Nraw_IN) + 2.*CMRT_M10raw.*(CMRT_M01raw.^2)
    CMRT_M22central_IN = CMRT_M22raw_IN - 2.*CMRT_M10raw.*CMRT_M12raw_IN - 2.*CMRT_M01raw.*CMRT_M21raw_IN + 1/2.*((CMRT_M10raw.^2) + (CMRT_M01raw.^2)).*CMRT_Eraw_IN - 1/2.*((CMRT_M10raw.^2) - (CMRT_M01raw.^2)).*CMRT_Nraw_IN + 4.*CMRT_M10raw.*CMRT_M01raw.*CMRT_Praw_IN - 3.*(CMRT_M10raw.^2).*(CMRT_M01raw.^2)
    # Relaxation block - in central moment space
    CMRT_Pcentral_OUT = CMRT_Omega1.*CMRT_Pcentral_EQ + (1 - CMRT_Omega1).*CMRT_Pcentral_IN
    CMRT_Ncentral_OUT = CMRT_Omega1.*CMRT_Ncentral_EQ + (1 - CMRT_Omega1).*CMRT_Ncentral_IN
    CMRT_Ecentral_OUT = CMRT_Omega2.*CMRT_Ecentral_EQ + (1 - CMRT_Omega2).*CMRT_Ecentral_IN
    CMRT_M21central_OUT = CMRT_Omega3.*CMRT_M21central_EQ + (1 - CMRT_Omega3).*CMRT_M21central_IN
    CMRT_M12central_OUT = CMRT_Omega3.*CMRT_M12central_EQ + (1 - CMRT_Omega3).*CMRT_M12central_IN
    CMRT_M22central_OUT = CMRT_Omega4.*CMRT_M22central_EQ + (1 - CMRT_Omega4).*CMRT_M22central_IN
    # Construct output block - from central moment space to raw moment space
    CMRT_Praw_OUT = CMRT_Pcentral_OUT + CMRT_M10raw.*CMRT_M01raw
    CMRT_Nraw_OUT = CMRT_Ncentral_OUT + (CMRT_M10raw.^2) - (CMRT_M01raw.^2)
    CMRT_Eraw_OUT = CMRT_Ecentral_OUT + (CMRT_M10raw.^2) + (CMRT_M01raw.^2)
    CMRT_M21raw_OUT = CMRT_M21central_OUT + 2.*CMRT_M10raw.*CMRT_Praw_OUT + 1/2.*CMRT_M01raw.*(CMRT_Eraw_OUT + CMRT_Nraw_OUT) - 2.*(CMRT_M10raw.^2).*CMRT_M01raw
    CMRT_M12raw_OUT = CMRT_M12central_OUT + 2.*CMRT_M01raw.*CMRT_Praw_OUT + 1/2.*CMRT_M10raw.*(CMRT_Eraw_OUT - CMRT_Nraw_OUT) - 2.*CMRT_M10raw.*(CMRT_M01raw.^2)
    CMRT_M22raw_OUT = CMRT_M22central_OUT + 2.*CMRT_M10raw.*CMRT_M12raw_OUT + 2.*CMRT_M01raw.*CMRT_M21raw_OUT - 1/2.*((CMRT_M10raw.^2) + (CMRT_M01raw.^2)).*CMRT_Eraw_OUT + 1/2.*((CMRT_M10raw.^2) - (CMRT_M01raw.^2)).*CMRT_Nraw_OUT - 4.*CMRT_M10raw.*CMRT_M01raw.*CMRT_Praw_OUT + 3.*(CMRT_M10raw.^2).*(CMRT_M01raw.^2)
    # Output block - from raw moment space to velocity space
    #CMRT_M20raw_OUT = 1/2.*(CMRT_Eraw_OUT + CMRT_Nraw_OUT)
    #CMRT_M02raw_OUT = 1/2.*(CMRT_Eraw_OUT - CMRT_Nraw_OUT)
    f_OUT[:, :, 1] = Rho.*(CMRT_M00raw - CMRT_Eraw_OUT + CMRT_M22raw_OUT)
    f_OUT[:, :, 2] = 1/2.*Rho.*(CMRT_M10raw + 1/2.*(CMRT_Eraw_OUT + CMRT_Nraw_OUT) - CMRT_M12raw_OUT - CMRT_M22raw_OUT)
    f_OUT[:, :, 3] = 1/2.*Rho.*(CMRT_M01raw + 1/2.*(CMRT_Eraw_OUT - CMRT_Nraw_OUT) - CMRT_M21raw_OUT - CMRT_M22raw_OUT)
    f_OUT[:, :, 4] = 1/2.*Rho.*(- CMRT_M10raw + 1/2.*(CMRT_Eraw_OUT + CMRT_Nraw_OUT) + CMRT_M12raw_OUT - CMRT_M22raw_OUT)
    f_OUT[:, :, 5] = 1/2.*Rho.*(- CMRT_M01raw + 1/2.*(CMRT_Eraw_OUT - CMRT_Nraw_OUT) + CMRT_M21raw_OUT - CMRT_M22raw_OUT)
    f_OUT[:, :, 6] = 1/4.*Rho.*(CMRT_Praw_OUT + CMRT_M21raw_OUT + CMRT_M12raw_OUT + CMRT_M22raw_OUT)
    f_OUT[:, :, 7] = 1/4.*Rho.*(- CMRT_Praw_OUT + CMRT_M21raw_OUT - CMRT_M12raw_OUT + CMRT_M22raw_OUT)
    f_OUT[:, :, 8] = 1/4.*Rho.*(CMRT_Praw_OUT - CMRT_M21raw_OUT - CMRT_M12raw_OUT + CMRT_M22raw_OUT)
    f_OUT[:, :, 9] = 1/4.*Rho.*(- CMRT_Praw_OUT - CMRT_M21raw_OUT + CMRT_M12raw_OUT + CMRT_M22raw_OUT)
  end
  # CUMULANT LBM COLLISION MODEL
  if Collision_Model == "Cumulant_LBM"
    # 0th order raw moment (conservation of mass)
        # Cumulant_M00raw
    # 1st order raw moments (conservation of momentum)
        # Cumulant_M10raw
        # Cumulant_M01raw
    # 2nd order raw moments
        # Cumulant_M11raw = Cumulant_Praw
        # Cumulant_M20raw = 1/2*(Cumulant_Eraw + Cumulant_Nraw)
        # Cumulant_M02raw = 1/2*(Cumulant_Eraw - Cumulant_Nraw)
    # third order raw moments
        # Cumulant_M21raw
        # Cumulant_M12raw
    # fourth order raw moment
        # Cumulant_M22raw
    # Input block - from velocity space to raw moment space
    Cumulant_M00raw = ones(Nx, Ny)
    Cumulant_M10raw = Ux
    Cumulant_M01raw = Uy
    Cumulant_M11raw = Cumulant_M11raw.*0
    Cumulant_M20raw = Cumulant_M20raw.*0
    Cumulant_M02raw = Cumulant_M02raw.*0
    for k = 1:9
      Cumulant_M11raw = Cumulant_M11raw + f_IN[:, :, k].*Cx[k].*Cy[k]./Rho
      Cumulant_M20raw = Cumulant_M20raw + f_IN[:, :, k].*(Cx[k].^2)./Rho
      Cumulant_M02raw = Cumulant_M02raw + f_IN[:, :, k].*(Cy[k].^2)./Rho
    end
    Cumulant_Praw_IN = Cumulant_M11raw
    Cumulant_Nraw_IN = Cumulant_M20raw - Cumulant_M02raw
    Cumulant_Eraw_IN = Cumulant_M20raw + Cumulant_M02raw
    Cumulant_M21raw_IN = Cumulant_M21raw_IN.*0
    Cumulant_M12raw_IN = Cumulant_M12raw_IN.*0
    Cumulant_M22raw_IN = Cumulant_M22raw_IN.*0
    for k = 1:9
      Cumulant_M21raw_IN = Cumulant_M21raw_IN + f_IN[:, :, k].*(Cx[k].^2).*Cy[k]./Rho
      Cumulant_M12raw_IN = Cumulant_M12raw_IN + f_IN[:, :, k].*Cx[k].*(Cy[k].^2)./Rho
      Cumulant_M22raw_IN = Cumulant_M22raw_IN + f_IN[:, :, k].*(Cx[k].^2).*(Cy[k].^2)./Rho
    end
    # Construct input block -  from raw moment space to central moment space
    Cumulant_Pcentral_IN = Cumulant_Praw_IN - Cumulant_M10raw.*Cumulant_M01raw
    Cumulant_Ncentral_IN = Cumulant_Nraw_IN - (Cumulant_M10raw.^2) + (Cumulant_M01raw.^2)
    Cumulant_Ecentral_IN = Cumulant_Eraw_IN - (Cumulant_M10raw.^2) - (Cumulant_M01raw.^2)
    Cumulant_M21central_IN = Cumulant_M21raw_IN - 2.*Cumulant_M10raw.*Cumulant_Praw_IN - 1/2.*Cumulant_M01raw.*(Cumulant_Eraw_IN + Cumulant_Nraw_IN) + 2.*(Cumulant_M10raw.^2).*Cumulant_M01raw
    Cumulant_M12central_IN = Cumulant_M12raw_IN - 2.*Cumulant_M01raw.*Cumulant_Praw_IN - 1/2.*Cumulant_M10raw.*(Cumulant_Eraw_IN - Cumulant_Nraw_IN) + 2.*Cumulant_M10raw.*(Cumulant_M01raw.^2)
    Cumulant_M22central_IN = Cumulant_M22raw_IN - 2.*Cumulant_M10raw.*Cumulant_M12raw_IN - 2.*Cumulant_M01raw.*Cumulant_M21raw_IN + 1/2.*((Cumulant_M10raw.^2) + (Cumulant_M01raw.^2)).*Cumulant_Eraw_IN - 1/2.*((Cumulant_M10raw.^2) - (Cumulant_M01raw.^2)).*Cumulant_Nraw_IN + 4.*Cumulant_M10raw.*Cumulant_M01raw.*Cumulant_Praw_IN - 3.*(Cumulant_M10raw.^2).*(Cumulant_M01raw.^2)
    # Construct input block -  from central moment space to cumulant space
    Cumulant_M22FOURTHORDERCUMULANT_IN = Cumulant_M22central_IN - (1/4.*((Cumulant_Ecentral_IN.^2) - (Cumulant_Ncentral_IN.^2)) + 2.*(Cumulant_Pcentral_IN.^2))./Rho
    # First derivatives
    Dx_Ux = - Cumulant_Omega1./(2.*Rho).*(1/2.*Cumulant_Ecentral_IN + 3/2.*Cumulant_Ncentral_IN) - Cumulant_Omega2./(2.*Rho).*(Cumulant_Ecentral_IN - Cumulant_Ecentral_EQ)
    Dy_Uy = Dx_Ux + 3*Cumulant_Omega1./(2.*Rho).*(Cumulant_Ncentral_IN)
    Combined_Cumulant_FirstDerivatives_N = (Ux.^2).*Dx_Ux - (Uy.^2).*Dy_Uy
    Combined_Cumulant_FirstDerivatives_E = (Ux.^2).*Dx_Ux + (Uy.^2).*Dy_Uy
    # Second derivatives
    if Second_Order_Velocity_Derivatives == 1
      Dxx_Ux = zeros(Nx, Ny)
      Dyy_Uy = zeros(Nx, Ny)
      for i = 2:(Nx - 1)
        for j = 2:(Ny - 1)
          Dxx_Ux[i, j] = (Dx_Ux[i + 1, j] - Dx_Ux[i - 1, j])/2
          Dyy_Uy[i, j] = (Dy_Uy[i, j + 1] - Dy_Uy[i, j - 1])/2
        end
      end
      Dxx_Ux[1, :] = Dxx_Ux[2, :]
      Dxx_Ux[Nx, :] = Dxx_Ux[Nx - 1, :]
      Dxx_Ux[:, 1] = Dxx_Ux[:, 2]
      Dxx_Ux[:, Ny] = Dxx_Ux[:, Ny - 1]
      Dyy_Uy[1, :] = Dyy_Uy[2, :]
      Dyy_Uy[Nx, :] = Dyy_Uy[Nx - 1, :]
      Dyy_Uy[:, 1] = Dyy_Uy[:, 2]
      Dyy_Uy[:, Ny] = Dyy_Uy[:, Ny - 1]
      Combined_Cumulant_SecondDerivatives_N = (Dx_Ux.^2) + Ux.*Dxx_Ux - (Dy_Uy.^2) - Uy.*Dyy_Uy
      Combined_Cumulant_SecondDerivatives_E = (Dx_Ux.^2) + Ux.*Dxx_Ux + (Dy_Uy.^2) + Uy.*Dyy_Uy
    end
    # Relaxation block - in cumulant space
    #Cumulant_Nraw_IN = Cumulant_M20raw_IN - Cumulant_M02raw_IN
    #Cumulant_Eraw_IN = Cumulant_M20raw_IN + Cumulant_M02raw_IN
    Cumulant_Pcentral_OUT = Cumulant_Omega1.*Cumulant_Pcentral_EQ + (1 - Cumulant_Omega1).*Cumulant_Pcentral_IN
    Cumulant_Ncentral_OUT = Cumulant_Omega1.*Cumulant_Ncentral_EQ + (1 - Cumulant_Omega1).*Cumulant_Ncentral_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega1).*Combined_Cumulant_FirstDerivatives_N + 2.*Rho.*Cumulant_Omega1.*((((1./Cumulant_Omega1) - 1/2).^2) - 1/12).*Combined_Cumulant_SecondDerivatives_N.*Second_Order_Velocity_Derivatives
    Cumulant_Ecentral_OUT = Cumulant_Omega2.*Cumulant_Ecentral_EQ + (1 - Cumulant_Omega2).*Cumulant_Ecentral_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega2).*Combined_Cumulant_FirstDerivatives_E + (Rho./(3.*Cumulant_Omega1)).*(6 - 3.*(Cumulant_Omega1 + Cumulant_Omega2) + Cumulant_Omega1.*Cumulant_Omega2).*Combined_Cumulant_SecondDerivatives_E.*Second_Order_Velocity_Derivatives
    Cumulant_M21central_OUT = Cumulant_Omega3.*Cumulant_M21central_EQ + (1 - Cumulant_Omega3).*Cumulant_M21central_IN
    Cumulant_M12central_OUT = Cumulant_Omega3.*Cumulant_M12central_EQ + (1 - Cumulant_Omega3).*Cumulant_M12central_IN
    Cumulant_M22FOURTHORDERCUMULANT_OUT = Cumulant_Omega4.*Cumulant_M22FOURTHORDERCUMULANT_EQ + (1 - Cumulant_Omega4).*Cumulant_M22FOURTHORDERCUMULANT_IN
    # Construct output block - from cumulant space to central moment space
    Cumulant_M22central_OUT = Cumulant_M22FOURTHORDERCUMULANT_OUT + (1/4.*((Cumulant_Ecentral_OUT.^2) - (Cumulant_Ncentral_OUT.^2)) + 2.*(Cumulant_Pcentral_OUT.^2))./Rho
    # Construct output block - from central moment space to raw moment space
    Cumulant_Praw_OUT = Cumulant_Pcentral_OUT + Cumulant_M10raw.*Cumulant_M01raw
    Cumulant_Nraw_OUT = Cumulant_Ncentral_OUT + (Cumulant_M10raw.^2) - (Cumulant_M01raw.^2)
    Cumulant_Eraw_OUT = Cumulant_Ecentral_OUT + (Cumulant_M10raw.^2) + (Cumulant_M01raw.^2)
    Cumulant_M21raw_OUT = Cumulant_M21central_OUT + 2.*Cumulant_M10raw.*Cumulant_Praw_OUT + 1/2.*Cumulant_M01raw.*(Cumulant_Eraw_OUT + Cumulant_Nraw_OUT) - 2.*(Cumulant_M10raw.^2).*Cumulant_M01raw
    Cumulant_M12raw_OUT = Cumulant_M12central_OUT + 2.*Cumulant_M01raw.*Cumulant_Praw_OUT + 1/2.*Cumulant_M10raw.*(Cumulant_Eraw_OUT - Cumulant_Nraw_OUT) - 2.*Cumulant_M10raw.*(Cumulant_M01raw.^2)
    Cumulant_M22raw_OUT = Cumulant_M22central_OUT + 2.*Cumulant_M10raw.*Cumulant_M12raw_OUT + 2.*Cumulant_M01raw.*Cumulant_M21raw_OUT - 1/2.*((Cumulant_M10raw.^2) + (Cumulant_M01raw.^2)).*Cumulant_Eraw_OUT + 1/2.*((Cumulant_M10raw.^2) - (Cumulant_M01raw.^2)).*Cumulant_Nraw_OUT - 4.*Cumulant_M10raw.*Cumulant_M01raw.*Cumulant_Praw_OUT + 3.*(Cumulant_M10raw.^2).*(Cumulant_M01raw.^2)
    # Output block - from raw moment space to velocity space
    #Cumulant_M20raw_OUT = 1/2.*(Cumulant_Eraw_OUT + Cumulant_Nraw_OUT)
    #Cumulant_M02raw_OUT = 1/2.*(Cumulant_Eraw_OUT - Cumulant_Nraw_OUT)
    f_OUT[:, :, 1] = Rho.*(Cumulant_M00raw - Cumulant_Eraw_OUT + Cumulant_M22raw_OUT)
    f_OUT[:, :, 2] = 1/2.*Rho.*(Cumulant_M10raw + 1/2.*(Cumulant_Eraw_OUT + Cumulant_Nraw_OUT) - Cumulant_M12raw_OUT - Cumulant_M22raw_OUT)
    f_OUT[:, :, 3] = 1/2.*Rho.*(Cumulant_M01raw + 1/2.*(Cumulant_Eraw_OUT - Cumulant_Nraw_OUT) - Cumulant_M21raw_OUT - Cumulant_M22raw_OUT)
    f_OUT[:, :, 4] = 1/2.*Rho.*(- Cumulant_M10raw + 1/2.*(Cumulant_Eraw_OUT + Cumulant_Nraw_OUT) + Cumulant_M12raw_OUT - Cumulant_M22raw_OUT)
    f_OUT[:, :, 5] = 1/2.*Rho.*(- Cumulant_M01raw + 1/2.*(Cumulant_Eraw_OUT - Cumulant_Nraw_OUT) + Cumulant_M21raw_OUT - Cumulant_M22raw_OUT)
    f_OUT[:, :, 6] = 1/4.*Rho.*(Cumulant_Praw_OUT + Cumulant_M21raw_OUT + Cumulant_M12raw_OUT + Cumulant_M22raw_OUT)
    f_OUT[:, :, 7] = 1/4.*Rho.*(- Cumulant_Praw_OUT + Cumulant_M21raw_OUT - Cumulant_M12raw_OUT + Cumulant_M22raw_OUT)
    f_OUT[:, :, 8] = 1/4.*Rho.*(Cumulant_Praw_OUT - Cumulant_M21raw_OUT - Cumulant_M12raw_OUT + Cumulant_M22raw_OUT)
    f_OUT[:, :, 9] = 1/4.*Rho.*(- Cumulant_Praw_OUT - Cumulant_M21raw_OUT + Cumulant_M12raw_OUT + Cumulant_M22raw_OUT)
  end
  # RLBM COLLISION MODEL
  if Collision_Model == "RLBM"
    for k = 1:9
      CUxy = 3.*(Cx[k]*Ux + Cy[k]*Uy)
      f_EQ[:, :, k] = Rho.*Wi[k].*(1 + CUxy + 1/2.*(CUxy.^2) - 3/2.*(Ux.^2 + Uy.^2))
    end
    RLBM_Pxx = RLBM_Pxx.*0
    RLBM_Pyy = RLBM_Pyy.*0
    RLBM_Pxy = RLBM_Pxy.*0
    RLBM_Pxx_EQ = RLBM_Pxx_EQ.*0
    RLBM_Pyy_EQ = RLBM_Pyy_EQ.*0
    RLBM_Pxy_EQ = RLBM_Pxy_EQ.*0
    for k = 1:9
      RLBM_Pxx[:, :, k] = RLBM_Pxx[:, :, k] + Cx[k]*Cx[k]*f_IN[:, :, k]
      RLBM_Pyy[:, :, k] = RLBM_Pyy[:, :, k] + Cy[k]*Cy[k]*f_IN[:, :, k]
      RLBM_Pxy[:, :, k] = RLBM_Pxy[:, :, k] + Cx[k]*Cy[k]*f_IN[:, :, k]
      RLBM_Pxx_EQ[:, :, k] = RLBM_Pxx_EQ[:, :, k] + Cx[k]*Cx[k]*f_EQ[:, :, k]
      RLBM_Pyy_EQ[:, :, k] = RLBM_Pyy_EQ[:, :, k] + Cy[k]*Cy[k]*f_EQ[:, :, k]
      RLBM_Pxy_EQ[:, :, k] = RLBM_Pxy_EQ[:, :, k] + Cx[k]*Cy[k]*f_EQ[:, :, k]
    end
    #f_NEQ = f_IN - f_EQ
    RLBM_Pxx_NEQ = RLBM_Pxx - RLBM_Pxx_EQ
    RLBM_Pyy_NEQ = RLBM_Pyy - RLBM_Pyy_EQ
    RLBM_Pxy_NEQ = RLBM_Pxy - RLBM_Pxy_EQ
    for k = 1:9
      f_IN_FirstOrder[:, :, k] = (9/2)*Wi[k]*(RLBM_Qxx[k]*RLBM_Pxx_NEQ[:, :, k] + RLBM_Qyy[k]*RLBM_Pyy_NEQ[:, :, k] + 2*RLBM_Qxy[k]*RLBM_Pxy_NEQ[:, :, k])
      f_OUT[:, :, k] = f_EQ[:, :, k] + (1 - Omega)*f_IN_FirstOrder[:, :, k]
    end
  end
  if (Collision_Model != "SRT_LBM") && (Collision_Model != "TRT_LBM") && (Collision_Model != "MRT_LBM") && (Collision_Model != "CMRT_LBM") && (Collision_Model != "Cumulant_LBM") && (Collision_Model != "RLBM")
    Cycle = Cycle + Maximum_Iterations - 1
    println("NOT A VALID INPUT FOR TO COLLISION MODEL")
  end

  # BOUNCE BACK ROUTINE (first order accuracy)
  for i = Gx
    for j = Gy
      for k = 2:9
        if (BBR_Indices_i[i, j] > 0) && (BBR_Indices_j[i, j] > 0)
          f_OUT[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), k] = f_IN[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), Opp[k]]
        end
      end
    end
  end

  # FORCE ESTIMATION STEP
  if (mod(Cycle + 1, Force_Plot) == 1) || (Cycle == 1)
    println(" ")
    println("Force Computation Plot (Momentum Exchange Method) = ", Cycle)
    println(" ")
    for i = 2:(Nx - 1)
      for j = 2:(Ny - 1)
        for k = 2:5
          if (Cylinder[i, j] == 0) && (Cylinder[i + Cx[k], j] == 1)
            Fx_Cylinder[Current_Timestep] = Fx_Cylinder[Current_Timestep] + Cx[k]*(f_OUT[i, j, k] + f_OUT[i + Cx[k], j, Opp[k]])
          end
          if (Cylinder[i, j] == 0) && (Cylinder[i, j + Cy[k]] == 1)
            Fy_Cylinder[Current_Timestep] = Fy_Cylinder[Current_Timestep] + Cy[k]*(f_OUT[i, j, k] + f_OUT[i, j + Cy[k], Opp[k]])
          end
        end
        for k = 6:9
          if (Cylinder[i, j] == 0) && (Cylinder[i + Cx[k], j + Cy[k]] == 1)
            Fx_Cylinder[Current_Timestep] = Fx_Cylinder[Current_Timestep] + Cx[k]*(f_OUT[i, j, k] + f_OUT[i + Cx[k], j + Cy[k], Opp[k]])
            Fy_Cylinder[Current_Timestep] = Fy_Cylinder[Current_Timestep] + Cy[k]*(f_OUT[i, j, k] + f_OUT[i + Cx[k], j + Cy[k], Opp[k]])
          end
        end
      end
    end
  end
  if (mod(Cycle + 1, Force_Plot) != 1) && (Cycle != 1)
    Fx_Cylinder[Current_Timestep] = Fx_Cylinder[Current_Timestep - 1]
    Fy_Cylinder[Current_Timestep] = Fy_Cylinder[Current_Timestep - 1]
  end
  # Non-dimensionalisation of forces
  Lift_Coefficient[Current_Timestep] = Fy_Cylinder[Current_Timestep]/(Rho_Initial*(Inflow_Velocity^2)*Cylinder_Radius)
  Drag_Coefficient[Current_Timestep] = Fx_Cylinder[Current_Timestep]/(Rho_Initial*(Inflow_Velocity^2)*Cylinder_Radius)
  if (Cycle == 1) && (Restart_Calculation == "Yes")
    Fx_Cylinder[Current_Timestep - 1] = Fx_Cylinder[Current_Timestep - 2]
    Fy_Cylinder[Current_Timestep - 1] = Fy_Cylinder[Current_Timestep - 2]
    Lift_Coefficient[Current_Timestep - 1] = Lift_Coefficient[Current_Timestep - 2]
    Drag_Coefficient[Current_Timestep - 1] = Drag_Coefficient[Current_Timestep - 2]
  end

  # STREAMING STEP
  for k = 1:9
    f_IN[:, :, k] = circshift(f_OUT[:, :, k], [Cx[k], Cy[k]])
  end

  # NEXT CYCLE COUNT
  Cycle = Cycle + 1
  Current_Timestep = Cycle + Previous_Current_Timestep

  # RAMP UP FUNCTION
  if Ramp_Up_Test == "Yes"
    if Cycle > Ramp_Up_Initial
      Re = Re + Ramp_Up_Increment # Reynolds Number of the flow
      Nu = Inflow_Velocity*2*Cylinder_Radius/Re # Kinematic Viscosity
      Omega = 1/(3*Nu + 1/2) # Relaxation Parameter
      Omega_Positive = Omega
      Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
      MRT_Omega1 = Omega
      CMRT_Omega1 = Omega
      Cumulant_Omega1 = Omega
      println(" ")
      println("Reynolds Number = ", Re)
      println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
    end
    # INSTABILITY DETECTION
    if (Lift_Coefficient[Current_Timestep] > 100) || (Drag_Coefficient[Current_Timestep] > 100) || (Lift_Coefficient[Current_Timestep] == NaN) || (Drag_Coefficient[Current_Timestep] == NaN)
      Cycle = Maximum_Iterations
      println(" ")
      println(" ")
      println(" ")
      println("NUMERIC INSTABILITY DETECTED - TERMINATING CALCULATION")
      println("NUMERIC INSTABILITY DETECTED - TERMINATING CALCULATION")
      println("NUMERIC INSTABILITY DETECTED - TERMINATING CALCULATION")
      println(" ")
      println(" ")
      println(" ")
    end
  end

  # VISUALISATION STEP
  if mod(Cycle + 1, Cycle_Plot) == 1
    println(" ")
    println("Cycle Plot = ", Cycle)
    println(" ")

    Ut_Plot = sqrt(Ux.^2 + Uy.^2)./Inflow_Velocity
    Ux_Plot = Ux./Inflow_Velocity
    Uy_Plot = Uy./Inflow_Velocity
    Rho_Plot = (Rho./3)./(Rho_Initial./3)

    Ux_Plot[1, :] = NaN
    Ux_Plot[Nx, :] = NaN
    Ux_Plot[:, 1] = NaN
    Ux_Plot[:, Ny] = NaN
    Uy_Plot[1, :] = NaN
    Uy_Plot[Nx, :] = NaN
    Uy_Plot[:, 1] = NaN
    Uy_Plot[:, Ny] = NaN
    Ut_Plot[1, :] = NaN
    Ut_Plot[Nx, :] = NaN
    Ut_Plot[:, 1] = NaN
    Ut_Plot[:, Ny] = NaN
    Rho_Plot[1, :] = NaN
    Rho_Plot[Nx, :] = NaN
    Rho_Plot[:, 1] = NaN
    Rho_Plot[:, Ny] = NaN

    # Vorticity plotting
    for i = 2:(Nx - 1)
      for j = 2:(Ny - 1)
        DelUy_Delx[i, j] = (Uy[i + 1, j] - Uy[i - 1, j])./2
        DelUx_Dely[i, j] = (Ux[i, j + 1] - Ux[i, j - 1])./2
      end
    end
    Vorticity = DelUy_Delx - DelUx_Dely
    Vorticity_Mod = Vorticity
    Vorticity_Mod[1, :] = NaN
    Vorticity_Mod[Nx, :] = NaN
    Vorticity_Mod[:, 1] = NaN
    Vorticity_Mod[:, Ny] = NaN
    for i = Gx
      for j = Gy
        if Vorticity_Mod[i, j] > VorticityCrop
          Vorticity_Mod[i, j] = VorticityCrop
        end
        if Vorticity_Mod[i, j] < - VorticityCrop
          Vorticity_Mod[i, j] = - VorticityCrop
        end
      end
    end

    # Quiver plotting
    Ux_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
    Uy_Plot_Resized = zeros(QuiverLength_x, QuiverLength_y)
    for i = 1:QuiverLength_x
      for j = 1:QuiverLength_y
        Ux_Plot_Resized[i, j] = Ux_Plot[i*ArrowScaleFactor, j*ArrowScaleFactor]
        Uy_Plot_Resized[i, j] = Uy_Plot[i*ArrowScaleFactor, j*ArrowScaleFactor]
      end
    end
    Ux_Plot_Resized = ArrowScaleFactor*Ux_Plot_Resized.'
    Uy_Plot_Resized = ArrowScaleFactor*Uy_Plot_Resized.'
    Ux_Plot_Resized = vec(reshape(Ux_Plot_Resized, 1, QuiverLength_x*QuiverLength_y))
    Uy_Plot_Resized = vec(reshape(Uy_Plot_Resized, 1, QuiverLength_x*QuiverLength_y))

    # Streamfunction plotting
    IntUx_dy = zeros(Nx, Ny)
    IntUy_dx = zeros(Nx, Ny)
    for i = 2:(Nx - 1)
      IntUx_dy[i, 1] = (Ux[i, 1] + Ux[i, 2])/2
    end
    for j = 2:(Ny - 1)
      IntUy_dx[1, j] = (Uy[1, j] + Uy[2, j])/2
    end
    for i = 2:(Nx - 1)
      for j = 2:(Ny - 1)
        IntUx_dy[i, j] = IntUx_dy[i, j - 1] + (Ux[i, j] + Ux[i, j + 1])./2
        IntUy_dx[i, j] = IntUy_dx[i - 1, j] + (Uy[i, j] + Uy[i + 1, j])./2
      end
    end
    for i = 2:(Nx - 1)
      C_IntUy_dx[i, 1] = IntUy_dx[i, 2] - (Uy[i, 1] + Uy[i + 1, 1])./2
    end
    for j = 2:(Ny - 1)
      C_IntUx_dy[1, j] = IntUx_dy[2, j] - (Ux[1, j] + Ux[1, j + 1])./2
    end
    IntUx_dy = IntUx_dy + ones(Nx, Ny).*C_IntUx_dy
    IntUy_dx = IntUy_dx + ones(Nx, Ny).*C_IntUy_dx
    Streamfunction = IntUx_dy - IntUy_dx
    Streamfunction_Mod = IntUx_dy - IntUy_dx
    Streamfunction_Mod = Streamfunction_Mod - minimum(Streamfunction_Mod)
    Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])] = maximum(Streamfunction_Mod) - Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])]
    Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])] = maximum(Streamfunction_Mod) - Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])]
    Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])] = maximum(Streamfunction_Mod) - Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])]
    Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])] = maximum(Streamfunction_Mod) - Streamfunction_Mod[findin(Streamfunction_Mod, Streamfunction_Mod[Streamfunction_Mod .> (1/2*(maximum(Streamfunction_Mod) - minimum(Streamfunction_Mod)) + minimum(Streamfunction_Mod))])]
    Streamfunction_Mod[1, :] = NaN
    Streamfunction_Mod[Nx, :] = NaN
    Streamfunction_Mod[:, 1] = NaN
    Streamfunction_Mod[:, Ny] = NaN
    for i = Gx
      for j = Gy
        if Streamfunction_Mod[i, j] > StreamfunctionCrop
          Streamfunction_Mod[i, j] = StreamfunctionCrop
        end
        if Streamfunction_Mod[i, j] < - StreamfunctionCrop
          Streamfunction_Mod[i, j] = - StreamfunctionCrop
        end
      end
    end

    for i = Gx
      for j = Gy
        if BBR_Indices_i[i, j] > 0 && BBR_Indices_j[i, j] > 0
          Ux_Plot[i, j] = NaN
          Uy_Plot[i, j] = NaN
          Ut_Plot[i, j] = NaN
          Rho_Plot[i, j] = NaN
          Vorticity_Mod[i, j] = NaN
          Streamfunction_Mod[i, j] = NaN
        end
      end
    end

    using Plots
    plotly()
    plot()
    plot!((1:Current_Timestep - 1).'.', Lift_Coefficient[1, 1:Current_Timestep - 1])
    plot!((1:Current_Timestep - 1).'.', Drag_Coefficient[1, 1:Current_Timestep - 1])
    xlims!(0, Current_Timestep - 1)
    ylims!( - 1, 3)
    gui()

    using Plots
    plotly()
    heatmap(X_Plot[:, 1], Y_Plot[1, :], Streamfunction_Mod.', xlabel = "Nx", ylabel = "Ny", title = "Streamfunction at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
    quiver!(X_Plot_Resized, Y_Plot_Resized, quiver = (Ux_Plot_Resized, Uy_Plot_Resized), linecolour = :black)
    xlims!(1, Nx)
    ylims!(1, Ny)
    gui()

    using Plots
    plotly()
    L_Plot = grid(3, 2, heights = [1/3, 1/3, 1/3])
    P_Plot = plot(st = [:heatmap], layout = L_Plot, link = :x, colorbar = :none, legend = :none)
    heatmap!(P_Plot[1], X_Plot[:, 1], Y_Plot[1, :], Ux_Plot.', title = "                                                x-Velocity at Time Step = $Current_Timestep    ", title_location = :left, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[3], X_Plot[:, 1], Y_Plot[1, :], Uy_Plot.', title = "                                                y-Velocity at Time Step = $Current_Timestep    ", title_location = :left, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[5], X_Plot[:, 1], Y_Plot[1, :], Ut_Plot.', title = "                                                Total Velocity at Time Step = $Current_Timestep", title_location = :left, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[2], X_Plot[:, 1], Y_Plot[1, :], Rho_Plot.', title =           "Total Pressure at Time Step = $Current_Timestep                                                      ", title_location = :right, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[4], X_Plot[:, 1], Y_Plot[1, :], Vorticity_Mod.', title =      "     Vorticity at Time Step = $Current_Timestep                                                      ", title_location = :right, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[6], X_Plot[:, 1], Y_Plot[1, :], Streamfunction_Mod.', title = "Streamfunction at Time Step = $Current_Timestep                                                      ", title_location = :right, titlefont = font(6), xtickfont = font(4), xticks = 0:100:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    xlims!(1, Nx)
    ylims!(1, Ny)
    gui()
  end

  # AUTOSAVE STEP
  if ((Autosave_Data_Incrementally == "Yes") && (mod(Cycle + 1, Autosave_Increment) == 1)) || ((Autosave_Data_Maximum_Iterations == "Yes") && (Cycle == Maximum_Iterations))

    # Input parameters
    Printer_Nx = Nx
    Printer_Ny = Ny
    Printer_Re = Re
    Printer_Inflow_Velocity = Inflow_Velocity
    Printer_Rho_Initial = Rho_Initial
    Printer_Maximum_Iterations = Maximum_Iterations
    Printer_Cycle_Plot = Cycle_Plot
    Printer_Force_Plot = Force_Plot
    Printer_Force_Plot_Crop = Force_Plot_Crop
    Printer_VorticityCrop = VorticityCrop
    Printer_StreamfunctionCrop = StreamfunctionCrop
    Printer_ArrowScaleFactor = ArrowScaleFactor
    Printer_Boundary_Walls = Boundary_Walls
    Printer_Square_Cylinder = Square_Cylinder
    Printer_Previous_Cycle_Plot = Previous_Cycle_Plot
    Printer_Current_Timestep = Current_Timestep

    # Calculated parameters
    Printer_Cylinder_Center_x = Cylinder_Center_x
    Printer_Cylinder_Center_y = Cylinder_Center_y
    Printer_Cylinder_Radius = Cylinder_Radius
    Printer_Nu = Nu
    Printer_Omega = Omega
    Printer_Cylinder = Cylinder
    Printer_Wall = Wall
    Printer_BBR_Indices_i = BBR_Indices_i
    Printer_BBR_Indices_j = BBR_Indices_j
    Printer_BBR_Indices = BBR_Indices

    # Output parameters
    Printer_f_INpart1 = f_IN[:, :, 1]
    Printer_f_INpart2 = f_IN[:, :, 2]
    Printer_f_INpart3 = f_IN[:, :, 3]
    Printer_f_INpart4 = f_IN[:, :, 4]
    Printer_f_INpart5 = f_IN[:, :, 5]
    Printer_f_INpart6 = f_IN[:, :, 6]
    Printer_f_INpart7 = f_IN[:, :, 7]
    Printer_f_INpart8 = f_IN[:, :, 8]
    Printer_f_INpart9 = f_IN[:, :, 9]
    Printer_f_EQpart1 = f_EQ[:, :, 1]
    Printer_f_EQpart2 = f_EQ[:, :, 2]
    Printer_f_EQpart3 = f_EQ[:, :, 3]
    Printer_f_EQpart4 = f_EQ[:, :, 4]
    Printer_f_EQpart5 = f_EQ[:, :, 5]
    Printer_f_EQpart6 = f_EQ[:, :, 6]
    Printer_f_EQpart7 = f_EQ[:, :, 7]
    Printer_f_EQpart8 = f_EQ[:, :, 8]
    Printer_f_EQpart9 = f_EQ[:, :, 9]
    Printer_f_OUTpart1 = f_OUT[:, :, 1]
    Printer_f_OUTpart2 = f_OUT[:, :, 2]
    Printer_f_OUTpart3 = f_OUT[:, :, 3]
    Printer_f_OUTpart4 = f_OUT[:, :, 4]
    Printer_f_OUTpart5 = f_OUT[:, :, 5]
    Printer_f_OUTpart6 = f_OUT[:, :, 6]
    Printer_f_OUTpart7 = f_OUT[:, :, 7]
    Printer_f_OUTpart8 = f_OUT[:, :, 8]
    Printer_f_OUTpart9 = f_OUT[:, :, 9]
    Printer_Ux = Ux
    Printer_Uy = Uy
    Printer_Rho = Rho
    Printer_X_Plot = X_Plot
    Printer_Y_Plot = Y_Plot
    Printer_Ut_Plot = Ut_Plot
    Printer_Ux_Plot = Ux_Plot
    Printer_Uy_Plot = Uy_Plot
    Printer_Rho_Plot = Rho_Plot
    Printer_Vorticity = Vorticity
    Printer_Vorticity_Mod = Vorticity_Mod
    Printer_DelUy_Delx = DelUy_Delx
    Printer_DelUx_Dely = DelUx_Dely
    Printer_Streamfunction = Streamfunction
    Printer_Streamfunction_Mod = Streamfunction_Mod
    Printer_IntUx_dy = IntUx_dy
    Printer_IntUy_dx = IntUy_dx
    Printer_C_IntUx_dy = C_IntUx_dy
    Printer_C_IntUy_dx = C_IntUy_dx
    Printer_Fx_Cylinder = Fx_Cylinder
    Printer_Fy_Cylinder = Fx_Cylinder
    Printer_Lift_Coefficient = Lift_Coefficient
    Printer_Drag_Coefficient = Drag_Coefficient

    # Data manipulation
    Printer_Input_Parameters = [Printer_Nx Printer_Ny Printer_Re Printer_Inflow_Velocity Printer_Rho_Initial Printer_Maximum_Iterations Printer_Cycle_Plot Printer_Force_Plot Printer_Force_Plot_Crop Printer_VorticityCrop Printer_StreamfunctionCrop Printer_ArrowScaleFactor Printer_Boundary_Walls Printer_Square_Cylinder Printer_Current_Timestep]
    Printer_f_INpart1 = reshape(Printer_f_INpart1, Printer_Nx*Printer_Ny)
    Printer_f_INpart2 = reshape(Printer_f_INpart2, Printer_Nx*Printer_Ny)
    Printer_f_INpart3 = reshape(Printer_f_INpart3, Printer_Nx*Printer_Ny)
    Printer_f_INpart4 = reshape(Printer_f_INpart4, Printer_Nx*Printer_Ny)
    Printer_f_INpart5 = reshape(Printer_f_INpart5, Printer_Nx*Printer_Ny)
    Printer_f_INpart6 = reshape(Printer_f_INpart6, Printer_Nx*Printer_Ny)
    Printer_f_INpart7 = reshape(Printer_f_INpart7, Printer_Nx*Printer_Ny)
    Printer_f_INpart8 = reshape(Printer_f_INpart8, Printer_Nx*Printer_Ny)
    Printer_f_INpart9 = reshape(Printer_f_INpart9, Printer_Nx*Printer_Ny)
    Printer_f_EQpart1 = reshape(Printer_f_EQpart1, Printer_Nx*Printer_Ny)
    Printer_f_EQpart2 = reshape(Printer_f_EQpart2, Printer_Nx*Printer_Ny)
    Printer_f_EQpart3 = reshape(Printer_f_EQpart3, Printer_Nx*Printer_Ny)
    Printer_f_EQpart4 = reshape(Printer_f_EQpart4, Printer_Nx*Printer_Ny)
    Printer_f_EQpart5 = reshape(Printer_f_EQpart5, Printer_Nx*Printer_Ny)
    Printer_f_EQpart6 = reshape(Printer_f_EQpart6, Printer_Nx*Printer_Ny)
    Printer_f_EQpart7 = reshape(Printer_f_EQpart7, Printer_Nx*Printer_Ny)
    Printer_f_EQpart8 = reshape(Printer_f_EQpart8, Printer_Nx*Printer_Ny)
    Printer_f_EQpart9 = reshape(Printer_f_EQpart9, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart1 = reshape(Printer_f_OUTpart1, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart2 = reshape(Printer_f_OUTpart2, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart3 = reshape(Printer_f_OUTpart3, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart4 = reshape(Printer_f_OUTpart4, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart5 = reshape(Printer_f_OUTpart5, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart6 = reshape(Printer_f_OUTpart6, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart7 = reshape(Printer_f_OUTpart7, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart8 = reshape(Printer_f_OUTpart8, Printer_Nx*Printer_Ny)
    Printer_f_OUTpart9 = reshape(Printer_f_OUTpart9, Printer_Nx*Printer_Ny)
    Printer_Ux = reshape(Printer_Ux, Printer_Nx*Printer_Ny)
    Printer_Uy = reshape(Printer_Uy, Printer_Nx*Printer_Ny)
    Printer_Rho = reshape(Printer_Rho, Printer_Nx*Printer_Ny)
    Printer_X_Plot = reshape(Printer_X_Plot, Printer_Nx*Printer_Ny)
    Printer_Y_Plot = reshape(Printer_Y_Plot, Printer_Nx*Printer_Ny)
    Printer_Ut_Plot = reshape(Printer_Ut_Plot, Printer_Nx*Printer_Ny)
    Printer_Ux_Plot = reshape(Printer_Ux_Plot, Printer_Nx*Printer_Ny)
    Printer_Uy_Plot = reshape(Printer_Uy_Plot, Printer_Nx*Printer_Ny)
    Printer_Rho_Plot = reshape(Printer_Rho_Plot, Printer_Nx*Printer_Ny)
    Printer_Vorticity = reshape(Printer_Vorticity, Printer_Nx*Printer_Ny)
    Printer_Vorticity_Mod = reshape(Printer_Vorticity_Mod, Printer_Nx*Printer_Ny)
    Printer_DelUy_Delx = reshape(Printer_DelUy_Delx, Printer_Nx*Printer_Ny)
    Printer_DelUx_Dely = reshape(Printer_DelUx_Dely, Printer_Nx*Printer_Ny)
    Printer_Streamfunction = reshape(Printer_Streamfunction, Printer_Nx*Printer_Ny)
    Printer_Streamfunction_Mod = reshape(Printer_Streamfunction_Mod, Printer_Nx*Printer_Ny)
    Printer_IntUx_dy = reshape(Printer_IntUx_dy, Printer_Nx*Printer_Ny)
    Printer_IntUy_dx = reshape(Printer_IntUy_dx, Printer_Nx*Printer_Ny)
    Printer_C_IntUx_dy = Printer_C_IntUx_dy.'

    # Data export
    Outfile_LBM_D2Q9_VKVCylinder_1 = "LBM D2Q9 VKV Cylinder - #1 INPUT PARAMETERS - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_1 = open(Outfile_LBM_D2Q9_VKVCylinder_1, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_1, "$Printer_Input_Parameters")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_1)

    Outfile_LBM_D2Q9_VKVCylinder_2part1 = "LBM D2Q9 VKV Cylinder - #2.1 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part1 = open(Outfile_LBM_D2Q9_VKVCylinder_2part1, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part1, "$Printer_f_INpart1")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part1)

    Outfile_LBM_D2Q9_VKVCylinder_2part2 = "LBM D2Q9 VKV Cylinder - #2.2 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part2 = open(Outfile_LBM_D2Q9_VKVCylinder_2part2, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part2, "$Printer_f_INpart2")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part2)

    Outfile_LBM_D2Q9_VKVCylinder_2part3 = "LBM D2Q9 VKV Cylinder - #2.3 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part3 = open(Outfile_LBM_D2Q9_VKVCylinder_2part3, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part3, "$Printer_f_INpart3")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part3)

    Outfile_LBM_D2Q9_VKVCylinder_2part4 = "LBM D2Q9 VKV Cylinder - #2.4 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part4 = open(Outfile_LBM_D2Q9_VKVCylinder_2part4, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part4, "$Printer_f_INpart4")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part4)

    Outfile_LBM_D2Q9_VKVCylinder_2part5 = "LBM D2Q9 VKV Cylinder - #2.5 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part5 = open(Outfile_LBM_D2Q9_VKVCylinder_2part5, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part5, "$Printer_f_INpart5")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part5)

    Outfile_LBM_D2Q9_VKVCylinder_2part6 = "LBM D2Q9 VKV Cylinder - #2.6 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part6 = open(Outfile_LBM_D2Q9_VKVCylinder_2part6, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part6, "$Printer_f_INpart6")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part6)

    Outfile_LBM_D2Q9_VKVCylinder_2part7 = "LBM D2Q9 VKV Cylinder - #2.7 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part7 = open(Outfile_LBM_D2Q9_VKVCylinder_2part7, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part7, "$Printer_f_INpart7")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part7)

    Outfile_LBM_D2Q9_VKVCylinder_2part8 = "LBM D2Q9 VKV Cylinder - #2.8 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part8 = open(Outfile_LBM_D2Q9_VKVCylinder_2part8, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part8, "$Printer_f_INpart8")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part8)

    Outfile_LBM_D2Q9_VKVCylinder_2part9 = "LBM D2Q9 VKV Cylinder - #2.9 f_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_2part9 = open(Outfile_LBM_D2Q9_VKVCylinder_2part9, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part9, "$Printer_f_INpart9")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_2part9)

    Outfile_LBM_D2Q9_VKVCylinder_3part1 = "LBM D2Q9 VKV Cylinder - #3.1 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part1 = open(Outfile_LBM_D2Q9_VKVCylinder_3part1, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part1, "$Printer_f_EQpart1")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part1)

    Outfile_LBM_D2Q9_VKVCylinder_3part2 = "LBM D2Q9 VKV Cylinder - #3.2 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part2 = open(Outfile_LBM_D2Q9_VKVCylinder_3part2, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part2, "$Printer_f_EQpart2")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part2)

    Outfile_LBM_D2Q9_VKVCylinder_3part3 = "LBM D2Q9 VKV Cylinder - #3.3 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part3 = open(Outfile_LBM_D2Q9_VKVCylinder_3part3, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part3, "$Printer_f_EQpart3")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part3)

    Outfile_LBM_D2Q9_VKVCylinder_3part4 = "LBM D2Q9 VKV Cylinder - #3.4 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part4 = open(Outfile_LBM_D2Q9_VKVCylinder_3part4, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part4, "$Printer_f_EQpart4")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part4)

    Outfile_LBM_D2Q9_VKVCylinder_3part5 = "LBM D2Q9 VKV Cylinder - #3.5 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part5 = open(Outfile_LBM_D2Q9_VKVCylinder_3part5, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part5, "$Printer_f_EQpart5")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part5)

    Outfile_LBM_D2Q9_VKVCylinder_3part6 = "LBM D2Q9 VKV Cylinder - #3.6 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part6 = open(Outfile_LBM_D2Q9_VKVCylinder_3part6, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part6, "$Printer_f_EQpart6")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part6)

    Outfile_LBM_D2Q9_VKVCylinder_3part7 = "LBM D2Q9 VKV Cylinder - #3.7 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part7 = open(Outfile_LBM_D2Q9_VKVCylinder_3part7, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part7, "$Printer_f_EQpart7")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part7)

    Outfile_LBM_D2Q9_VKVCylinder_3part8 = "LBM D2Q9 VKV Cylinder - #3.8 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part8 = open(Outfile_LBM_D2Q9_VKVCylinder_3part8, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part8, "$Printer_f_EQpart8")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part8)

    Outfile_LBM_D2Q9_VKVCylinder_3part9 = "LBM D2Q9 VKV Cylinder - #3.9 f_EQ - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_3part9 = open(Outfile_LBM_D2Q9_VKVCylinder_3part9, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part9, "$Printer_f_EQpart9")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_3part9)

    Outfile_LBM_D2Q9_VKVCylinder_4part1 = "LBM D2Q9 VKV Cylinder - #4.1 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part1 = open(Outfile_LBM_D2Q9_VKVCylinder_4part1, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part1, "$Printer_f_OUTpart1")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part1)

    Outfile_LBM_D2Q9_VKVCylinder_4part2 = "LBM D2Q9 VKV Cylinder - #4.2 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part2 = open(Outfile_LBM_D2Q9_VKVCylinder_4part2, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part2, "$Printer_f_OUTpart2")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part2)

    Outfile_LBM_D2Q9_VKVCylinder_4part3 = "LBM D2Q9 VKV Cylinder - #4.3 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part3 = open(Outfile_LBM_D2Q9_VKVCylinder_4part3, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part3, "$Printer_f_OUTpart3")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part3)

    Outfile_LBM_D2Q9_VKVCylinder_4part4 = "LBM D2Q9 VKV Cylinder - #4.4 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part4 = open(Outfile_LBM_D2Q9_VKVCylinder_4part4, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part4, "$Printer_f_OUTpart4")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part4)

    Outfile_LBM_D2Q9_VKVCylinder_4part5 = "LBM D2Q9 VKV Cylinder - #4.5 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part5 = open(Outfile_LBM_D2Q9_VKVCylinder_4part5, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part5, "$Printer_f_OUTpart5")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part5)

    Outfile_LBM_D2Q9_VKVCylinder_4part6 = "LBM D2Q9 VKV Cylinder - #4.6 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part6 = open(Outfile_LBM_D2Q9_VKVCylinder_4part6, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part6, "$Printer_f_OUTpart6")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part6)

    Outfile_LBM_D2Q9_VKVCylinder_4part7 = "LBM D2Q9 VKV Cylinder - #4.7 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part7 = open(Outfile_LBM_D2Q9_VKVCylinder_4part7, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part7, "$Printer_f_OUTpart7")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part7)

    Outfile_LBM_D2Q9_VKVCylinder_4part8 = "LBM D2Q9 VKV Cylinder - #4.8 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part8 = open(Outfile_LBM_D2Q9_VKVCylinder_4part8, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part8, "$Printer_f_OUTpart8")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part8)

    Outfile_LBM_D2Q9_VKVCylinder_4part9 = "LBM D2Q9 VKV Cylinder - #4.9 f_OUT - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_4part9 = open(Outfile_LBM_D2Q9_VKVCylinder_4part9, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part9, "$Printer_f_OUTpart9")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_4part9)

    Outfile_LBM_D2Q9_VKVCylinder_5 = "LBM D2Q9 VKV Cylinder - #5 Ux - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_5 = open(Outfile_LBM_D2Q9_VKVCylinder_5, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_5, "$Printer_Ux")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_5)

    Outfile_LBM_D2Q9_VKVCylinder_6 = "LBM D2Q9 VKV Cylinder - #6 Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_6 = open(Outfile_LBM_D2Q9_VKVCylinder_6, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_6, "$Printer_Uy")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_6)

    Outfile_LBM_D2Q9_VKVCylinder_7 = "LBM D2Q9 VKV Cylinder - #7 Rho - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_7 = open(Outfile_LBM_D2Q9_VKVCylinder_7, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_7, "$Printer_Rho")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_7)

    Outfile_LBM_D2Q9_VKVCylinder_8 = "LBM D2Q9 VKV Cylinder - #8 X_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_8 = open(Outfile_LBM_D2Q9_VKVCylinder_8, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_8, "$Printer_X_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_8)

    Outfile_LBM_D2Q9_VKVCylinder_9 = "LBM D2Q9 VKV Cylinder - #9 Y_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_9 = open(Outfile_LBM_D2Q9_VKVCylinder_9, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_9, "$Printer_Y_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_9)

    Outfile_LBM_D2Q9_VKVCylinder_10 = "LBM D2Q9 VKV Cylinder - #10 Ut_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_10 = open(Outfile_LBM_D2Q9_VKVCylinder_10, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_10, "$Printer_Ut_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_10)

    Outfile_LBM_D2Q9_VKVCylinder_11 = "LBM D2Q9 VKV Cylinder - #11 Ux_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_11 = open(Outfile_LBM_D2Q9_VKVCylinder_11, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_11, "$Printer_Ux_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_11)

    Outfile_LBM_D2Q9_VKVCylinder_12 = "LBM D2Q9 VKV Cylinder - #12 Uy_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_12 = open(Outfile_LBM_D2Q9_VKVCylinder_12, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_12, "$Printer_Uy_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_12)

    Outfile_LBM_D2Q9_VKVCylinder_13 = "LBM D2Q9 VKV Cylinder - #13 Rho_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_13 = open(Outfile_LBM_D2Q9_VKVCylinder_13, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_13, "$Printer_Rho_Plot")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_13)

    Outfile_LBM_D2Q9_VKVCylinder_14 = "LBM D2Q9 VKV Cylinder - #14 Vorticity - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_14 = open(Outfile_LBM_D2Q9_VKVCylinder_14, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_14, "$Printer_Vorticity")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_14)

    Outfile_LBM_D2Q9_VKVCylinder_15 = "LBM D2Q9 VKV Cylinder - #15 Vorticity MOD - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_15 = open(Outfile_LBM_D2Q9_VKVCylinder_15, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_15, "$Printer_Vorticity_Mod")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_15)

    Outfile_LBM_D2Q9_VKVCylinder_16 = "LBM D2Q9 VKV Cylinder - #16 DelUy_Delx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_16 = open(Outfile_LBM_D2Q9_VKVCylinder_16, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_16, "$Printer_DelUy_Delx")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_16)

    Outfile_LBM_D2Q9_VKVCylinder_17 = "LBM D2Q9 VKV Cylinder - #17 DelUx_Dely - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_17 = open(Outfile_LBM_D2Q9_VKVCylinder_17, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_17, "$Printer_DelUx_Dely")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_17)

    Outfile_LBM_D2Q9_VKVCylinder_18 = "LBM D2Q9 VKV Cylinder - #18 Streamfunction - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_18 = open(Outfile_LBM_D2Q9_VKVCylinder_18, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_18, "$Printer_Streamfunction")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_18)

    Outfile_LBM_D2Q9_VKVCylinder_19 = "LBM D2Q9 VKV Cylinder - #19 Streamfunction MOD - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_19 = open(Outfile_LBM_D2Q9_VKVCylinder_19, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_19, "$Printer_Streamfunction_Mod")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_19)

    Outfile_LBM_D2Q9_VKVCylinder_20 = "LBM D2Q9 VKV Cylinder - #20 IntUx_dy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_20 = open(Outfile_LBM_D2Q9_VKVCylinder_20, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_20, "$Printer_IntUx_dy")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_20)

    Outfile_LBM_D2Q9_VKVCylinder_21 = "LBM D2Q9 VKV Cylinder - #21 IntUy_dx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_21 = open(Outfile_LBM_D2Q9_VKVCylinder_21, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_21, "$Printer_IntUy_dx")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_21)

    Outfile_LBM_D2Q9_VKVCylinder_22 = "LBM D2Q9 VKV Cylinder - #22 C_IntUx_dy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_22 = open(Outfile_LBM_D2Q9_VKVCylinder_22, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_22, "$Printer_C_IntUx_dy")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_22)

    Outfile_LBM_D2Q9_VKVCylinder_23 = "LBM D2Q9 VKV Cylinder - #23 C_IntUy_dx - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_23 = open(Outfile_LBM_D2Q9_VKVCylinder_23, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_23, "$Printer_C_IntUy_dx")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_23)

    Outfile_LBM_D2Q9_VKVCylinder_24 = "LBM D2Q9 VKV Cylinder - #24 Fx Cylinder - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_24 = open(Outfile_LBM_D2Q9_VKVCylinder_24, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_24, "$Printer_Fx_Cylinder")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_24)

    Outfile_LBM_D2Q9_VKVCylinder_25 = "LBM D2Q9 VKV Cylinder - #25 Fy Cylinder - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_25 = open(Outfile_LBM_D2Q9_VKVCylinder_25, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_25, "$Printer_Fy_Cylinder")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_25)

    Outfile_LBM_D2Q9_VKVCylinder_26 = "LBM D2Q9 VKV Cylinder - #26 Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_26 = open(Outfile_LBM_D2Q9_VKVCylinder_26, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_26, "$Printer_Lift_Coefficient")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_26)

    Outfile_LBM_D2Q9_VKVCylinder_27 = "LBM D2Q9 VKV Cylinder - #27 Drag Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny - Re $Printer_Re .dat"
    Outfile_Opener_LBM_D2Q9_VKVCylinder_27 = open(Outfile_LBM_D2Q9_VKVCylinder_27, "w")
    show(Outfile_Opener_LBM_D2Q9_VKVCylinder_27, "$Printer_Drag_Coefficient")
    close(Outfile_Opener_LBM_D2Q9_VKVCylinder_27)
  end
end
toc()
Current_Timestep = Current_Timestep - 1
println(" ")
println("CALCULATION COMPLETE")
println("CALCULATION COMPLETE")
println("CALCULATION COMPLETE")
println(" ")
println("Reynolds Number = ", Re)
println("Mach Number = ", Inflow_Velocity*sqrt(3))
println("Knudsen Number = ", sqrt(pi/2)/(2*Omega*Cylinder_Radius))
println(" ")
println("Nu = ", Nu, " (Kinematic Viscosity)")
println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
println(" ")
println("Total Nodes = ", Nx*Ny)
println("Total Active Nodes = ", Nx*Ny - Int64(length(BBR_Indices)))
println(" ")

#
#
#
#
#
#
#
#
#
#

using Plots
plotly()
heatmap(title = "BLANK")
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Ux_Plot.', xlabel = "Nx", ylabel = "Ny", title = "x-Velocity at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Uy_Plot.', xlabel = "Nx", ylabel = "Ny", title = "y-Velocity at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Ut_Plot.', xlabel = "Nx", ylabel = "Ny", title = "Total Velocity at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Rho_Plot.'./3, xlabel = "Nx", ylabel = "Ny", title = "Pressure at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Vorticity_Mod.', xlabel = "Nx", ylabel = "Ny", title = "Vorticity at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1], Y_Plot[1, :], Streamfunction_Mod.', xlabel = "Nx", ylabel = "Ny", title = "Streamfunction at Time Step = $Current_Timestep", xticks = 0:100:Nx - 2, yticks = 0:50:Ny - 2, aspectratio = 3/4, color = :plasma)
quiver!(X_Plot_Resized, Y_Plot_Resized, quiver = (Ux_Plot_Resized, Uy_Plot_Resized), linecolour = :black)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
plot()
plot!((1:Current_Timestep).'.', Lift_Coefficient[1, 1:Current_Timestep])
plot!((1:Current_Timestep).'.', Drag_Coefficient[1, 1:Current_Timestep])
xlims!(0, Current_Timestep)
ylims!(-1, 3)
gui()

for i = Gx
  for j = Gy
    if BBR_Indices_i[i, j] > 0 && BBR_Indices_j[i, j] > 0
      Streamfunction[i, j] = NaN
    end
  end
end
Streamfunction[findin(Streamfunction, Streamfunction[Streamfunction .> (1/2*(maximum(Streamfunction) - minimum(Streamfunction)) + minimum(Streamfunction))])] = maximum(Streamfunction) - Streamfunction[findin(Streamfunction, Streamfunction[Streamfunction .> (1/2*(maximum(Streamfunction) - minimum(Streamfunction)) + minimum(Streamfunction))])]
Streamfunction[1, :] = NaN
Streamfunction[Nx, :] = NaN
Streamfunction[:, 1] = NaN
Streamfunction[:, Ny] = NaN
using Plots
plotly()
surface(X_Plot, Y_Plot, Streamfunction, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

#
#
#
#
#
#
#
#
#
#

# POST-PROCESSING
Lift_Coefficient_Mod = Lift_Coefficient[1, Current_Timestep - Force_Plot_Crop:Current_Timestep]
Drag_Coefficient_Mod = Drag_Coefficient[1, Current_Timestep - Force_Plot_Crop:Current_Timestep]
FFT_Lift = fft(Lift_Coefficient_Mod)
FFT_Drag = fft(Drag_Coefficient_Mod)
StP1_Lift = abs(FFT_Lift/length(Lift_Coefficient_Mod))
StP2_Lift = StP1_Lift[1:Int64(round(length(Lift_Coefficient_Mod)/2))]
StP2_Lift[2:end - 1] = 2*StP2_Lift[2:end - 1]
StP3_Lift = StP2_Lift
StP3_Lift[findin(StP3_Lift, StP3_Lift[StP3_Lift .< maximum(StP3_Lift)])] = 0
StP3_Lift_location = findfirst(StP3_Lift)
StP1_Drag = abs(FFT_Drag/length(Drag_Coefficient_Mod))
StP2_Drag = StP1_Drag[1:Int64(round(length(Drag_Coefficient_Mod)/2))]
StP2_Drag[2:end - 1] = 2*StP2_Drag[2:end - 1]
St_Frequency = 0:Int64(round(length(Lift_Coefficient_Mod)/2))
St_Frequency = St_Frequency.*Force_Plot./Int64(round(length(Lift_Coefficient_Mod)))
St_Frequency = St_Frequency*2*Cylinder_Radius/Inflow_Velocity
St = St_Frequency[StP3_Lift_location]

using Plots
plotly()
plot()
plot!(Drag_Coefficient_Mod, Lift_Coefficient_Mod)
xlims!(1, 2)
ylims!(-1, 1)
gui()

using Plots
plotly()
plot()
plot!(St_Frequency, StP2_Lift)
plot!(St_Frequency, StP2_Drag)
xlims!(0, 2)
ylims!(0, 2)
gui()

println(" ")
println("Strouhal Number = ", St)
println(" ")
println("Lift Coefficient")
println("Cl Minimum = ", minimum(Lift_Coefficient_Mod))
println("Cl Maximum = ", maximum(Lift_Coefficient_Mod))
println("Cl Mean = ", mean(Lift_Coefficient_Mod))
println("Cl Amplitude = ", maximum(Lift_Coefficient_Mod) - minimum(Lift_Coefficient_Mod))
println(" ")
println("Drag Coefficient")
println("Cd Minimum = ", minimum(Drag_Coefficient_Mod))
println("Cd Maximum = ", maximum(Drag_Coefficient_Mod))
println("Cd Mean = ", mean(Drag_Coefficient_Mod))
println("Cd Amplitude = ", maximum(Drag_Coefficient_Mod) - minimum(Drag_Coefficient_Mod))
println(" ")

####################################################################################################
####################################################################################################
####################################################################################################

#
#
#
#
#
#
#
#
#
#

####################################################################################################
####################################################################################################
####################################################################################################
