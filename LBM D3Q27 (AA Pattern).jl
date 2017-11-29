####################################################################################################
####################################################################################################
####################################################################################################

# 3D Lattice Boltzmann (BGK) Model
# D3Q27 Quadrature

####################################################################################################
####################################################################################################
####################################################################################################

# IS THIS A CONTINUATION OF AN EXISTING RUN ??? INPUT THE DATA TO READ
Restart_Calculation = "No" # Input as "Yes" or "No". If "Yes" no changes are required to the input parameters, these will be ignored. If "No", the following input parameters are required
Printer_Current_Timestep = 10000
Printer_Nx = 111
Printer_Ny = 37
Printer_Nz = 37
Printer_Re = 27.553
Printer_Ma = 0.1
Load_Title = "Sphere"

# INPUT PARAMETERS {NEEDS TO BE CONGRUENT WITH EXISTING RUN IF A CALCULATION IS RESTARTED}
Nx = 111 # Number of cells in the x-direction in units of 100 (should be an even number)
Ny = 37 # Number of cells in the y-direction in units of 100 (should be an even number)
Nz = 37 # Number of cells in the z-direction in units of 100 (should be an even number)
Re = 27.553 # Reynolds Number of the flow
Ma = 0.1 # Mach Number of the flow
Rho_Initial = 1 # Macroscopic density
Boundary_Walls = 0 # Set to 0 for no walls or set to 1 for walls at the upper and lower surface
Sphere_Cube_CircularCylinder_SquareCylinder = 1 # Set to 1 for sphere, 2 for cube, 3 for circular cylinder or 4 for square cylinder
Blockage_Ratio = 1/15

# ADDITIONAL REQUIREMENTS {REQUIRED FOR NEW OR EXISTING RUNS BUT DO NOT NEED TO BE CONGRUENT WITH EXISITING RUNS (FOR EXAMPLE A DIFFERENT COLLISION MODEL MAY BE USED)}
Double_Resolution = "Yes" # If set to "Yes", the above Nx, Ny and Nz will be doubled (set to "No" to maintain the above values)
Maximum_Iterations = 10000 # Total number of iterations (TIME STEP)
Cycle_Plot = 1000 # Cycle evaluated for plotting at this increment of cycles
Force_Plot = 5 # Force evaluated for plotting at this increment of cycles
Force_Plot_Crop = 0 # This integer to the maximum iterations is what will be accounted for during post-processing (prior to this is spooling up time)
Pressure_Outlet_Tangential_Velocities = "No" # Set to "Yes" or "No" to modify the inclusion or exclusion of the normal velocities (Uy and Uz) at the pressure outlet
QCriterionCrop = 1e-6 # Crops the Q-Criterion values below this value of the Q-Criterion for better visualisation
DeltaCriterionCrop = 1e-6 # Crops the Delta-Criterion values below this value of the Q-Criterion for better visualisation
Lambda2CriterionCrop = 1e-6 # Crops the Lambda2-Criterion values below this value of the Q-Criterion for better visualisation
Criterion_OpenViewer = "No" # Splits the Q-Criterion / Delta-Criterion / Lambda2-Criterion scatter plot in half to reveal more of the internal structure. Set to "Yes" or "No"
Display_Contours = "Velocity" # Set to "Criterion", "Velocity" or "Pressure" to display the respective contours on 3D plots
Criterion_VisualCrop = 1/2
Graphics_Threshold = 100000 # Maximum possible Q-Criterion / Delta-Criterion / Lambda2-Criterion markers to be plotted
Autosave_Data_Maximum_Iterations = "No" # Set to "Yes" or "No" to save the data at the end of the run
Autosave_Data_Incrementally = "No" # Set to "Yes" or "No" to save data at the following increments
Autosave_Increment = 10000
Autosave_Title = "Sphere"
Ramp_Up_Test = "No" # Set to "Yes" or "No" to ramp up the Reynolds number with time
Ramp_Up_Initial = 10000 # Beyond this cycle value, the Reynolds number will begin to increase
Ramp_Up_Increment = 0.0 # Increment of increase for ramp up testing. Increase is linear once the ramp up initial time is surpassed
Collision_Model = "Cumulant_LBM" # Valid inputs are "SRT_LBM", "TRT_LBM", "MRT_LBM", "CMRT_LBM", "Cumulant_LBM". Ensure the following relaxation times are adjusted accordingly as these may be changed upon starting a new run or using an existing run (Note this only applies for models using more than one relaxation time)
# TRT LBM input variable
TRT_Magic_Number = 1/4 # Set to 1/4 for best stability and solution for the steady-state case dependant only on the equilibrium function, 1/12 for no third order error (best advection), 1/6 for no fourth order error (best diffusion), or 3/16 for exact location of bounce-back walls for the Poiseuille flow
# MRT LBM input variables
MRT_Omega = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
# Cascaded MRT LBM input variables
CMRT_Omega = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
Factorized_Cascaded_Model = "No" # Factorized model similar to the Cumulant LBM kernel
CMRT_First_Order_Velocity_Derivatives = 1 # Set to 1 to include second order velocity derivatives or 0 to exclude
# Cumulant LBM input variables
Cumulant_Omega = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
Optimized_Cumulant_Model = "No" # If set to yes, the above Omega values (2, 3, 4, 5) will be replaced by the optimized values for fourth order accurate diffusion. It is assumed that a bulk viscosity of 1.0 is acceptable, hence the range for shear viscosity should be 7/4 < Omega < 2. If this is not achieveable, the optimized rates may not be used, or a different bulk viscosity will need to be explored and modified
Cumulant_First_Order_Velocity_Derivatives = 1 # Set to 1 to include second order velocity derivatives or 0 to exclude
Cumulant_Second_Order_Velocity_Derivatives = 1 # Set to 1 to include second order velocity derivatives or 0 to exclude. Note that when the viscosity is small (Omega approaches 2), these derivatives are large and are therefore likely to cause instability, hence only use for highly accurate low velocity calculations

# Note: for stability the following must occur:
  # Inflow velocity less than 0.1
  # Kinematic viscosity (Nu) less than 0.2
  # Relaxation parameter (Omega) less than 2

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

# LOGIC CHECKS
if Cumulant_Second_Order_Velocity_Derivatives == 1
  Cumulant_First_Order_Velocity_Derivatives = 1
end
if isodd.(Nx)
  Nx = Nx + 1
end
if isodd.(Ny)
  Ny = Ny + 1
end
if isodd.(Nz)
  Nz = Nz + 1
end

####################################################################################################
####################################################################################################
####################################################################################################

# IMPORT AND MANIPULATION
Previous_Current_Timestep = 0
Previous_Cycle_Plot = 0
if Restart_Calculation == "Yes"
  println(" ")
  println("LOADING DATA")
  println("LOADING DATA")
  println("LOADING DATA")
  println(" ")
  Printer_Nx_Mod = Printer_Nx + 2 # Added 2 for the boundary nodes
  Printer_Ny_Mod = Printer_Ny + 2 # Added 2 for the boundary nodes
  Printer_Nz_Mod = Printer_Nz + 2 # Added 2 for the boundary nodes

  Import_Data_1 = readstring("LBM D3Q27 $Load_Title - #1 INPUT PARAMETERS - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_2 = readstring("LBM D3Q27 $Load_Title - #2 Fx Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_3 = readstring("LBM D3Q27 $Load_Title - #3 Fy Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_4 = readstring("LBM D3Q27 $Load_Title - #4 Fz Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_5 = readstring("LBM D3Q27 $Load_Title - #5 Drag Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_6 = readstring("LBM D3Q27 $Load_Title - #6 Y-Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
  Import_Data_7 = readstring("LBM D3Q27 $Load_Title - #7 Z-Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")

  Import_Data_1 = Import_Data_1[1 + 2: end - 2]; Import_Data_1 = replace(Import_Data_1, " ", ","); Import_Data_1 = include_string(Import_Data_1); Import_Data_1 = collect(Import_Data_1); Import_Data_1 = Import_Data_1.';
  Import_Data_2 = Import_Data_2[1 + 2: end - 2]; Import_Data_2 = replace(Import_Data_2, " ", ","); Import_Data_2 = include_string(Import_Data_2); Import_Data_2 = collect(Import_Data_2);
  Import_Data_3 = Import_Data_3[1 + 2: end - 2]; Import_Data_3 = replace(Import_Data_3, " ", ","); Import_Data_3 = include_string(Import_Data_3); Import_Data_3 = collect(Import_Data_3);
  Import_Data_4 = Import_Data_4[1 + 2: end - 2]; Import_Data_4 = replace(Import_Data_4, " ", ","); Import_Data_4 = include_string(Import_Data_4); Import_Data_4 = collect(Import_Data_4);
  Import_Data_5 = Import_Data_5[1 + 2: end - 2]; Import_Data_5 = replace(Import_Data_5, " ", ","); Import_Data_5 = include_string(Import_Data_5); Import_Data_5 = collect(Import_Data_5);
  Import_Data_6 = Import_Data_6[1 + 2: end - 2]; Import_Data_6 = replace(Import_Data_6, " ", ","); Import_Data_6 = include_string(Import_Data_6); Import_Data_6 = collect(Import_Data_6);
  Import_Data_7 = Import_Data_7[1 + 2: end - 2]; Import_Data_7 = replace(Import_Data_7, " ", ","); Import_Data_7 = include_string(Import_Data_7); Import_Data_7 = collect(Import_Data_7);

  # INPUT PARAMETERS
  Nx = Int64(Import_Data_1[1] + 2) # Number of cells in the x-direction
  Ny = Int64(Import_Data_1[2] + 2) # Number of cells in the y-direction
  Nz = Int64(Import_Data_1[3] + 2) # Number of cells in the y-direction
  #Re = Import_Data_1[4] # Reynolds Number of the flow
  Ma = Import_Data_1[5] # Mach Number of the flow
  Rho_Initial = Import_Data_1[6]
  Previous_Maximum_Iterations = Int64(Import_Data_1[7]) # Total number of iterations (TIME STEP)
  Previous_Cycle_Plot = Int64(Import_Data_1[8]) # Cycle evaluated for plotting at this increment of cycles
  Previous_Force_Plot = Int64(Import_Data_1[9]) # Force evaluated for plotting at this increment of cycles
  Previous_Force_Plot_Crop = Int64(Import_Data_1[10]) # This integer to the maximum iterations is what will be accounted for during post-processing (prior to this is spooling up time)
  Previous_QCriterionCrop = Import_Data_1[11]
  Previous_DeltaCriterionCrop = Import_Data_1[12]
  Previous_Lambda2CriterionCrop = Import_Data_1[13]
  Boundary_Walls = Int64(Import_Data_1[14]) # Set to 0 for no walls or set to 1 for walls at the upper and lower surface
  Sphere_Cube_CircularCylinder_SquareCylinder = Int64(Import_Data_1[15])
  Previous_Current_Timestep = Int64(Import_Data_1[16])

  Temp_f01 = zeros(Nx, Ny, Nz)
  Temp_f02 = zeros(Nx, Ny, Nz)
  Temp_f03 = zeros(Nx, Ny, Nz)
  Temp_f04 = zeros(Nx, Ny, Nz)
  Temp_f05 = zeros(Nx, Ny, Nz)
  Temp_f06 = zeros(Nx, Ny, Nz)
  Temp_f07 = zeros(Nx, Ny, Nz)
  Temp_f08 = zeros(Nx, Ny, Nz)
  Temp_f09 = zeros(Nx, Ny, Nz)
  Temp_f10 = zeros(Nx, Ny, Nz)
  Temp_f11 = zeros(Nx, Ny, Nz)
  Temp_f12 = zeros(Nx, Ny, Nz)
  Temp_f13 = zeros(Nx, Ny, Nz)
  Temp_f14 = zeros(Nx, Ny, Nz)
  Temp_f15 = zeros(Nx, Ny, Nz)
  Temp_f16 = zeros(Nx, Ny, Nz)
  Temp_f17 = zeros(Nx, Ny, Nz)
  Temp_f18 = zeros(Nx, Ny, Nz)
  Temp_f19 = zeros(Nx, Ny, Nz)
  Temp_f20 = zeros(Nx, Ny, Nz)
  Temp_f21 = zeros(Nx, Ny, Nz)
  Temp_f22 = zeros(Nx, Ny, Nz)
  Temp_f23 = zeros(Nx, Ny, Nz)
  Temp_f24 = zeros(Nx, Ny, Nz)
  Temp_f25 = zeros(Nx, Ny, Nz)
  Temp_f26 = zeros(Nx, Ny, Nz)
  Temp_f27 = zeros(Nx, Ny, Nz)
  Temp_Ux = zeros(Nx, Ny, Nz)
  Temp_Uy = zeros(Nx, Ny, Nz)
  Temp_Uz = zeros(Nx, Ny, Nz)
  Temp_Rho = zeros(Nx, Ny, Nz)
  Temp_X_Plot = zeros(Nx, Ny, Nz)
  Temp_Y_Plot = zeros(Nx, Ny, Nz)
  Temp_Z_Plot = zeros(Nx, Ny, Nz)
  Temp_Ut_Plot = zeros(Nx, Ny, Nz)
  Temp_Ux_Plot = zeros(Nx, Ny, Nz)
  Temp_Uy_Plot = zeros(Nx, Ny, Nz)
  Temp_Uz_Plot = zeros(Nx, Ny, Nz)
  Temp_Rho_Plot = zeros(Nx, Ny, Nz)
  Temp_QCriterion = zeros(Nx, Ny, Nz)
  Temp_DeltaCriterion = zeros(Nx, Ny, Nz)
  Temp_Lambda2Criterion = zeros(Nx, Ny, Nz)
  Temp_QCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
  Temp_DeltaCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
  Temp_Lambda2Criterion_Mod2DPlotter = zeros(Nx, Ny, Nz)

  # INPUT MATRICES
  for k = 1:Printer_Nz_Mod
    println("Loading pane ", k, " of ", Nz)

    Import_Data_8 = readstring("LBM D3Q27 $Load_Title - #8 (Part $k of $Printer_Nz_Mod) f01_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_9 = readstring("LBM D3Q27 $Load_Title - #9 (Part $k of $Printer_Nz_Mod) f02_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_10 = readstring("LBM D3Q27 $Load_Title - #10 (Part $k of $Printer_Nz_Mod) f03_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_11 = readstring("LBM D3Q27 $Load_Title - #11 (Part $k of $Printer_Nz_Mod) f04_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_12 = readstring("LBM D3Q27 $Load_Title - #12 (Part $k of $Printer_Nz_Mod) f05_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_13 = readstring("LBM D3Q27 $Load_Title - #13 (Part $k of $Printer_Nz_Mod) f06_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_14 = readstring("LBM D3Q27 $Load_Title - #14 (Part $k of $Printer_Nz_Mod) f07_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_15 = readstring("LBM D3Q27 $Load_Title - #15 (Part $k of $Printer_Nz_Mod) f08_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_16 = readstring("LBM D3Q27 $Load_Title - #16 (Part $k of $Printer_Nz_Mod) f09_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_17 = readstring("LBM D3Q27 $Load_Title - #17 (Part $k of $Printer_Nz_Mod) f10_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_18 = readstring("LBM D3Q27 $Load_Title - #18 (Part $k of $Printer_Nz_Mod) f11_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_19 = readstring("LBM D3Q27 $Load_Title - #19 (Part $k of $Printer_Nz_Mod) f12_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_20 = readstring("LBM D3Q27 $Load_Title - #20 (Part $k of $Printer_Nz_Mod) f13_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_21 = readstring("LBM D3Q27 $Load_Title - #21 (Part $k of $Printer_Nz_Mod) f14_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_22 = readstring("LBM D3Q27 $Load_Title - #22 (Part $k of $Printer_Nz_Mod) f15_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_23 = readstring("LBM D3Q27 $Load_Title - #23 (Part $k of $Printer_Nz_Mod) f16_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_24 = readstring("LBM D3Q27 $Load_Title - #24 (Part $k of $Printer_Nz_Mod) f17_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_25 = readstring("LBM D3Q27 $Load_Title - #25 (Part $k of $Printer_Nz_Mod) f18_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_26 = readstring("LBM D3Q27 $Load_Title - #26 (Part $k of $Printer_Nz_Mod) f19_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_27 = readstring("LBM D3Q27 $Load_Title - #27 (Part $k of $Printer_Nz_Mod) f20_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_28 = readstring("LBM D3Q27 $Load_Title - #28 (Part $k of $Printer_Nz_Mod) f21_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_29 = readstring("LBM D3Q27 $Load_Title - #29 (Part $k of $Printer_Nz_Mod) f22_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_30 = readstring("LBM D3Q27 $Load_Title - #30 (Part $k of $Printer_Nz_Mod) f23_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_31 = readstring("LBM D3Q27 $Load_Title - #31 (Part $k of $Printer_Nz_Mod) f24_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_32 = readstring("LBM D3Q27 $Load_Title - #32 (Part $k of $Printer_Nz_Mod) f25_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_33 = readstring("LBM D3Q27 $Load_Title - #33 (Part $k of $Printer_Nz_Mod) f26_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_34 = readstring("LBM D3Q27 $Load_Title - #34 (Part $k of $Printer_Nz_Mod) f27_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_35 = readstring("LBM D3Q27 $Load_Title - #35 (Part $k of $Printer_Nz_Mod) Ux - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_36 = readstring("LBM D3Q27 $Load_Title - #36 (Part $k of $Printer_Nz_Mod) Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_37 = readstring("LBM D3Q27 $Load_Title - #37 (Part $k of $Printer_Nz_Mod) Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_38 = readstring("LBM D3Q27 $Load_Title - #38 (Part $k of $Printer_Nz_Mod) Rho - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_39 = readstring("LBM D3Q27 $Load_Title - #39 (Part $k of $Printer_Nz_Mod) X_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_40 = readstring("LBM D3Q27 $Load_Title - #40 (Part $k of $Printer_Nz_Mod) Y_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_41 = readstring("LBM D3Q27 $Load_Title - #41 (Part $k of $Printer_Nz_Mod) Z_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_42 = readstring("LBM D3Q27 $Load_Title - #42 (Part $k of $Printer_Nz_Mod) Ut_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_43 = readstring("LBM D3Q27 $Load_Title - #43 (Part $k of $Printer_Nz_Mod) Ux_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_44 = readstring("LBM D3Q27 $Load_Title - #44 (Part $k of $Printer_Nz_Mod) Uy_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_45 = readstring("LBM D3Q27 $Load_Title - #45 (Part $k of $Printer_Nz_Mod) Uz_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_46 = readstring("LBM D3Q27 $Load_Title - #46 (Part $k of $Printer_Nz_Mod) Rho_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_47 = readstring("LBM D3Q27 $Load_Title - #47 (Part $k of $Printer_Nz_Mod) Q-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_48 = readstring("LBM D3Q27 $Load_Title - #48 (Part $k of $Printer_Nz_Mod) Delta-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_49 = readstring("LBM D3Q27 $Load_Title - #49 (Part $k of $Printer_Nz_Mod) Lambda2-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_50 = readstring("LBM D3Q27 $Load_Title - #50 (Part $k of $Printer_Nz_Mod) Q-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_51 = readstring("LBM D3Q27 $Load_Title - #51 (Part $k of $Printer_Nz_Mod) Delta-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")
    Import_Data_52 = readstring("LBM D3Q27 $Load_Title - #52 (Part $k of $Printer_Nz_Mod) Lambda2-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat")

    Import_Data_8 = Import_Data_8[1 + 2: end - 2]; Import_Data_8 = replace(Import_Data_8, " ", ","); Import_Data_8 = include_string(Import_Data_8); Import_Data_8 = collect(Import_Data_8); Import_Data_8 = Import_Data_8.'; Import_Data_8 = reshape(Import_Data_8, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_9 = Import_Data_9[1 + 2: end - 2]; Import_Data_9 = replace(Import_Data_9, " ", ","); Import_Data_9 = include_string(Import_Data_9); Import_Data_9 = collect(Import_Data_9); Import_Data_9 = Import_Data_9.'; Import_Data_9 = reshape(Import_Data_9, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_10 = Import_Data_10[1 + 2: end - 2]; Import_Data_10 = replace(Import_Data_10, " ", ","); Import_Data_10 = include_string(Import_Data_10); Import_Data_10 = collect(Import_Data_10); Import_Data_10 = Import_Data_10.'; Import_Data_10 = reshape(Import_Data_10, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_11 = Import_Data_11[1 + 2: end - 2]; Import_Data_11 = replace(Import_Data_11, " ", ","); Import_Data_11 = include_string(Import_Data_11); Import_Data_11 = collect(Import_Data_11); Import_Data_11 = Import_Data_11.'; Import_Data_11 = reshape(Import_Data_11, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_12 = Import_Data_12[1 + 2: end - 2]; Import_Data_12 = replace(Import_Data_12, " ", ","); Import_Data_12 = include_string(Import_Data_12); Import_Data_12 = collect(Import_Data_12); Import_Data_12 = Import_Data_12.'; Import_Data_12 = reshape(Import_Data_12, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_13 = Import_Data_13[1 + 2: end - 2]; Import_Data_13 = replace(Import_Data_13, " ", ","); Import_Data_13 = include_string(Import_Data_13); Import_Data_13 = collect(Import_Data_13); Import_Data_13 = Import_Data_13.'; Import_Data_13 = reshape(Import_Data_13, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_14 = Import_Data_14[1 + 2: end - 2]; Import_Data_14 = replace(Import_Data_14, " ", ","); Import_Data_14 = include_string(Import_Data_14); Import_Data_14 = collect(Import_Data_14); Import_Data_14 = Import_Data_14.'; Import_Data_14 = reshape(Import_Data_14, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_15 = Import_Data_15[1 + 2: end - 2]; Import_Data_15 = replace(Import_Data_15, " ", ","); Import_Data_15 = include_string(Import_Data_15); Import_Data_15 = collect(Import_Data_15); Import_Data_15 = Import_Data_15.'; Import_Data_15 = reshape(Import_Data_15, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_16 = Import_Data_16[1 + 2: end - 2]; Import_Data_16 = replace(Import_Data_16, " ", ","); Import_Data_16 = include_string(Import_Data_16); Import_Data_16 = collect(Import_Data_16); Import_Data_16 = Import_Data_16.'; Import_Data_16 = reshape(Import_Data_16, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_17 = Import_Data_17[1 + 2: end - 2]; Import_Data_17 = replace(Import_Data_17, " ", ","); Import_Data_17 = include_string(Import_Data_17); Import_Data_17 = collect(Import_Data_17); Import_Data_17 = Import_Data_17.'; Import_Data_17 = reshape(Import_Data_17, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_18 = Import_Data_18[1 + 2: end - 2]; Import_Data_18 = replace(Import_Data_18, " ", ","); Import_Data_18 = include_string(Import_Data_18); Import_Data_18 = collect(Import_Data_18); Import_Data_18 = Import_Data_18.'; Import_Data_18 = reshape(Import_Data_18, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_19 = Import_Data_19[1 + 2: end - 2]; Import_Data_19 = replace(Import_Data_19, " ", ","); Import_Data_19 = include_string(Import_Data_19); Import_Data_19 = collect(Import_Data_19); Import_Data_19 = Import_Data_19.'; Import_Data_19 = reshape(Import_Data_19, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_20 = Import_Data_20[1 + 2: end - 2]; Import_Data_20 = replace(Import_Data_20, " ", ","); Import_Data_20 = include_string(Import_Data_20); Import_Data_20 = collect(Import_Data_20); Import_Data_20 = Import_Data_20.'; Import_Data_20 = reshape(Import_Data_20, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_21 = Import_Data_21[1 + 2: end - 2]; Import_Data_21 = replace(Import_Data_21, " ", ","); Import_Data_21 = include_string(Import_Data_21); Import_Data_21 = collect(Import_Data_21); Import_Data_21 = Import_Data_21.'; Import_Data_21 = reshape(Import_Data_21, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_22 = Import_Data_22[1 + 2: end - 2]; Import_Data_22 = replace(Import_Data_22, " ", ","); Import_Data_22 = include_string(Import_Data_22); Import_Data_22 = collect(Import_Data_22); Import_Data_22 = Import_Data_22.'; Import_Data_22 = reshape(Import_Data_22, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_23 = Import_Data_23[1 + 2: end - 2]; Import_Data_23 = replace(Import_Data_23, " ", ","); Import_Data_23 = include_string(Import_Data_23); Import_Data_23 = collect(Import_Data_23); Import_Data_23 = Import_Data_23.'; Import_Data_23 = reshape(Import_Data_23, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_24 = Import_Data_24[1 + 2: end - 2]; Import_Data_24 = replace(Import_Data_24, " ", ","); Import_Data_24 = include_string(Import_Data_24); Import_Data_24 = collect(Import_Data_24); Import_Data_24 = Import_Data_24.'; Import_Data_24 = reshape(Import_Data_24, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_25 = Import_Data_25[1 + 2: end - 2]; Import_Data_25 = replace(Import_Data_25, " ", ","); Import_Data_25 = include_string(Import_Data_25); Import_Data_25 = collect(Import_Data_25); Import_Data_25 = Import_Data_25.'; Import_Data_25 = reshape(Import_Data_25, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_26 = Import_Data_26[1 + 2: end - 2]; Import_Data_26 = replace(Import_Data_26, " ", ","); Import_Data_26 = include_string(Import_Data_26); Import_Data_26 = collect(Import_Data_26); Import_Data_26 = Import_Data_26.'; Import_Data_26 = reshape(Import_Data_26, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_27 = Import_Data_27[1 + 2: end - 2]; Import_Data_27 = replace(Import_Data_27, " ", ","); Import_Data_27 = include_string(Import_Data_27); Import_Data_27 = collect(Import_Data_27); Import_Data_27 = Import_Data_27.'; Import_Data_27 = reshape(Import_Data_27, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_28 = Import_Data_28[1 + 2: end - 2]; Import_Data_28 = replace(Import_Data_28, " ", ","); Import_Data_28 = include_string(Import_Data_28); Import_Data_28 = collect(Import_Data_28); Import_Data_28 = Import_Data_28.'; Import_Data_28 = reshape(Import_Data_28, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_29 = Import_Data_29[1 + 2: end - 2]; Import_Data_29 = replace(Import_Data_29, " ", ","); Import_Data_29 = include_string(Import_Data_29); Import_Data_29 = collect(Import_Data_29); Import_Data_29 = Import_Data_29.'; Import_Data_29 = reshape(Import_Data_29, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_30 = Import_Data_30[1 + 2: end - 2]; Import_Data_30 = replace(Import_Data_30, " ", ","); Import_Data_30 = include_string(Import_Data_30); Import_Data_30 = collect(Import_Data_30); Import_Data_30 = Import_Data_30.'; Import_Data_30 = reshape(Import_Data_30, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_31 = Import_Data_31[1 + 2: end - 2]; Import_Data_31 = replace(Import_Data_31, " ", ","); Import_Data_31 = include_string(Import_Data_31); Import_Data_31 = collect(Import_Data_31); Import_Data_31 = Import_Data_31.'; Import_Data_31 = reshape(Import_Data_31, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_32 = Import_Data_32[1 + 2: end - 2]; Import_Data_32 = replace(Import_Data_32, " ", ","); Import_Data_32 = include_string(Import_Data_32); Import_Data_32 = collect(Import_Data_32); Import_Data_32 = Import_Data_32.'; Import_Data_32 = reshape(Import_Data_32, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_33 = Import_Data_33[1 + 2: end - 2]; Import_Data_33 = replace(Import_Data_33, " ", ","); Import_Data_33 = include_string(Import_Data_33); Import_Data_33 = collect(Import_Data_33); Import_Data_33 = Import_Data_33.'; Import_Data_33 = reshape(Import_Data_33, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_34 = Import_Data_34[1 + 2: end - 2]; Import_Data_34 = replace(Import_Data_34, " ", ","); Import_Data_34 = include_string(Import_Data_34); Import_Data_34 = collect(Import_Data_34); Import_Data_34 = Import_Data_34.'; Import_Data_34 = reshape(Import_Data_34, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_35 = Import_Data_35[1 + 2: end - 2]; Import_Data_35 = replace(Import_Data_35, " ", ","); Import_Data_35 = include_string(Import_Data_35); Import_Data_35 = collect(Import_Data_35); Import_Data_35 = Import_Data_35.'; Import_Data_35 = reshape(Import_Data_35, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_36 = Import_Data_36[1 + 2: end - 2]; Import_Data_36 = replace(Import_Data_36, " ", ","); Import_Data_36 = include_string(Import_Data_36); Import_Data_36 = collect(Import_Data_36); Import_Data_36 = Import_Data_36.'; Import_Data_36 = reshape(Import_Data_36, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_37 = Import_Data_37[1 + 2: end - 2]; Import_Data_37 = replace(Import_Data_37, " ", ","); Import_Data_37 = include_string(Import_Data_37); Import_Data_37 = collect(Import_Data_37); Import_Data_37 = Import_Data_37.'; Import_Data_37 = reshape(Import_Data_37, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_38 = Import_Data_38[1 + 2: end - 2]; Import_Data_38 = replace(Import_Data_38, " ", ","); Import_Data_38 = include_string(Import_Data_38); Import_Data_38 = collect(Import_Data_38); Import_Data_38 = Import_Data_38.'; Import_Data_38 = reshape(Import_Data_38, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_39 = Import_Data_39[1 + 2: end - 2]; Import_Data_39 = replace(Import_Data_39, " ", ","); Import_Data_39 = include_string(Import_Data_39); Import_Data_39 = collect(Import_Data_39); Import_Data_39 = Import_Data_39.'; Import_Data_39 = reshape(Import_Data_39, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_40 = Import_Data_40[1 + 2: end - 2]; Import_Data_40 = replace(Import_Data_40, " ", ","); Import_Data_40 = include_string(Import_Data_40); Import_Data_40 = collect(Import_Data_40); Import_Data_40 = Import_Data_40.'; Import_Data_40 = reshape(Import_Data_40, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_41 = Import_Data_41[1 + 2: end - 2]; Import_Data_41 = replace(Import_Data_41, " ", ","); Import_Data_41 = include_string(Import_Data_41); Import_Data_41 = collect(Import_Data_41); Import_Data_41 = Import_Data_41.'; Import_Data_41 = reshape(Import_Data_41, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_42 = Import_Data_42[1 + 2: end - 2]; Import_Data_42 = replace(Import_Data_42, " ", ","); Import_Data_42 = include_string(Import_Data_42); Import_Data_42 = collect(Import_Data_42); Import_Data_42 = Import_Data_42.'; Import_Data_42 = reshape(Import_Data_42, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_43 = Import_Data_43[1 + 2: end - 2]; Import_Data_43 = replace(Import_Data_43, " ", ","); Import_Data_43 = include_string(Import_Data_43); Import_Data_43 = collect(Import_Data_43); Import_Data_43 = Import_Data_43.'; Import_Data_43 = reshape(Import_Data_43, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_44 = Import_Data_44[1 + 2: end - 2]; Import_Data_44 = replace(Import_Data_44, " ", ","); Import_Data_44 = include_string(Import_Data_44); Import_Data_44 = collect(Import_Data_44); Import_Data_44 = Import_Data_44.'; Import_Data_44 = reshape(Import_Data_44, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_45 = Import_Data_45[1 + 2: end - 2]; Import_Data_45 = replace(Import_Data_45, " ", ","); Import_Data_45 = include_string(Import_Data_45); Import_Data_45 = collect(Import_Data_45); Import_Data_45 = Import_Data_45.'; Import_Data_45 = reshape(Import_Data_45, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_46 = Import_Data_46[1 + 2: end - 2]; Import_Data_46 = replace(Import_Data_46, " ", ","); Import_Data_46 = include_string(Import_Data_46); Import_Data_46 = collect(Import_Data_46); Import_Data_46 = Import_Data_46.'; Import_Data_46 = reshape(Import_Data_46, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_47 = Import_Data_47[1 + 2: end - 2]; Import_Data_47 = replace(Import_Data_47, " ", ","); Import_Data_47 = include_string(Import_Data_47); Import_Data_47 = collect(Import_Data_47); Import_Data_47 = Import_Data_47.'; Import_Data_47 = reshape(Import_Data_47, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_48 = Import_Data_48[1 + 2: end - 2]; Import_Data_48 = replace(Import_Data_48, " ", ","); Import_Data_48 = include_string(Import_Data_48); Import_Data_48 = collect(Import_Data_48); Import_Data_48 = Import_Data_48.'; Import_Data_48 = reshape(Import_Data_48, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_49 = Import_Data_49[1 + 2: end - 2]; Import_Data_49 = replace(Import_Data_49, " ", ","); Import_Data_49 = include_string(Import_Data_49); Import_Data_49 = collect(Import_Data_49); Import_Data_49 = Import_Data_49.'; Import_Data_49 = reshape(Import_Data_49, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_50 = Import_Data_50[1 + 2: end - 2]; Import_Data_50 = replace(Import_Data_50, " ", ","); Import_Data_50 = include_string(Import_Data_50); Import_Data_50 = collect(Import_Data_50); Import_Data_50 = Import_Data_50.'; Import_Data_50 = reshape(Import_Data_50, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_51 = Import_Data_51[1 + 2: end - 2]; Import_Data_51 = replace(Import_Data_51, " ", ","); Import_Data_51 = include_string(Import_Data_51); Import_Data_51 = collect(Import_Data_51); Import_Data_51 = Import_Data_51.'; Import_Data_51 = reshape(Import_Data_51, Printer_Nx_Mod, Printer_Ny_Mod)
    Import_Data_52 = Import_Data_52[1 + 2: end - 2]; Import_Data_52 = replace(Import_Data_52, " ", ","); Import_Data_52 = include_string(Import_Data_52); Import_Data_52 = collect(Import_Data_52); Import_Data_52 = Import_Data_52.'; Import_Data_52 = reshape(Import_Data_52, Printer_Nx_Mod, Printer_Ny_Mod)

    Temp_f01[:, :, k] = Import_Data_8
    Temp_f02[:, :, k] = Import_Data_9
    Temp_f03[:, :, k] = Import_Data_10
    Temp_f04[:, :, k] = Import_Data_11
    Temp_f05[:, :, k] = Import_Data_12
    Temp_f06[:, :, k] = Import_Data_13
    Temp_f07[:, :, k] = Import_Data_14
    Temp_f08[:, :, k] = Import_Data_15
    Temp_f09[:, :, k] = Import_Data_16
    Temp_f10[:, :, k] = Import_Data_17
    Temp_f11[:, :, k] = Import_Data_18
    Temp_f12[:, :, k] = Import_Data_19
    Temp_f13[:, :, k] = Import_Data_20
    Temp_f14[:, :, k] = Import_Data_21
    Temp_f15[:, :, k] = Import_Data_22
    Temp_f16[:, :, k] = Import_Data_23
    Temp_f17[:, :, k] = Import_Data_24
    Temp_f18[:, :, k] = Import_Data_25
    Temp_f19[:, :, k] = Import_Data_26
    Temp_f20[:, :, k] = Import_Data_27
    Temp_f21[:, :, k] = Import_Data_28
    Temp_f22[:, :, k] = Import_Data_29
    Temp_f23[:, :, k] = Import_Data_30
    Temp_f24[:, :, k] = Import_Data_31
    Temp_f25[:, :, k] = Import_Data_32
    Temp_f26[:, :, k] = Import_Data_33
    Temp_f27[:, :, k] = Import_Data_34
    Temp_Ux[:, :, k] = Import_Data_35
    Temp_Uy[:, :, k] = Import_Data_36
    Temp_Uz[:, :, k] = Import_Data_37
    Temp_Rho[:, :, k] = Import_Data_38
    Temp_X_Plot[:, :, k] = Import_Data_39
    Temp_Y_Plot[:, :, k] = Import_Data_40
    Temp_Z_Plot[:, :, k] = Import_Data_41
    Temp_Ut_Plot[:, :, k] = Import_Data_42
    Temp_Ux_Plot[:, :, k] = Import_Data_43
    Temp_Uy_Plot[:, :, k] = Import_Data_44
    Temp_Uz_Plot[:, :, k] = Import_Data_45
    Temp_Rho_Plot[:, :, k] = Import_Data_46
    Temp_QCriterion[:, :, k] = Import_Data_47
    Temp_DeltaCriterion[:, :, k] = Import_Data_48
    Temp_Lambda2Criterion[:, :, k] = Import_Data_49
    Temp_QCriterion_Mod2DPlotter[:, :, k] = Import_Data_50
    Temp_DeltaCriterion_Mod2DPlotter[:, :, k] = Import_Data_51
    Temp_Lambda2Criterion_Mod2DPlotter[:, :, k] = Import_Data_52
  end
end

####################################################################################################
####################################################################################################
####################################################################################################

# INPUT BOUNDARIES
if Double_Resolution == "Yes"
  Nx = (Nx - 2).*2 - 1
  Ny = (Ny - 2).*2 - 1
  Nz = (Nz - 2).*2 - 1
end
if Restart_Calculation == "No"
  Nx = Nx + 2 # To account for loss of boundary nodes at a later stage
  Ny = Ny + 2 # To account for loss of boundary nodes at a later stage
  Nz = Nz + 2 # To account for loss of boundary nodes at a later stage
end

Obstacle_Center_x = Int64(round(Nx/6, RoundUp))
Obstacle_Center_y = Int64(round(Ny/2, RoundUp))
Obstacle_Center_z = Int64(round(Nz/2, RoundUp))
if Sphere_Cube_CircularCylinder_SquareCylinder == 1
  Obstacle_Radius = sqrt.(Blockage_Ratio.*Ny.*Nz./pi)
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 2
  Obstacle_Radius = sqrt.(Blockage_Ratio.*Ny.*Nz./4)
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 3
  Obstacle_Radius = Blockage_Ratio.*Ny./2
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 4
  Obstacle_Radius = Blockage_Ratio.*Ny./2
end

# Initial Calculations
Inflow_Velocity = Ma/sqrt.(3)
Nu = Inflow_Velocity.*2.*Obstacle_Radius/Re # Kinematic Viscosity
Omega = 1/(3.*Nu + 1/2) # Relaxation Parameter
#Omega_Positive = Omega
#Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
#MRT_Omega[1] = Omega
#CMRT_Omega[1] = Omega
Cumulant_Omega[1] = Omega
Cumulant_Parameter_A = 0
Cumulant_Parameter_B = 0
if (Collision_Model == "Cumulant_LBM") && (Optimized_Cumulant_Model == "Yes")
  Cumulant_Parameter_A = (4.*(Cumulant_Omega[1].^2) + 2.*Cumulant_Omega[1].*Cumulant_Omega[2].*(Cumulant_Omega[1] - 6) + (Cumulant_Omega[2].^2).*(Cumulant_Omega[1].*(10 - 3.*Cumulant_Omega[1]) - 4))/((Cumulant_Omega[1] - Cumulant_Omega[2]).*(Cumulant_Omega[2].*(2 + 3.*Cumulant_Omega[1]) - 8.*Cumulant_Omega[1]))
  Cumulant_Parameter_B = (4.*Cumulant_Omega[1].*Cumulant_Omega[2].*(9.*Cumulant_Omega[1] - 16) - 4.*(Cumulant_Omega[1].^2) - 2.*(Cumulant_Omega[2].^2).*(2 + 9.*Cumulant_Omega[1].*(Cumulant_Omega[1] - 2)))/(3.*(Cumulant_Omega[1] - Cumulant_Omega[2]).*(Cumulant_Omega[2].*(2 + 3.*Cumulant_Omega[1]) - 8.*Cumulant_Omega[1]))
  Cumulant_Omega[2] = 1
  Cumulant_Omega[3] = (8.*(Cumulant_Omega[1] - 2).*(Cumulant_Omega[2].*(3.*Cumulant_Omega[1] - 1) - 5.*Cumulant_Omega[1]))/(8.*(5 - 2.*Cumulant_Omega[1]).*Cumulant_Omega[1] + Cumulant_Omega[2].*(8 + Cumulant_Omega[1].*(9.*Cumulant_Omega[1] - 26)))
  Cumulant_Omega[4] = (8.*(Cumulant_Omega[1] - 2).*(Cumulant_Omega[1] + Cumulant_Omega[2].*(3.*Cumulant_Omega[1] - 7)))/(Cumulant_Omega[2].*(56 - 42.*Cumulant_Omega[1] + 9.*(Cumulant_Omega[1].^2)) - 8.*Cumulant_Omega[1])
  Cumulant_Omega[5] = (24.*(Cumulant_Omega[1] - 2).*(4.*(Cumulant_Omega[1].^2) + Cumulant_Omega[1].*Cumulant_Omega[2].*(18 - 13.*Cumulant_Omega[1]) + (Cumulant_Omega[2].^2).*(2 + Cumulant_Omega[1].*(6.*Cumulant_Omega[1] - 11))))/(16.*(Cumulant_Omega[1].^2).*(Cumulant_Omega[1] - 6) - 2.*Cumulant_Omega[1].*Cumulant_Omega[2].*(216 + 5.*Cumulant_Omega[1].*(9.*Cumulant_Omega[1] - 46)) + (Cumulant_Omega[2].^2).*(Cumulant_Omega[1].*(3.*Cumulant_Omega[1] - 10).*(15.*Cumulant_Omega[1] - 28) - 48))
  Cumulant_First_Order_Velocity_Derivatives = 1
  #Cumulant_Second_Order_Velocity_Derivatives = 1
  println(" ")
  println("Optimized Cumulant Omega 3 = ", Cumulant_Omega[3])
  println("Optimized Cumulant Omega 4 = ", Cumulant_Omega[4])
  println("Optimized Cumulant Omega 5 = ", Cumulant_Omega[5])
  println(" ")
  if (CMRT_Omega[1] < 7/4) || (CMRT_Omega[1] > 2)
    println(" ")
    println("WARNING!!! FOR THE OPTIMIZED CUMULANT MODEL, OMEGA MUST BE WITHIN THE RANGE [7/4 < OMEGA < 2] FOR THE BULK VISCOSITY OF UNITY - ADJUST VISCOSITY OR BULK VISCOSITY ACCORDINGLY")
    println("WARNING!!! FOR THE OPTIMIZED CUMULANT MODEL, OMEGA MUST BE WITHIN THE RANGE [7/4 < OMEGA < 2] FOR THE BULK VISCOSITY OF UNITY - ADJUST VISCOSITY OR BULK VISCOSITY ACCORDINGLY")
    println("WARNING!!! FOR THE OPTIMIZED CUMULANT MODEL, OMEGA MUST BE WITHIN THE RANGE [7/4 < OMEGA < 2] FOR THE BULK VISCOSITY OF UNITY - ADJUST VISCOSITY OR BULK VISCOSITY ACCORDINGLY")
    println(" ")
  end
end

# D3Q26 Lattice constants
Wi = [8/27, 2/27, 2/27, 2/27, 2/27, 2/27, 2/27, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216]
Cx = [0, 1, - 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1]
Cy = [0, 0, 0, 1, - 1, 0, 0, 1, - 1, - 1, 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1, - 1, 1, - 1, 1]
Cz = [0, 0, 0, 0, 0, 1, - 1, 0, 0, 0, 0, 1, - 1, - 1, 1, 1, - 1, - 1, 1, 1, - 1, - 1, 1, 1, - 1, - 1, 1]
if Boundary_Walls == 1
  Column_y = 2:(Ny - 1)
  Column_z = 2:(Nz - 1)
end
if Boundary_Walls == 0
  Column_y = 1:Ny
  Column_z = 1:Nz
end
Inlet = 1 # Position of the inlet
Outlet = Nx # Position of the outlet
Gx = 1:Nx # Grid x-locations
Gy = 1:Ny # Grid y-locations
Gz = 1:Nz # Grid z-locations

# Determination of boundary grid points
Obstacle = zeros(Nx, Ny, Nz)
if Sphere_Cube_CircularCylinder_SquareCylinder == 1
  for i = Gx
    for j = Gy
      for k = Gz
        Obstacle[i, j, k] = (Gx[i] - Obstacle_Center_x).^2 + (Gy[j] - Obstacle_Center_y).^2 + (Gz[k] - Obstacle_Center_z).^2 <= Obstacle_Radius.^2
      end
    end
  end
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 2
  for i = Gx
    for j = Gy
      for k = Gz
        if (i > (Obstacle_Center_x - Obstacle_Radius)) && (i < (Obstacle_Center_x + Obstacle_Radius)) && (j > (Obstacle_Center_y - Obstacle_Radius)) && (j < (Obstacle_Center_y + Obstacle_Radius)) && (k > (Obstacle_Center_z - Obstacle_Radius)) && (k < (Obstacle_Center_z + Obstacle_Radius))
          Obstacle[i, j, k] = 1
        end
      end
    end
  end
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 3
  for i = Gx
    for j = Gy
      Obstacle[i, j, :] = (Gx[i] - Obstacle_Center_x).^2 + (Gy[j] - Obstacle_Center_y).^2 <= Obstacle_Radius.^2
    end
  end
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 4
  for i = Gx
    for j = Gy
      if (i > (Obstacle_Center_x - Obstacle_Radius)) && (i < (Obstacle_Center_x + Obstacle_Radius)) && (j > (Obstacle_Center_y - Obstacle_Radius)) && (j < (Obstacle_Center_y + Obstacle_Radius))
        Obstacle[i, j, :] = 1
      end
    end
  end
end
Wall = zeros(Nx, Ny, Nz)
if Boundary_Walls == 1
  Wall[:, 1, :] = 1
  Wall[:, Ny, :] = 1
  Wall[:, :, 1] = 1
  Wall[:, :, Nz] = 1
end
if Boundary_Walls == 0
  Wall[:, 1, :] = 0
  Wall[:, Ny, :] = 0
  Wall[:, :, 1] = 0
  Wall[:, :, Nz] = 0
end
Total_Walls = Obstacle + Wall

# Bounce Back Region
BBR_Indices_i = zeros(Nx, Ny, Nz)
BBR_Indices_j = zeros(Nx, Ny, Nz)
BBR_Indices_k = zeros(Nx, Ny, Nz)
for i = Gx
  for j = Gy
    for k = Gz
      BBR_Indices_i[i, j, k] = i
      BBR_Indices_j[i, j, k] = j
      BBR_Indices_k[i, j, k] = k
      if Total_Walls[i, j, k] > 1
        Total_Walls[i, j, k] = 1
      end
    end
  end
end
BBR_Indices_i = BBR_Indices_i.*Total_Walls
BBR_Indices_j = BBR_Indices_j.*Total_Walls
BBR_Indices_k = BBR_Indices_k.*Total_Walls
BBR_Indices = find(Total_Walls)
Total_Fluid = ones(Nx, Ny, Nz) - Total_Walls

f01 = zeros(Nx, Ny, Nz)
f02 = zeros(Nx, Ny, Nz)
f03 = zeros(Nx, Ny, Nz)
f04 = zeros(Nx, Ny, Nz)
f05 = zeros(Nx, Ny, Nz)
f06 = zeros(Nx, Ny, Nz)
f07 = zeros(Nx, Ny, Nz)
f08 = zeros(Nx, Ny, Nz)
f09 = zeros(Nx, Ny, Nz)
f10 = zeros(Nx, Ny, Nz)
f11 = zeros(Nx, Ny, Nz)
f12 = zeros(Nx, Ny, Nz)
f13 = zeros(Nx, Ny, Nz)
f14 = zeros(Nx, Ny, Nz)
f15 = zeros(Nx, Ny, Nz)
f16 = zeros(Nx, Ny, Nz)
f17 = zeros(Nx, Ny, Nz)
f18 = zeros(Nx, Ny, Nz)
f19 = zeros(Nx, Ny, Nz)
f20 = zeros(Nx, Ny, Nz)
f21 = zeros(Nx, Ny, Nz)
f22 = zeros(Nx, Ny, Nz)
f23 = zeros(Nx, Ny, Nz)
f24 = zeros(Nx, Ny, Nz)
f25 = zeros(Nx, Ny, Nz)
f26 = zeros(Nx, Ny, Nz)
f27 = zeros(Nx, Ny, Nz)
Rho = zeros(Nx, Ny, Nz)
Ux = zeros(Nx, Ny, Nz)
Uy = zeros(Nx, Ny, Nz)
Uz = zeros(Nx, Ny, Nz)
Jx = zeros(Nx, Ny, Nz)
Jy = zeros(Nx, Ny, Nz)
Jz = zeros(Nx, Ny, Nz)
Ninlet_xy = zeros(Nx, Ny, Nz)
Ninlet_xz = zeros(Nx, Ny, Nz)
Noutlet_xy = zeros(Nx, Ny, Nz)
Noutlet_xz = zeros(Nx, Ny, Nz)
Fx_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Fy_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Fz_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
YLift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
ZLift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Drag_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
Rho_Plot = zeros(Nx, Ny, Nz)
QCriterion = zeros(Nx, Ny, Nz)
QCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
QCriterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
DeltaCriterion = zeros(Nx, Ny, Nz)
DeltaCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
DeltaCriterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
Lambda2Criterion = zeros(Nx, Ny, Nz)
Lambda2Criterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
Lambda2Criterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
DelUx_Delx = zeros(Nx, Ny, Nz)
DelUx_Dely = zeros(Nx, Ny, Nz)
DelUx_Delz = zeros(Nx, Ny, Nz)
DelUy_Delx = zeros(Nx, Ny, Nz)
DelUy_Dely = zeros(Nx, Ny, Nz)
DelUy_Delz = zeros(Nx, Ny, Nz)
DelUz_Delx = zeros(Nx, Ny, Nz)
DelUz_Dely = zeros(Nx, Ny, Nz)
DelUz_Delz = zeros(Nx, Ny, Nz)
Ux_Plot = zeros(Nx, Ny, Nz)
Uy_Plot = zeros(Nx, Ny, Nz)
Uz_Plot = zeros(Nx, Ny, Nz)
Ut_Plot = zeros(Nx, Ny, Nz)
X_Plot = zeros(Nx, Ny, Nz)
Y_Plot = zeros(Nx, Ny, Nz)
Z_Plot = zeros(Nx, Ny, Nz)
for i = Gx
  for j = Gy
    for k = Gz
      X_Plot[i, j, k] = i
      Y_Plot[i, j, k] = j
      Z_Plot[i, j, k] = k
    end
  end
end

####################################################################################################
####################################################################################################
####################################################################################################

# INITIAL CONDITIONS: Poiseuille Profile at Equilibrium
if Boundary_Walls == 1
  Ly = Ny - 2
  Lz = Nz - 2
  y_Phys = Gy - 3/2
  z_Phys = Gz - 3/2
  for i = Gx
    for j = Gy
      for k = Gz
        if Total_Fluid[i, j, k] == 1
          Ux[i, j, k] = (4*Inflow_Velocity./(Ly.^2)*(y_Phys[j].*Ly - (y_Phys[j].^2))).*(4*Inflow_Velocity./(Lz.^2)*(z_Phys[k].*Lz - (z_Phys[k].^2)))
        end
      end
    end
  end
  f01 = Rho_Initial.*Wi[1].*(1 + 3*(Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz) + 9/2.*((Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f02 = Rho_Initial.*Wi[2].*(1 + 3*(Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz) + 9/2.*((Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f03 = Rho_Initial.*Wi[3].*(1 + 3*(Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz) + 9/2.*((Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f04 = Rho_Initial.*Wi[4].*(1 + 3*(Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz) + 9/2.*((Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f05 = Rho_Initial.*Wi[5].*(1 + 3*(Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz) + 9/2.*((Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f06 = Rho_Initial.*Wi[6].*(1 + 3*(Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz) + 9/2.*((Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f07 = Rho_Initial.*Wi[7].*(1 + 3*(Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz) + 9/2.*((Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f08 = Rho_Initial.*Wi[8].*(1 + 3*(Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz) + 9/2.*((Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f09 = Rho_Initial.*Wi[9].*(1 + 3*(Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz) + 9/2.*((Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f10 = Rho_Initial.*Wi[10].*(1 + 3*(Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz) + 9/2.*((Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f11 = Rho_Initial.*Wi[11].*(1 + 3*(Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz) + 9/2.*((Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f12 = Rho_Initial.*Wi[12].*(1 + 3*(Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz) + 9/2.*((Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f13 = Rho_Initial.*Wi[13].*(1 + 3*(Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz) + 9/2.*((Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f14 = Rho_Initial.*Wi[14].*(1 + 3*(Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz) + 9/2.*((Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f15 = Rho_Initial.*Wi[15].*(1 + 3*(Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz) + 9/2.*((Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f16 = Rho_Initial.*Wi[16].*(1 + 3*(Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz) + 9/2.*((Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f17 = Rho_Initial.*Wi[17].*(1 + 3*(Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz) + 9/2.*((Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f18 = Rho_Initial.*Wi[18].*(1 + 3*(Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz) + 9/2.*((Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f19 = Rho_Initial.*Wi[19].*(1 + 3*(Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz) + 9/2.*((Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f20 = Rho_Initial.*Wi[20].*(1 + 3*(Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz) + 9/2.*((Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f21 = Rho_Initial.*Wi[21].*(1 + 3*(Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz) + 9/2.*((Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f22 = Rho_Initial.*Wi[22].*(1 + 3*(Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz) + 9/2.*((Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f23 = Rho_Initial.*Wi[23].*(1 + 3*(Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz) + 9/2.*((Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f24 = Rho_Initial.*Wi[24].*(1 + 3*(Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz) + 9/2.*((Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f25 = Rho_Initial.*Wi[25].*(1 + 3*(Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz) + 9/2.*((Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f26 = Rho_Initial.*Wi[26].*(1 + 3*(Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz) + 9/2.*((Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f27 = Rho_Initial.*Wi[27].*(1 + 3*(Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz) + 9/2.*((Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
end

# ALTERNATE INITIAL CONDITIONS: Uniform Flow
if Boundary_Walls == 0
  for i = Gx
    for j = Gy
      for k = Gz
        if Total_Fluid[i, j, k] == 1
          Ux[i, j, k] = Inflow_Velocity
        end
      end
    end
  end
  f01 = Rho_Initial.*Wi[1].*(1 + 3*(Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz) + 9/2.*((Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f02 = Rho_Initial.*Wi[2].*(1 + 3*(Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz) + 9/2.*((Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f03 = Rho_Initial.*Wi[3].*(1 + 3*(Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz) + 9/2.*((Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f04 = Rho_Initial.*Wi[4].*(1 + 3*(Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz) + 9/2.*((Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f05 = Rho_Initial.*Wi[5].*(1 + 3*(Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz) + 9/2.*((Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f06 = Rho_Initial.*Wi[6].*(1 + 3*(Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz) + 9/2.*((Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f07 = Rho_Initial.*Wi[7].*(1 + 3*(Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz) + 9/2.*((Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f08 = Rho_Initial.*Wi[8].*(1 + 3*(Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz) + 9/2.*((Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f09 = Rho_Initial.*Wi[9].*(1 + 3*(Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz) + 9/2.*((Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f10 = Rho_Initial.*Wi[10].*(1 + 3*(Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz) + 9/2.*((Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f11 = Rho_Initial.*Wi[11].*(1 + 3*(Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz) + 9/2.*((Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f12 = Rho_Initial.*Wi[12].*(1 + 3*(Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz) + 9/2.*((Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f13 = Rho_Initial.*Wi[13].*(1 + 3*(Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz) + 9/2.*((Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f14 = Rho_Initial.*Wi[14].*(1 + 3*(Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz) + 9/2.*((Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f15 = Rho_Initial.*Wi[15].*(1 + 3*(Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz) + 9/2.*((Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f16 = Rho_Initial.*Wi[16].*(1 + 3*(Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz) + 9/2.*((Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f17 = Rho_Initial.*Wi[17].*(1 + 3*(Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz) + 9/2.*((Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f18 = Rho_Initial.*Wi[18].*(1 + 3*(Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz) + 9/2.*((Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f19 = Rho_Initial.*Wi[19].*(1 + 3*(Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz) + 9/2.*((Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f20 = Rho_Initial.*Wi[20].*(1 + 3*(Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz) + 9/2.*((Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f21 = Rho_Initial.*Wi[21].*(1 + 3*(Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz) + 9/2.*((Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f22 = Rho_Initial.*Wi[22].*(1 + 3*(Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz) + 9/2.*((Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f23 = Rho_Initial.*Wi[23].*(1 + 3*(Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz) + 9/2.*((Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f24 = Rho_Initial.*Wi[24].*(1 + 3*(Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz) + 9/2.*((Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f25 = Rho_Initial.*Wi[25].*(1 + 3*(Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz) + 9/2.*((Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f26 = Rho_Initial.*Wi[26].*(1 + 3*(Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz) + 9/2.*((Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f27 = Rho_Initial.*Wi[27].*(1 + 3*(Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz) + 9/2.*((Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
end

# RESTARTED INITIAL CONDITIONS: Read from file
if Restart_Calculation == "Yes"
  if Double_Resolution == "No"
    f01 = Temp_f01
    f02 = Temp_f02
    f03 = Temp_f03
    f04 = Temp_f04
    f05 = Temp_f05
    f06 = Temp_f06
    f07 = Temp_f07
    f08 = Temp_f08
    f09 = Temp_f09
    f10 = Temp_f10
    f11 = Temp_f11
    f12 = Temp_f12
    f13 = Temp_f13
    f14 = Temp_f14
    f15 = Temp_f15
    f16 = Temp_f16
    f17 = Temp_f17
    f18 = Temp_f18
    f19 = Temp_f19
    f20 = Temp_f20
    f21 = Temp_f21
    f22 = Temp_f22
    f23 = Temp_f23
    f24 = Temp_f24
    f25 = Temp_f25
    f26 = Temp_f26
    f27 = Temp_f27
    Ux = Temp_Ux
    Uy = Temp_Uy
    Uz = Temp_Uz
    Rho = Temp_Rho
    X_Plot = Temp_X_Plot
    Y_Plot = Temp_Y_Plot
    Z_Plot = Temp_Z_Plot
    Ut_Plot = Temp_Ut_Plot
    Ux_Plot = Temp_Ux_Plot
    Uy_Plot = Temp_Uy_Plot
    Uz_Plot = Temp_Uz_Plot
    Rho_Plot = Temp_Rho_Plot
    QCriterion = Temp_QCriterion
    DeltaCriterion = Temp_DeltaCriterion
    Lambda2Criterion = Temp_Lambda2Criterion
    QCriterion_Mod2DPlotter = Temp_QCriterion_Mod2DPlotter
    DeltaCriterion_Mod2DPlotter = Temp_DeltaCriterion_Mod2DPlotter
    Lambda2Criterion_Mod2DPlotter = Temp_Lambda2Criterion_Mod2DPlotter
  end
  if Double_Resolution == "Yes"
    println(" ")
    println("DOUBLING RESOLUTION")
    println("DOUBLING RESOLUTION")
    println("DOUBLING RESOLUTION")
    println(" ")
    println("0 %")

    for i = 2:2:(Nx - 1)
      for j = 2:2:(Ny - 1)
        for k = 2:2:(Nz - 1)
          f01[i, j, k] = Temp_f01[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f02[i, j, k] = Temp_f02[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f03[i, j, k] = Temp_f03[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f04[i, j, k] = Temp_f04[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f05[i, j, k] = Temp_f05[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f06[i, j, k] = Temp_f06[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f07[i, j, k] = Temp_f07[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f08[i, j, k] = Temp_f08[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f09[i, j, k] = Temp_f09[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f10[i, j, k] = Temp_f10[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f11[i, j, k] = Temp_f11[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f12[i, j, k] = Temp_f12[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f13[i, j, k] = Temp_f13[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f14[i, j, k] = Temp_f14[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f15[i, j, k] = Temp_f15[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f16[i, j, k] = Temp_f16[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f17[i, j, k] = Temp_f17[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f18[i, j, k] = Temp_f18[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f19[i, j, k] = Temp_f19[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f20[i, j, k] = Temp_f20[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f21[i, j, k] = Temp_f21[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f22[i, j, k] = Temp_f22[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f23[i, j, k] = Temp_f23[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f24[i, j, k] = Temp_f24[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f25[i, j, k] = Temp_f25[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f26[i, j, k] = Temp_f26[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
          f27[i, j, k] = Temp_f27[Int64(round(i./2 + 1, RoundDown)), Int64(round(j./2 + 1, RoundDown)), Int64(round(k./2 + 1, RoundDown))]
        end
      end
    end
    println("10 %")
    for i = 3:2:(Nx - 2)
      f01[i, :, :] = (f01[i - 1, :, :] + f01[i + 1, :, :])./2
      f02[i, :, :] = (f02[i - 1, :, :] + f02[i + 1, :, :])./2
      f03[i, :, :] = (f03[i - 1, :, :] + f03[i + 1, :, :])./2
      f04[i, :, :] = (f04[i - 1, :, :] + f04[i + 1, :, :])./2
      f05[i, :, :] = (f05[i - 1, :, :] + f05[i + 1, :, :])./2
      f06[i, :, :] = (f06[i - 1, :, :] + f06[i + 1, :, :])./2
      f07[i, :, :] = (f07[i - 1, :, :] + f07[i + 1, :, :])./2
      f08[i, :, :] = (f08[i - 1, :, :] + f08[i + 1, :, :])./2
      f09[i, :, :] = (f09[i - 1, :, :] + f09[i + 1, :, :])./2
      f10[i, :, :] = (f10[i - 1, :, :] + f10[i + 1, :, :])./2
      f11[i, :, :] = (f11[i - 1, :, :] + f11[i + 1, :, :])./2
      f12[i, :, :] = (f12[i - 1, :, :] + f12[i + 1, :, :])./2
      f13[i, :, :] = (f13[i - 1, :, :] + f13[i + 1, :, :])./2
      f14[i, :, :] = (f14[i - 1, :, :] + f14[i + 1, :, :])./2
      f15[i, :, :] = (f15[i - 1, :, :] + f15[i + 1, :, :])./2
      f16[i, :, :] = (f16[i - 1, :, :] + f16[i + 1, :, :])./2
      f17[i, :, :] = (f17[i - 1, :, :] + f17[i + 1, :, :])./2
      f18[i, :, :] = (f18[i - 1, :, :] + f18[i + 1, :, :])./2
      f19[i, :, :] = (f19[i - 1, :, :] + f19[i + 1, :, :])./2
      f20[i, :, :] = (f20[i - 1, :, :] + f20[i + 1, :, :])./2
      f21[i, :, :] = (f21[i - 1, :, :] + f21[i + 1, :, :])./2
      f22[i, :, :] = (f22[i - 1, :, :] + f22[i + 1, :, :])./2
      f23[i, :, :] = (f23[i - 1, :, :] + f23[i + 1, :, :])./2
      f24[i, :, :] = (f24[i - 1, :, :] + f24[i + 1, :, :])./2
      f25[i, :, :] = (f25[i - 1, :, :] + f25[i + 1, :, :])./2
      f26[i, :, :] = (f26[i - 1, :, :] + f26[i + 1, :, :])./2
      f27[i, :, :] = (f27[i - 1, :, :] + f27[i + 1, :, :])./2
    end
    println("20 %")
    for j = 3:2:(Ny - 2)
      f01[:, j, :] = (f01[:, j - 1, :] + f01[:, j + 1, :])./2
      f02[:, j, :] = (f02[:, j - 1, :] + f02[:, j + 1, :])./2
      f03[:, j, :] = (f03[:, j - 1, :] + f03[:, j + 1, :])./2
      f04[:, j, :] = (f04[:, j - 1, :] + f04[:, j + 1, :])./2
      f05[:, j, :] = (f05[:, j - 1, :] + f05[:, j + 1, :])./2
      f06[:, j, :] = (f06[:, j - 1, :] + f06[:, j + 1, :])./2
      f07[:, j, :] = (f07[:, j - 1, :] + f07[:, j + 1, :])./2
      f08[:, j, :] = (f08[:, j - 1, :] + f08[:, j + 1, :])./2
      f09[:, j, :] = (f09[:, j - 1, :] + f09[:, j + 1, :])./2
      f10[:, j, :] = (f10[:, j - 1, :] + f10[:, j + 1, :])./2
      f11[:, j, :] = (f11[:, j - 1, :] + f11[:, j + 1, :])./2
      f12[:, j, :] = (f12[:, j - 1, :] + f12[:, j + 1, :])./2
      f13[:, j, :] = (f13[:, j - 1, :] + f13[:, j + 1, :])./2
      f14[:, j, :] = (f14[:, j - 1, :] + f14[:, j + 1, :])./2
      f15[:, j, :] = (f15[:, j - 1, :] + f15[:, j + 1, :])./2
      f16[:, j, :] = (f16[:, j - 1, :] + f16[:, j + 1, :])./2
      f17[:, j, :] = (f17[:, j - 1, :] + f17[:, j + 1, :])./2
      f18[:, j, :] = (f18[:, j - 1, :] + f18[:, j + 1, :])./2
      f19[:, j, :] = (f19[:, j - 1, :] + f19[:, j + 1, :])./2
      f20[:, j, :] = (f20[:, j - 1, :] + f20[:, j + 1, :])./2
      f21[:, j, :] = (f21[:, j - 1, :] + f21[:, j + 1, :])./2
      f22[:, j, :] = (f22[:, j - 1, :] + f22[:, j + 1, :])./2
      f23[:, j, :] = (f23[:, j - 1, :] + f23[:, j + 1, :])./2
      f24[:, j, :] = (f24[:, j - 1, :] + f24[:, j + 1, :])./2
      f25[:, j, :] = (f25[:, j - 1, :] + f25[:, j + 1, :])./2
      f26[:, j, :] = (f26[:, j - 1, :] + f26[:, j + 1, :])./2
      f27[:, j, :] = (f27[:, j - 1, :] + f27[:, j + 1, :])./2
    end
    println("30 %")
    for k = 3:2:(Nz - 2)
      f01[:, :, k] = (f01[:, :, k - 1] + f01[:, :, k + 1])./2
      f02[:, :, k] = (f02[:, :, k - 1] + f02[:, :, k + 1])./2
      f03[:, :, k] = (f03[:, :, k - 1] + f03[:, :, k + 1])./2
      f04[:, :, k] = (f04[:, :, k - 1] + f04[:, :, k + 1])./2
      f05[:, :, k] = (f05[:, :, k - 1] + f05[:, :, k + 1])./2
      f06[:, :, k] = (f06[:, :, k - 1] + f06[:, :, k + 1])./2
      f07[:, :, k] = (f07[:, :, k - 1] + f07[:, :, k + 1])./2
      f08[:, :, k] = (f08[:, :, k - 1] + f08[:, :, k + 1])./2
      f09[:, :, k] = (f09[:, :, k - 1] + f09[:, :, k + 1])./2
      f10[:, :, k] = (f10[:, :, k - 1] + f10[:, :, k + 1])./2
      f11[:, :, k] = (f11[:, :, k - 1] + f11[:, :, k + 1])./2
      f12[:, :, k] = (f12[:, :, k - 1] + f12[:, :, k + 1])./2
      f13[:, :, k] = (f13[:, :, k - 1] + f13[:, :, k + 1])./2
      f14[:, :, k] = (f14[:, :, k - 1] + f14[:, :, k + 1])./2
      f15[:, :, k] = (f15[:, :, k - 1] + f15[:, :, k + 1])./2
      f16[:, :, k] = (f16[:, :, k - 1] + f16[:, :, k + 1])./2
      f17[:, :, k] = (f17[:, :, k - 1] + f17[:, :, k + 1])./2
      f18[:, :, k] = (f18[:, :, k - 1] + f18[:, :, k + 1])./2
      f19[:, :, k] = (f19[:, :, k - 1] + f19[:, :, k + 1])./2
      f20[:, :, k] = (f20[:, :, k - 1] + f20[:, :, k + 1])./2
      f21[:, :, k] = (f21[:, :, k - 1] + f21[:, :, k + 1])./2
      f22[:, :, k] = (f22[:, :, k - 1] + f22[:, :, k + 1])./2
      f23[:, :, k] = (f23[:, :, k - 1] + f23[:, :, k + 1])./2
      f24[:, :, k] = (f24[:, :, k - 1] + f24[:, :, k + 1])./2
      f25[:, :, k] = (f25[:, :, k - 1] + f25[:, :, k + 1])./2
      f26[:, :, k] = (f26[:, :, k - 1] + f26[:, :, k + 1])./2
      f27[:, :, k] = (f27[:, :, k - 1] + f27[:, :, k + 1])./2
    end
    println("40 %")
    for i = 3:2:(Nx - 2)
      for j = 3:2:(Ny - 2)
        f01[i, j, :] = (f01[i - 1, j, :] + f01[i + 1, j, :])./8 + (f01[i, j - 1, :] + f01[i, j + 1, :])./8 + (f01[i - 1, j - 1, :] + f01[i + 1, j + 1, :])./8 + (f01[i - 1, j + 1, :] + f01[i + 1, j - 1, :])./8
        f02[i, j, :] = (f02[i - 1, j, :] + f02[i + 1, j, :])./8 + (f02[i, j - 1, :] + f02[i, j + 1, :])./8 + (f02[i - 1, j - 1, :] + f02[i + 1, j + 1, :])./8 + (f02[i - 1, j + 1, :] + f02[i + 1, j - 1, :])./8
        f03[i, j, :] = (f03[i - 1, j, :] + f03[i + 1, j, :])./8 + (f03[i, j - 1, :] + f03[i, j + 1, :])./8 + (f03[i - 1, j - 1, :] + f03[i + 1, j + 1, :])./8 + (f03[i - 1, j + 1, :] + f03[i + 1, j - 1, :])./8
        f04[i, j, :] = (f04[i - 1, j, :] + f04[i + 1, j, :])./8 + (f04[i, j - 1, :] + f04[i, j + 1, :])./8 + (f04[i - 1, j - 1, :] + f04[i + 1, j + 1, :])./8 + (f04[i - 1, j + 1, :] + f04[i + 1, j - 1, :])./8
        f05[i, j, :] = (f05[i - 1, j, :] + f05[i + 1, j, :])./8 + (f05[i, j - 1, :] + f05[i, j + 1, :])./8 + (f05[i - 1, j - 1, :] + f05[i + 1, j + 1, :])./8 + (f05[i - 1, j + 1, :] + f05[i + 1, j - 1, :])./8
        f06[i, j, :] = (f06[i - 1, j, :] + f06[i + 1, j, :])./8 + (f06[i, j - 1, :] + f06[i, j + 1, :])./8 + (f06[i - 1, j - 1, :] + f06[i + 1, j + 1, :])./8 + (f06[i - 1, j + 1, :] + f06[i + 1, j - 1, :])./8
        f07[i, j, :] = (f07[i - 1, j, :] + f07[i + 1, j, :])./8 + (f07[i, j - 1, :] + f07[i, j + 1, :])./8 + (f07[i - 1, j - 1, :] + f07[i + 1, j + 1, :])./8 + (f07[i - 1, j + 1, :] + f07[i + 1, j - 1, :])./8
        f08[i, j, :] = (f08[i - 1, j, :] + f08[i + 1, j, :])./8 + (f08[i, j - 1, :] + f08[i, j + 1, :])./8 + (f08[i - 1, j - 1, :] + f08[i + 1, j + 1, :])./8 + (f08[i - 1, j + 1, :] + f08[i + 1, j - 1, :])./8
        f09[i, j, :] = (f09[i - 1, j, :] + f09[i + 1, j, :])./8 + (f09[i, j - 1, :] + f09[i, j + 1, :])./8 + (f09[i - 1, j - 1, :] + f09[i + 1, j + 1, :])./8 + (f09[i - 1, j + 1, :] + f09[i + 1, j - 1, :])./8
        f10[i, j, :] = (f10[i - 1, j, :] + f10[i + 1, j, :])./8 + (f10[i, j - 1, :] + f10[i, j + 1, :])./8 + (f10[i - 1, j - 1, :] + f10[i + 1, j + 1, :])./8 + (f10[i - 1, j + 1, :] + f10[i + 1, j - 1, :])./8
        f11[i, j, :] = (f11[i - 1, j, :] + f11[i + 1, j, :])./8 + (f11[i, j - 1, :] + f11[i, j + 1, :])./8 + (f11[i - 1, j - 1, :] + f11[i + 1, j + 1, :])./8 + (f11[i - 1, j + 1, :] + f11[i + 1, j - 1, :])./8
        f12[i, j, :] = (f12[i - 1, j, :] + f12[i + 1, j, :])./8 + (f12[i, j - 1, :] + f12[i, j + 1, :])./8 + (f12[i - 1, j - 1, :] + f12[i + 1, j + 1, :])./8 + (f12[i - 1, j + 1, :] + f12[i + 1, j - 1, :])./8
        f13[i, j, :] = (f13[i - 1, j, :] + f13[i + 1, j, :])./8 + (f13[i, j - 1, :] + f13[i, j + 1, :])./8 + (f13[i - 1, j - 1, :] + f13[i + 1, j + 1, :])./8 + (f13[i - 1, j + 1, :] + f13[i + 1, j - 1, :])./8
        f14[i, j, :] = (f14[i - 1, j, :] + f14[i + 1, j, :])./8 + (f14[i, j - 1, :] + f14[i, j + 1, :])./8 + (f14[i - 1, j - 1, :] + f14[i + 1, j + 1, :])./8 + (f14[i - 1, j + 1, :] + f14[i + 1, j - 1, :])./8
        f15[i, j, :] = (f15[i - 1, j, :] + f15[i + 1, j, :])./8 + (f15[i, j - 1, :] + f15[i, j + 1, :])./8 + (f15[i - 1, j - 1, :] + f15[i + 1, j + 1, :])./8 + (f15[i - 1, j + 1, :] + f15[i + 1, j - 1, :])./8
        f16[i, j, :] = (f16[i - 1, j, :] + f16[i + 1, j, :])./8 + (f16[i, j - 1, :] + f16[i, j + 1, :])./8 + (f16[i - 1, j - 1, :] + f16[i + 1, j + 1, :])./8 + (f16[i - 1, j + 1, :] + f16[i + 1, j - 1, :])./8
        f17[i, j, :] = (f17[i - 1, j, :] + f17[i + 1, j, :])./8 + (f17[i, j - 1, :] + f17[i, j + 1, :])./8 + (f17[i - 1, j - 1, :] + f17[i + 1, j + 1, :])./8 + (f17[i - 1, j + 1, :] + f17[i + 1, j - 1, :])./8
        f18[i, j, :] = (f18[i - 1, j, :] + f18[i + 1, j, :])./8 + (f18[i, j - 1, :] + f18[i, j + 1, :])./8 + (f18[i - 1, j - 1, :] + f18[i + 1, j + 1, :])./8 + (f18[i - 1, j + 1, :] + f18[i + 1, j - 1, :])./8
        f19[i, j, :] = (f19[i - 1, j, :] + f19[i + 1, j, :])./8 + (f19[i, j - 1, :] + f19[i, j + 1, :])./8 + (f19[i - 1, j - 1, :] + f19[i + 1, j + 1, :])./8 + (f19[i - 1, j + 1, :] + f19[i + 1, j - 1, :])./8
        f20[i, j, :] = (f20[i - 1, j, :] + f20[i + 1, j, :])./8 + (f20[i, j - 1, :] + f20[i, j + 1, :])./8 + (f20[i - 1, j - 1, :] + f20[i + 1, j + 1, :])./8 + (f20[i - 1, j + 1, :] + f20[i + 1, j - 1, :])./8
        f21[i, j, :] = (f21[i - 1, j, :] + f21[i + 1, j, :])./8 + (f21[i, j - 1, :] + f21[i, j + 1, :])./8 + (f21[i - 1, j - 1, :] + f21[i + 1, j + 1, :])./8 + (f21[i - 1, j + 1, :] + f21[i + 1, j - 1, :])./8
        f22[i, j, :] = (f22[i - 1, j, :] + f22[i + 1, j, :])./8 + (f22[i, j - 1, :] + f22[i, j + 1, :])./8 + (f22[i - 1, j - 1, :] + f22[i + 1, j + 1, :])./8 + (f22[i - 1, j + 1, :] + f22[i + 1, j - 1, :])./8
        f23[i, j, :] = (f23[i - 1, j, :] + f23[i + 1, j, :])./8 + (f23[i, j - 1, :] + f23[i, j + 1, :])./8 + (f23[i - 1, j - 1, :] + f23[i + 1, j + 1, :])./8 + (f23[i - 1, j + 1, :] + f23[i + 1, j - 1, :])./8
        f24[i, j, :] = (f24[i - 1, j, :] + f24[i + 1, j, :])./8 + (f24[i, j - 1, :] + f24[i, j + 1, :])./8 + (f24[i - 1, j - 1, :] + f24[i + 1, j + 1, :])./8 + (f24[i - 1, j + 1, :] + f24[i + 1, j - 1, :])./8
        f25[i, j, :] = (f25[i - 1, j, :] + f25[i + 1, j, :])./8 + (f25[i, j - 1, :] + f25[i, j + 1, :])./8 + (f25[i - 1, j - 1, :] + f25[i + 1, j + 1, :])./8 + (f25[i - 1, j + 1, :] + f25[i + 1, j - 1, :])./8
        f26[i, j, :] = (f26[i - 1, j, :] + f26[i + 1, j, :])./8 + (f26[i, j - 1, :] + f26[i, j + 1, :])./8 + (f26[i - 1, j - 1, :] + f26[i + 1, j + 1, :])./8 + (f26[i - 1, j + 1, :] + f26[i + 1, j - 1, :])./8
        f27[i, j, :] = (f27[i - 1, j, :] + f27[i + 1, j, :])./8 + (f27[i, j - 1, :] + f27[i, j + 1, :])./8 + (f27[i - 1, j - 1, :] + f27[i + 1, j + 1, :])./8 + (f27[i - 1, j + 1, :] + f27[i + 1, j - 1, :])./8
      end
    end
    println("50 %")
    for i = 3:2:(Nx - 2)
      for k = 3:2:(Nz - 2)
        f01[i, :, k] = (f01[i - 1, :, k] + f01[i + 1, :, k])./8 + (f01[i, :, k - 1] + f01[i, :, k + 1])./8 + (f01[i - 1, :, k - 1] + f01[i + 1, :, k + 1])./8 + (f01[i - 1, :, k + 1] + f01[i + 1, :, k - 1])./8
        f02[i, :, k] = (f02[i - 1, :, k] + f02[i + 1, :, k])./8 + (f02[i, :, k - 1] + f02[i, :, k + 1])./8 + (f02[i - 1, :, k - 1] + f02[i + 1, :, k + 1])./8 + (f02[i - 1, :, k + 1] + f02[i + 1, :, k - 1])./8
        f03[i, :, k] = (f03[i - 1, :, k] + f03[i + 1, :, k])./8 + (f03[i, :, k - 1] + f03[i, :, k + 1])./8 + (f03[i - 1, :, k - 1] + f03[i + 1, :, k + 1])./8 + (f03[i - 1, :, k + 1] + f03[i + 1, :, k - 1])./8
        f04[i, :, k] = (f04[i - 1, :, k] + f04[i + 1, :, k])./8 + (f04[i, :, k - 1] + f04[i, :, k + 1])./8 + (f04[i - 1, :, k - 1] + f04[i + 1, :, k + 1])./8 + (f04[i - 1, :, k + 1] + f04[i + 1, :, k - 1])./8
        f05[i, :, k] = (f05[i - 1, :, k] + f05[i + 1, :, k])./8 + (f05[i, :, k - 1] + f05[i, :, k + 1])./8 + (f05[i - 1, :, k - 1] + f05[i + 1, :, k + 1])./8 + (f05[i - 1, :, k + 1] + f05[i + 1, :, k - 1])./8
        f06[i, :, k] = (f06[i - 1, :, k] + f06[i + 1, :, k])./8 + (f06[i, :, k - 1] + f06[i, :, k + 1])./8 + (f06[i - 1, :, k - 1] + f06[i + 1, :, k + 1])./8 + (f06[i - 1, :, k + 1] + f06[i + 1, :, k - 1])./8
        f07[i, :, k] = (f07[i - 1, :, k] + f07[i + 1, :, k])./8 + (f07[i, :, k - 1] + f07[i, :, k + 1])./8 + (f07[i - 1, :, k - 1] + f07[i + 1, :, k + 1])./8 + (f07[i - 1, :, k + 1] + f07[i + 1, :, k - 1])./8
        f08[i, :, k] = (f08[i - 1, :, k] + f08[i + 1, :, k])./8 + (f08[i, :, k - 1] + f08[i, :, k + 1])./8 + (f08[i - 1, :, k - 1] + f08[i + 1, :, k + 1])./8 + (f08[i - 1, :, k + 1] + f08[i + 1, :, k - 1])./8
        f09[i, :, k] = (f09[i - 1, :, k] + f09[i + 1, :, k])./8 + (f09[i, :, k - 1] + f09[i, :, k + 1])./8 + (f09[i - 1, :, k - 1] + f09[i + 1, :, k + 1])./8 + (f09[i - 1, :, k + 1] + f09[i + 1, :, k - 1])./8
        f10[i, :, k] = (f10[i - 1, :, k] + f10[i + 1, :, k])./8 + (f10[i, :, k - 1] + f10[i, :, k + 1])./8 + (f10[i - 1, :, k - 1] + f10[i + 1, :, k + 1])./8 + (f10[i - 1, :, k + 1] + f10[i + 1, :, k - 1])./8
        f11[i, :, k] = (f11[i - 1, :, k] + f11[i + 1, :, k])./8 + (f11[i, :, k - 1] + f11[i, :, k + 1])./8 + (f11[i - 1, :, k - 1] + f11[i + 1, :, k + 1])./8 + (f11[i - 1, :, k + 1] + f11[i + 1, :, k - 1])./8
        f12[i, :, k] = (f12[i - 1, :, k] + f12[i + 1, :, k])./8 + (f12[i, :, k - 1] + f12[i, :, k + 1])./8 + (f12[i - 1, :, k - 1] + f12[i + 1, :, k + 1])./8 + (f12[i - 1, :, k + 1] + f12[i + 1, :, k - 1])./8
        f13[i, :, k] = (f13[i - 1, :, k] + f13[i + 1, :, k])./8 + (f13[i, :, k - 1] + f13[i, :, k + 1])./8 + (f13[i - 1, :, k - 1] + f13[i + 1, :, k + 1])./8 + (f13[i - 1, :, k + 1] + f13[i + 1, :, k - 1])./8
        f14[i, :, k] = (f14[i - 1, :, k] + f14[i + 1, :, k])./8 + (f14[i, :, k - 1] + f14[i, :, k + 1])./8 + (f14[i - 1, :, k - 1] + f14[i + 1, :, k + 1])./8 + (f14[i - 1, :, k + 1] + f14[i + 1, :, k - 1])./8
        f15[i, :, k] = (f15[i - 1, :, k] + f15[i + 1, :, k])./8 + (f15[i, :, k - 1] + f15[i, :, k + 1])./8 + (f15[i - 1, :, k - 1] + f15[i + 1, :, k + 1])./8 + (f15[i - 1, :, k + 1] + f15[i + 1, :, k - 1])./8
        f16[i, :, k] = (f16[i - 1, :, k] + f16[i + 1, :, k])./8 + (f16[i, :, k - 1] + f16[i, :, k + 1])./8 + (f16[i - 1, :, k - 1] + f16[i + 1, :, k + 1])./8 + (f16[i - 1, :, k + 1] + f16[i + 1, :, k - 1])./8
        f17[i, :, k] = (f17[i - 1, :, k] + f17[i + 1, :, k])./8 + (f17[i, :, k - 1] + f17[i, :, k + 1])./8 + (f17[i - 1, :, k - 1] + f17[i + 1, :, k + 1])./8 + (f17[i - 1, :, k + 1] + f17[i + 1, :, k - 1])./8
        f18[i, :, k] = (f18[i - 1, :, k] + f18[i + 1, :, k])./8 + (f18[i, :, k - 1] + f18[i, :, k + 1])./8 + (f18[i - 1, :, k - 1] + f18[i + 1, :, k + 1])./8 + (f18[i - 1, :, k + 1] + f18[i + 1, :, k - 1])./8
        f19[i, :, k] = (f19[i - 1, :, k] + f19[i + 1, :, k])./8 + (f19[i, :, k - 1] + f19[i, :, k + 1])./8 + (f19[i - 1, :, k - 1] + f19[i + 1, :, k + 1])./8 + (f19[i - 1, :, k + 1] + f19[i + 1, :, k - 1])./8
        f20[i, :, k] = (f20[i - 1, :, k] + f20[i + 1, :, k])./8 + (f20[i, :, k - 1] + f20[i, :, k + 1])./8 + (f20[i - 1, :, k - 1] + f20[i + 1, :, k + 1])./8 + (f20[i - 1, :, k + 1] + f20[i + 1, :, k - 1])./8
        f21[i, :, k] = (f21[i - 1, :, k] + f21[i + 1, :, k])./8 + (f21[i, :, k - 1] + f21[i, :, k + 1])./8 + (f21[i - 1, :, k - 1] + f21[i + 1, :, k + 1])./8 + (f21[i - 1, :, k + 1] + f21[i + 1, :, k - 1])./8
        f22[i, :, k] = (f22[i - 1, :, k] + f22[i + 1, :, k])./8 + (f22[i, :, k - 1] + f22[i, :, k + 1])./8 + (f22[i - 1, :, k - 1] + f22[i + 1, :, k + 1])./8 + (f22[i - 1, :, k + 1] + f22[i + 1, :, k - 1])./8
        f23[i, :, k] = (f23[i - 1, :, k] + f23[i + 1, :, k])./8 + (f23[i, :, k - 1] + f23[i, :, k + 1])./8 + (f23[i - 1, :, k - 1] + f23[i + 1, :, k + 1])./8 + (f23[i - 1, :, k + 1] + f23[i + 1, :, k - 1])./8
        f24[i, :, k] = (f24[i - 1, :, k] + f24[i + 1, :, k])./8 + (f24[i, :, k - 1] + f24[i, :, k + 1])./8 + (f24[i - 1, :, k - 1] + f24[i + 1, :, k + 1])./8 + (f24[i - 1, :, k + 1] + f24[i + 1, :, k - 1])./8
        f25[i, :, k] = (f25[i - 1, :, k] + f25[i + 1, :, k])./8 + (f25[i, :, k - 1] + f25[i, :, k + 1])./8 + (f25[i - 1, :, k - 1] + f25[i + 1, :, k + 1])./8 + (f25[i - 1, :, k + 1] + f25[i + 1, :, k - 1])./8
        f26[i, :, k] = (f26[i - 1, :, k] + f26[i + 1, :, k])./8 + (f26[i, :, k - 1] + f26[i, :, k + 1])./8 + (f26[i - 1, :, k - 1] + f26[i + 1, :, k + 1])./8 + (f26[i - 1, :, k + 1] + f26[i + 1, :, k - 1])./8
        f27[i, :, k] = (f27[i - 1, :, k] + f27[i + 1, :, k])./8 + (f27[i, :, k - 1] + f27[i, :, k + 1])./8 + (f27[i - 1, :, k - 1] + f27[i + 1, :, k + 1])./8 + (f27[i - 1, :, k + 1] + f27[i + 1, :, k - 1])./8
      end
    end
    println("60 %")
    for j = 3:2:(Ny - 2)
      for k = 3:2:(Nz - 2)
        f01[:, j, k] = (f01[:, j - 1, k] + f01[:, j + 1, k])./8 + (f01[:, j, k - 1] + f01[:, j, k + 1])./8 + (f01[:, j - 1, k - 1] + f01[:, j + 1, k + 1])./8 + (f01[:, j - 1, k + 1] + f01[:, j + 1, k - 1])./8
        f02[:, j, k] = (f02[:, j - 1, k] + f02[:, j + 1, k])./8 + (f02[:, j, k - 1] + f02[:, j, k + 1])./8 + (f02[:, j - 1, k - 1] + f02[:, j + 1, k + 1])./8 + (f02[:, j - 1, k + 1] + f02[:, j + 1, k - 1])./8
        f03[:, j, k] = (f03[:, j - 1, k] + f03[:, j + 1, k])./8 + (f03[:, j, k - 1] + f03[:, j, k + 1])./8 + (f03[:, j - 1, k - 1] + f03[:, j + 1, k + 1])./8 + (f03[:, j - 1, k + 1] + f03[:, j + 1, k - 1])./8
        f04[:, j, k] = (f04[:, j - 1, k] + f04[:, j + 1, k])./8 + (f04[:, j, k - 1] + f04[:, j, k + 1])./8 + (f04[:, j - 1, k - 1] + f04[:, j + 1, k + 1])./8 + (f04[:, j - 1, k + 1] + f04[:, j + 1, k - 1])./8
        f05[:, j, k] = (f05[:, j - 1, k] + f05[:, j + 1, k])./8 + (f05[:, j, k - 1] + f05[:, j, k + 1])./8 + (f05[:, j - 1, k - 1] + f05[:, j + 1, k + 1])./8 + (f05[:, j - 1, k + 1] + f05[:, j + 1, k - 1])./8
        f06[:, j, k] = (f06[:, j - 1, k] + f06[:, j + 1, k])./8 + (f06[:, j, k - 1] + f06[:, j, k + 1])./8 + (f06[:, j - 1, k - 1] + f06[:, j + 1, k + 1])./8 + (f06[:, j - 1, k + 1] + f06[:, j + 1, k - 1])./8
        f07[:, j, k] = (f07[:, j - 1, k] + f07[:, j + 1, k])./8 + (f07[:, j, k - 1] + f07[:, j, k + 1])./8 + (f07[:, j - 1, k - 1] + f07[:, j + 1, k + 1])./8 + (f07[:, j - 1, k + 1] + f07[:, j + 1, k - 1])./8
        f08[:, j, k] = (f08[:, j - 1, k] + f08[:, j + 1, k])./8 + (f08[:, j, k - 1] + f08[:, j, k + 1])./8 + (f08[:, j - 1, k - 1] + f08[:, j + 1, k + 1])./8 + (f08[:, j - 1, k + 1] + f08[:, j + 1, k - 1])./8
        f09[:, j, k] = (f09[:, j - 1, k] + f09[:, j + 1, k])./8 + (f09[:, j, k - 1] + f09[:, j, k + 1])./8 + (f09[:, j - 1, k - 1] + f09[:, j + 1, k + 1])./8 + (f09[:, j - 1, k + 1] + f09[:, j + 1, k - 1])./8
        f10[:, j, k] = (f10[:, j - 1, k] + f10[:, j + 1, k])./8 + (f10[:, j, k - 1] + f10[:, j, k + 1])./8 + (f10[:, j - 1, k - 1] + f10[:, j + 1, k + 1])./8 + (f10[:, j - 1, k + 1] + f10[:, j + 1, k - 1])./8
        f11[:, j, k] = (f11[:, j - 1, k] + f11[:, j + 1, k])./8 + (f11[:, j, k - 1] + f11[:, j, k + 1])./8 + (f11[:, j - 1, k - 1] + f11[:, j + 1, k + 1])./8 + (f11[:, j - 1, k + 1] + f11[:, j + 1, k - 1])./8
        f12[:, j, k] = (f12[:, j - 1, k] + f12[:, j + 1, k])./8 + (f12[:, j, k - 1] + f12[:, j, k + 1])./8 + (f12[:, j - 1, k - 1] + f12[:, j + 1, k + 1])./8 + (f12[:, j - 1, k + 1] + f12[:, j + 1, k - 1])./8
        f13[:, j, k] = (f13[:, j - 1, k] + f13[:, j + 1, k])./8 + (f13[:, j, k - 1] + f13[:, j, k + 1])./8 + (f13[:, j - 1, k - 1] + f13[:, j + 1, k + 1])./8 + (f13[:, j - 1, k + 1] + f13[:, j + 1, k - 1])./8
        f14[:, j, k] = (f14[:, j - 1, k] + f14[:, j + 1, k])./8 + (f14[:, j, k - 1] + f14[:, j, k + 1])./8 + (f14[:, j - 1, k - 1] + f14[:, j + 1, k + 1])./8 + (f14[:, j - 1, k + 1] + f14[:, j + 1, k - 1])./8
        f15[:, j, k] = (f15[:, j - 1, k] + f15[:, j + 1, k])./8 + (f15[:, j, k - 1] + f15[:, j, k + 1])./8 + (f15[:, j - 1, k - 1] + f15[:, j + 1, k + 1])./8 + (f15[:, j - 1, k + 1] + f15[:, j + 1, k - 1])./8
        f16[:, j, k] = (f16[:, j - 1, k] + f16[:, j + 1, k])./8 + (f16[:, j, k - 1] + f16[:, j, k + 1])./8 + (f16[:, j - 1, k - 1] + f16[:, j + 1, k + 1])./8 + (f16[:, j - 1, k + 1] + f16[:, j + 1, k - 1])./8
        f17[:, j, k] = (f17[:, j - 1, k] + f17[:, j + 1, k])./8 + (f17[:, j, k - 1] + f17[:, j, k + 1])./8 + (f17[:, j - 1, k - 1] + f17[:, j + 1, k + 1])./8 + (f17[:, j - 1, k + 1] + f17[:, j + 1, k - 1])./8
        f18[:, j, k] = (f18[:, j - 1, k] + f18[:, j + 1, k])./8 + (f18[:, j, k - 1] + f18[:, j, k + 1])./8 + (f18[:, j - 1, k - 1] + f18[:, j + 1, k + 1])./8 + (f18[:, j - 1, k + 1] + f18[:, j + 1, k - 1])./8
        f19[:, j, k] = (f19[:, j - 1, k] + f19[:, j + 1, k])./8 + (f19[:, j, k - 1] + f19[:, j, k + 1])./8 + (f19[:, j - 1, k - 1] + f19[:, j + 1, k + 1])./8 + (f19[:, j - 1, k + 1] + f19[:, j + 1, k - 1])./8
        f20[:, j, k] = (f20[:, j - 1, k] + f20[:, j + 1, k])./8 + (f20[:, j, k - 1] + f20[:, j, k + 1])./8 + (f20[:, j - 1, k - 1] + f20[:, j + 1, k + 1])./8 + (f20[:, j - 1, k + 1] + f20[:, j + 1, k - 1])./8
        f21[:, j, k] = (f21[:, j - 1, k] + f21[:, j + 1, k])./8 + (f21[:, j, k - 1] + f21[:, j, k + 1])./8 + (f21[:, j - 1, k - 1] + f21[:, j + 1, k + 1])./8 + (f21[:, j - 1, k + 1] + f21[:, j + 1, k - 1])./8
        f22[:, j, k] = (f22[:, j - 1, k] + f22[:, j + 1, k])./8 + (f22[:, j, k - 1] + f22[:, j, k + 1])./8 + (f22[:, j - 1, k - 1] + f22[:, j + 1, k + 1])./8 + (f22[:, j - 1, k + 1] + f22[:, j + 1, k - 1])./8
        f23[:, j, k] = (f23[:, j - 1, k] + f23[:, j + 1, k])./8 + (f23[:, j, k - 1] + f23[:, j, k + 1])./8 + (f23[:, j - 1, k - 1] + f23[:, j + 1, k + 1])./8 + (f23[:, j - 1, k + 1] + f23[:, j + 1, k - 1])./8
        f24[:, j, k] = (f24[:, j - 1, k] + f24[:, j + 1, k])./8 + (f24[:, j, k - 1] + f24[:, j, k + 1])./8 + (f24[:, j - 1, k - 1] + f24[:, j + 1, k + 1])./8 + (f24[:, j - 1, k + 1] + f24[:, j + 1, k - 1])./8
        f25[:, j, k] = (f25[:, j - 1, k] + f25[:, j + 1, k])./8 + (f25[:, j, k - 1] + f25[:, j, k + 1])./8 + (f25[:, j - 1, k - 1] + f25[:, j + 1, k + 1])./8 + (f25[:, j - 1, k + 1] + f25[:, j + 1, k - 1])./8
        f26[:, j, k] = (f26[:, j - 1, k] + f26[:, j + 1, k])./8 + (f26[:, j, k - 1] + f26[:, j, k + 1])./8 + (f26[:, j - 1, k - 1] + f26[:, j + 1, k + 1])./8 + (f26[:, j - 1, k + 1] + f26[:, j + 1, k - 1])./8
        f27[:, j, k] = (f27[:, j - 1, k] + f27[:, j + 1, k])./8 + (f27[:, j, k - 1] + f27[:, j, k + 1])./8 + (f27[:, j - 1, k - 1] + f27[:, j + 1, k + 1])./8 + (f27[:, j - 1, k + 1] + f27[:, j + 1, k - 1])./8
      end
    end
    println("70 %")
    for i = 3:2:(Nx - 2)
      for j = 3:2:(Ny - 2)
        for k = 3:2:(Nz - 2)
          f01[i, j, k] = (f01[i - 1, j, k] + f01[i + 1, j, k])./26 + (f01[i, j - 1, k] + f01[i, j + 1, k])./26 + (f01[i, j, k - 1] + f01[i, j, k + 1])./26+ (f01[i - 1, j - 1, k] + f01[i + 1, j + 1, k])./26 + (f01[i - 1, j + 1, k] + f01[i + 1, j - 1, k])./26 + (f01[i - 1, j, k - 1] + f01[i + 1, j, k + 1])./26 + (f01[i - 1, j, k + 1] + f01[i + 1, j, k - 1])./26 + (f01[i, j - 1, k - 1] + f01[i, j + 1, k + 1])./26 + (f01[i, j - 1, k + 1] + f01[i, j + 1, k - 1])./26 + (f01[i - 1, j - 1, k - 1] + f01[i + 1, j + 1, k + 1])./26 + (f01[i - 1, j - 1, k + 1] + f01[i + 1, j + 1, k - 1])./26 + (f01[i - 1, j + 1, k - 1] + f01[i + 1, j - 1, k + 1])./26 + (f01[i + 1, j - 1, k - 1] + f01[i - 1, j + 1, k + 1])./26
          f02[i, j, k] = (f02[i - 1, j, k] + f02[i + 1, j, k])./26 + (f02[i, j - 1, k] + f02[i, j + 1, k])./26 + (f02[i, j, k - 1] + f02[i, j, k + 1])./26+ (f02[i - 1, j - 1, k] + f02[i + 1, j + 1, k])./26 + (f02[i - 1, j + 1, k] + f02[i + 1, j - 1, k])./26 + (f02[i - 1, j, k - 1] + f02[i + 1, j, k + 1])./26 + (f02[i - 1, j, k + 1] + f02[i + 1, j, k - 1])./26 + (f02[i, j - 1, k - 1] + f02[i, j + 1, k + 1])./26 + (f02[i, j - 1, k + 1] + f02[i, j + 1, k - 1])./26 + (f02[i - 1, j - 1, k - 1] + f02[i + 1, j + 1, k + 1])./26 + (f02[i - 1, j - 1, k + 1] + f02[i + 1, j + 1, k - 1])./26 + (f02[i - 1, j + 1, k - 1] + f02[i + 1, j - 1, k + 1])./26 + (f02[i + 1, j - 1, k - 1] + f02[i - 1, j + 1, k + 1])./26
          f03[i, j, k] = (f03[i - 1, j, k] + f03[i + 1, j, k])./26 + (f03[i, j - 1, k] + f03[i, j + 1, k])./26 + (f03[i, j, k - 1] + f03[i, j, k + 1])./26+ (f03[i - 1, j - 1, k] + f03[i + 1, j + 1, k])./26 + (f03[i - 1, j + 1, k] + f03[i + 1, j - 1, k])./26 + (f03[i - 1, j, k - 1] + f03[i + 1, j, k + 1])./26 + (f03[i - 1, j, k + 1] + f03[i + 1, j, k - 1])./26 + (f03[i, j - 1, k - 1] + f03[i, j + 1, k + 1])./26 + (f03[i, j - 1, k + 1] + f03[i, j + 1, k - 1])./26 + (f03[i - 1, j - 1, k - 1] + f03[i + 1, j + 1, k + 1])./26 + (f03[i - 1, j - 1, k + 1] + f03[i + 1, j + 1, k - 1])./26 + (f03[i - 1, j + 1, k - 1] + f03[i + 1, j - 1, k + 1])./26 + (f03[i + 1, j - 1, k - 1] + f03[i - 1, j + 1, k + 1])./26
          f04[i, j, k] = (f04[i - 1, j, k] + f04[i + 1, j, k])./26 + (f04[i, j - 1, k] + f04[i, j + 1, k])./26 + (f04[i, j, k - 1] + f04[i, j, k + 1])./26+ (f04[i - 1, j - 1, k] + f04[i + 1, j + 1, k])./26 + (f04[i - 1, j + 1, k] + f04[i + 1, j - 1, k])./26 + (f04[i - 1, j, k - 1] + f04[i + 1, j, k + 1])./26 + (f04[i - 1, j, k + 1] + f04[i + 1, j, k - 1])./26 + (f04[i, j - 1, k - 1] + f04[i, j + 1, k + 1])./26 + (f04[i, j - 1, k + 1] + f04[i, j + 1, k - 1])./26 + (f04[i - 1, j - 1, k - 1] + f04[i + 1, j + 1, k + 1])./26 + (f04[i - 1, j - 1, k + 1] + f04[i + 1, j + 1, k - 1])./26 + (f04[i - 1, j + 1, k - 1] + f04[i + 1, j - 1, k + 1])./26 + (f04[i + 1, j - 1, k - 1] + f04[i - 1, j + 1, k + 1])./26
          f05[i, j, k] = (f05[i - 1, j, k] + f05[i + 1, j, k])./26 + (f05[i, j - 1, k] + f05[i, j + 1, k])./26 + (f05[i, j, k - 1] + f05[i, j, k + 1])./26+ (f05[i - 1, j - 1, k] + f05[i + 1, j + 1, k])./26 + (f05[i - 1, j + 1, k] + f05[i + 1, j - 1, k])./26 + (f05[i - 1, j, k - 1] + f05[i + 1, j, k + 1])./26 + (f05[i - 1, j, k + 1] + f05[i + 1, j, k - 1])./26 + (f05[i, j - 1, k - 1] + f05[i, j + 1, k + 1])./26 + (f05[i, j - 1, k + 1] + f05[i, j + 1, k - 1])./26 + (f05[i - 1, j - 1, k - 1] + f05[i + 1, j + 1, k + 1])./26 + (f05[i - 1, j - 1, k + 1] + f05[i + 1, j + 1, k - 1])./26 + (f05[i - 1, j + 1, k - 1] + f05[i + 1, j - 1, k + 1])./26 + (f05[i + 1, j - 1, k - 1] + f05[i - 1, j + 1, k + 1])./26
          f06[i, j, k] = (f06[i - 1, j, k] + f06[i + 1, j, k])./26 + (f06[i, j - 1, k] + f06[i, j + 1, k])./26 + (f06[i, j, k - 1] + f06[i, j, k + 1])./26+ (f06[i - 1, j - 1, k] + f06[i + 1, j + 1, k])./26 + (f06[i - 1, j + 1, k] + f06[i + 1, j - 1, k])./26 + (f06[i - 1, j, k - 1] + f06[i + 1, j, k + 1])./26 + (f06[i - 1, j, k + 1] + f06[i + 1, j, k - 1])./26 + (f06[i, j - 1, k - 1] + f06[i, j + 1, k + 1])./26 + (f06[i, j - 1, k + 1] + f06[i, j + 1, k - 1])./26 + (f06[i - 1, j - 1, k - 1] + f06[i + 1, j + 1, k + 1])./26 + (f06[i - 1, j - 1, k + 1] + f06[i + 1, j + 1, k - 1])./26 + (f06[i - 1, j + 1, k - 1] + f06[i + 1, j - 1, k + 1])./26 + (f06[i + 1, j - 1, k - 1] + f06[i - 1, j + 1, k + 1])./26
          f07[i, j, k] = (f07[i - 1, j, k] + f07[i + 1, j, k])./26 + (f07[i, j - 1, k] + f07[i, j + 1, k])./26 + (f07[i, j, k - 1] + f07[i, j, k + 1])./26+ (f07[i - 1, j - 1, k] + f07[i + 1, j + 1, k])./26 + (f07[i - 1, j + 1, k] + f07[i + 1, j - 1, k])./26 + (f07[i - 1, j, k - 1] + f07[i + 1, j, k + 1])./26 + (f07[i - 1, j, k + 1] + f07[i + 1, j, k - 1])./26 + (f07[i, j - 1, k - 1] + f07[i, j + 1, k + 1])./26 + (f07[i, j - 1, k + 1] + f07[i, j + 1, k - 1])./26 + (f07[i - 1, j - 1, k - 1] + f07[i + 1, j + 1, k + 1])./26 + (f07[i - 1, j - 1, k + 1] + f07[i + 1, j + 1, k - 1])./26 + (f07[i - 1, j + 1, k - 1] + f07[i + 1, j - 1, k + 1])./26 + (f07[i + 1, j - 1, k - 1] + f07[i - 1, j + 1, k + 1])./26
          f08[i, j, k] = (f08[i - 1, j, k] + f08[i + 1, j, k])./26 + (f08[i, j - 1, k] + f08[i, j + 1, k])./26 + (f08[i, j, k - 1] + f08[i, j, k + 1])./26+ (f08[i - 1, j - 1, k] + f08[i + 1, j + 1, k])./26 + (f08[i - 1, j + 1, k] + f08[i + 1, j - 1, k])./26 + (f08[i - 1, j, k - 1] + f08[i + 1, j, k + 1])./26 + (f08[i - 1, j, k + 1] + f08[i + 1, j, k - 1])./26 + (f08[i, j - 1, k - 1] + f08[i, j + 1, k + 1])./26 + (f08[i, j - 1, k + 1] + f08[i, j + 1, k - 1])./26 + (f08[i - 1, j - 1, k - 1] + f08[i + 1, j + 1, k + 1])./26 + (f08[i - 1, j - 1, k + 1] + f08[i + 1, j + 1, k - 1])./26 + (f08[i - 1, j + 1, k - 1] + f08[i + 1, j - 1, k + 1])./26 + (f08[i + 1, j - 1, k - 1] + f08[i - 1, j + 1, k + 1])./26
          f09[i, j, k] = (f09[i - 1, j, k] + f09[i + 1, j, k])./26 + (f09[i, j - 1, k] + f09[i, j + 1, k])./26 + (f09[i, j, k - 1] + f09[i, j, k + 1])./26+ (f09[i - 1, j - 1, k] + f09[i + 1, j + 1, k])./26 + (f09[i - 1, j + 1, k] + f09[i + 1, j - 1, k])./26 + (f09[i - 1, j, k - 1] + f09[i + 1, j, k + 1])./26 + (f09[i - 1, j, k + 1] + f09[i + 1, j, k - 1])./26 + (f09[i, j - 1, k - 1] + f09[i, j + 1, k + 1])./26 + (f09[i, j - 1, k + 1] + f09[i, j + 1, k - 1])./26 + (f09[i - 1, j - 1, k - 1] + f09[i + 1, j + 1, k + 1])./26 + (f09[i - 1, j - 1, k + 1] + f09[i + 1, j + 1, k - 1])./26 + (f09[i - 1, j + 1, k - 1] + f09[i + 1, j - 1, k + 1])./26 + (f09[i + 1, j - 1, k - 1] + f09[i - 1, j + 1, k + 1])./26
          f10[i, j, k] = (f10[i - 1, j, k] + f10[i + 1, j, k])./26 + (f10[i, j - 1, k] + f10[i, j + 1, k])./26 + (f10[i, j, k - 1] + f10[i, j, k + 1])./26+ (f10[i - 1, j - 1, k] + f10[i + 1, j + 1, k])./26 + (f10[i - 1, j + 1, k] + f10[i + 1, j - 1, k])./26 + (f10[i - 1, j, k - 1] + f10[i + 1, j, k + 1])./26 + (f10[i - 1, j, k + 1] + f10[i + 1, j, k - 1])./26 + (f10[i, j - 1, k - 1] + f10[i, j + 1, k + 1])./26 + (f10[i, j - 1, k + 1] + f10[i, j + 1, k - 1])./26 + (f10[i - 1, j - 1, k - 1] + f10[i + 1, j + 1, k + 1])./26 + (f10[i - 1, j - 1, k + 1] + f10[i + 1, j + 1, k - 1])./26 + (f10[i - 1, j + 1, k - 1] + f10[i + 1, j - 1, k + 1])./26 + (f10[i + 1, j - 1, k - 1] + f10[i - 1, j + 1, k + 1])./26
          f11[i, j, k] = (f11[i - 1, j, k] + f11[i + 1, j, k])./26 + (f11[i, j - 1, k] + f11[i, j + 1, k])./26 + (f11[i, j, k - 1] + f11[i, j, k + 1])./26+ (f11[i - 1, j - 1, k] + f11[i + 1, j + 1, k])./26 + (f11[i - 1, j + 1, k] + f11[i + 1, j - 1, k])./26 + (f11[i - 1, j, k - 1] + f11[i + 1, j, k + 1])./26 + (f11[i - 1, j, k + 1] + f11[i + 1, j, k - 1])./26 + (f11[i, j - 1, k - 1] + f11[i, j + 1, k + 1])./26 + (f11[i, j - 1, k + 1] + f11[i, j + 1, k - 1])./26 + (f11[i - 1, j - 1, k - 1] + f11[i + 1, j + 1, k + 1])./26 + (f11[i - 1, j - 1, k + 1] + f11[i + 1, j + 1, k - 1])./26 + (f11[i - 1, j + 1, k - 1] + f11[i + 1, j - 1, k + 1])./26 + (f11[i + 1, j - 1, k - 1] + f11[i - 1, j + 1, k + 1])./26
          f12[i, j, k] = (f12[i - 1, j, k] + f12[i + 1, j, k])./26 + (f12[i, j - 1, k] + f12[i, j + 1, k])./26 + (f12[i, j, k - 1] + f12[i, j, k + 1])./26+ (f12[i - 1, j - 1, k] + f12[i + 1, j + 1, k])./26 + (f12[i - 1, j + 1, k] + f12[i + 1, j - 1, k])./26 + (f12[i - 1, j, k - 1] + f12[i + 1, j, k + 1])./26 + (f12[i - 1, j, k + 1] + f12[i + 1, j, k - 1])./26 + (f12[i, j - 1, k - 1] + f12[i, j + 1, k + 1])./26 + (f12[i, j - 1, k + 1] + f12[i, j + 1, k - 1])./26 + (f12[i - 1, j - 1, k - 1] + f12[i + 1, j + 1, k + 1])./26 + (f12[i - 1, j - 1, k + 1] + f12[i + 1, j + 1, k - 1])./26 + (f12[i - 1, j + 1, k - 1] + f12[i + 1, j - 1, k + 1])./26 + (f12[i + 1, j - 1, k - 1] + f12[i - 1, j + 1, k + 1])./26
          f13[i, j, k] = (f13[i - 1, j, k] + f13[i + 1, j, k])./26 + (f13[i, j - 1, k] + f13[i, j + 1, k])./26 + (f13[i, j, k - 1] + f13[i, j, k + 1])./26+ (f13[i - 1, j - 1, k] + f13[i + 1, j + 1, k])./26 + (f13[i - 1, j + 1, k] + f13[i + 1, j - 1, k])./26 + (f13[i - 1, j, k - 1] + f13[i + 1, j, k + 1])./26 + (f13[i - 1, j, k + 1] + f13[i + 1, j, k - 1])./26 + (f13[i, j - 1, k - 1] + f13[i, j + 1, k + 1])./26 + (f13[i, j - 1, k + 1] + f13[i, j + 1, k - 1])./26 + (f13[i - 1, j - 1, k - 1] + f13[i + 1, j + 1, k + 1])./26 + (f13[i - 1, j - 1, k + 1] + f13[i + 1, j + 1, k - 1])./26 + (f13[i - 1, j + 1, k - 1] + f13[i + 1, j - 1, k + 1])./26 + (f13[i + 1, j - 1, k - 1] + f13[i - 1, j + 1, k + 1])./26
          f14[i, j, k] = (f14[i - 1, j, k] + f14[i + 1, j, k])./26 + (f14[i, j - 1, k] + f14[i, j + 1, k])./26 + (f14[i, j, k - 1] + f14[i, j, k + 1])./26+ (f14[i - 1, j - 1, k] + f14[i + 1, j + 1, k])./26 + (f14[i - 1, j + 1, k] + f14[i + 1, j - 1, k])./26 + (f14[i - 1, j, k - 1] + f14[i + 1, j, k + 1])./26 + (f14[i - 1, j, k + 1] + f14[i + 1, j, k - 1])./26 + (f14[i, j - 1, k - 1] + f14[i, j + 1, k + 1])./26 + (f14[i, j - 1, k + 1] + f14[i, j + 1, k - 1])./26 + (f14[i - 1, j - 1, k - 1] + f14[i + 1, j + 1, k + 1])./26 + (f14[i - 1, j - 1, k + 1] + f14[i + 1, j + 1, k - 1])./26 + (f14[i - 1, j + 1, k - 1] + f14[i + 1, j - 1, k + 1])./26 + (f14[i + 1, j - 1, k - 1] + f14[i - 1, j + 1, k + 1])./26
          f15[i, j, k] = (f15[i - 1, j, k] + f15[i + 1, j, k])./26 + (f15[i, j - 1, k] + f15[i, j + 1, k])./26 + (f15[i, j, k - 1] + f15[i, j, k + 1])./26+ (f15[i - 1, j - 1, k] + f15[i + 1, j + 1, k])./26 + (f15[i - 1, j + 1, k] + f15[i + 1, j - 1, k])./26 + (f15[i - 1, j, k - 1] + f15[i + 1, j, k + 1])./26 + (f15[i - 1, j, k + 1] + f15[i + 1, j, k - 1])./26 + (f15[i, j - 1, k - 1] + f15[i, j + 1, k + 1])./26 + (f15[i, j - 1, k + 1] + f15[i, j + 1, k - 1])./26 + (f15[i - 1, j - 1, k - 1] + f15[i + 1, j + 1, k + 1])./26 + (f15[i - 1, j - 1, k + 1] + f15[i + 1, j + 1, k - 1])./26 + (f15[i - 1, j + 1, k - 1] + f15[i + 1, j - 1, k + 1])./26 + (f15[i + 1, j - 1, k - 1] + f15[i - 1, j + 1, k + 1])./26
          f16[i, j, k] = (f16[i - 1, j, k] + f16[i + 1, j, k])./26 + (f16[i, j - 1, k] + f16[i, j + 1, k])./26 + (f16[i, j, k - 1] + f16[i, j, k + 1])./26+ (f16[i - 1, j - 1, k] + f16[i + 1, j + 1, k])./26 + (f16[i - 1, j + 1, k] + f16[i + 1, j - 1, k])./26 + (f16[i - 1, j, k - 1] + f16[i + 1, j, k + 1])./26 + (f16[i - 1, j, k + 1] + f16[i + 1, j, k - 1])./26 + (f16[i, j - 1, k - 1] + f16[i, j + 1, k + 1])./26 + (f16[i, j - 1, k + 1] + f16[i, j + 1, k - 1])./26 + (f16[i - 1, j - 1, k - 1] + f16[i + 1, j + 1, k + 1])./26 + (f16[i - 1, j - 1, k + 1] + f16[i + 1, j + 1, k - 1])./26 + (f16[i - 1, j + 1, k - 1] + f16[i + 1, j - 1, k + 1])./26 + (f16[i + 1, j - 1, k - 1] + f16[i - 1, j + 1, k + 1])./26
          f17[i, j, k] = (f17[i - 1, j, k] + f17[i + 1, j, k])./26 + (f17[i, j - 1, k] + f17[i, j + 1, k])./26 + (f17[i, j, k - 1] + f17[i, j, k + 1])./26+ (f17[i - 1, j - 1, k] + f17[i + 1, j + 1, k])./26 + (f17[i - 1, j + 1, k] + f17[i + 1, j - 1, k])./26 + (f17[i - 1, j, k - 1] + f17[i + 1, j, k + 1])./26 + (f17[i - 1, j, k + 1] + f17[i + 1, j, k - 1])./26 + (f17[i, j - 1, k - 1] + f17[i, j + 1, k + 1])./26 + (f17[i, j - 1, k + 1] + f17[i, j + 1, k - 1])./26 + (f17[i - 1, j - 1, k - 1] + f17[i + 1, j + 1, k + 1])./26 + (f17[i - 1, j - 1, k + 1] + f17[i + 1, j + 1, k - 1])./26 + (f17[i - 1, j + 1, k - 1] + f17[i + 1, j - 1, k + 1])./26 + (f17[i + 1, j - 1, k - 1] + f17[i - 1, j + 1, k + 1])./26
          f18[i, j, k] = (f18[i - 1, j, k] + f18[i + 1, j, k])./26 + (f18[i, j - 1, k] + f18[i, j + 1, k])./26 + (f18[i, j, k - 1] + f18[i, j, k + 1])./26+ (f18[i - 1, j - 1, k] + f18[i + 1, j + 1, k])./26 + (f18[i - 1, j + 1, k] + f18[i + 1, j - 1, k])./26 + (f18[i - 1, j, k - 1] + f18[i + 1, j, k + 1])./26 + (f18[i - 1, j, k + 1] + f18[i + 1, j, k - 1])./26 + (f18[i, j - 1, k - 1] + f18[i, j + 1, k + 1])./26 + (f18[i, j - 1, k + 1] + f18[i, j + 1, k - 1])./26 + (f18[i - 1, j - 1, k - 1] + f18[i + 1, j + 1, k + 1])./26 + (f18[i - 1, j - 1, k + 1] + f18[i + 1, j + 1, k - 1])./26 + (f18[i - 1, j + 1, k - 1] + f18[i + 1, j - 1, k + 1])./26 + (f18[i + 1, j - 1, k - 1] + f18[i - 1, j + 1, k + 1])./26
          f19[i, j, k] = (f19[i - 1, j, k] + f19[i + 1, j, k])./26 + (f19[i, j - 1, k] + f19[i, j + 1, k])./26 + (f19[i, j, k - 1] + f19[i, j, k + 1])./26+ (f19[i - 1, j - 1, k] + f19[i + 1, j + 1, k])./26 + (f19[i - 1, j + 1, k] + f19[i + 1, j - 1, k])./26 + (f19[i - 1, j, k - 1] + f19[i + 1, j, k + 1])./26 + (f19[i - 1, j, k + 1] + f19[i + 1, j, k - 1])./26 + (f19[i, j - 1, k - 1] + f19[i, j + 1, k + 1])./26 + (f19[i, j - 1, k + 1] + f19[i, j + 1, k - 1])./26 + (f19[i - 1, j - 1, k - 1] + f19[i + 1, j + 1, k + 1])./26 + (f19[i - 1, j - 1, k + 1] + f19[i + 1, j + 1, k - 1])./26 + (f19[i - 1, j + 1, k - 1] + f19[i + 1, j - 1, k + 1])./26 + (f19[i + 1, j - 1, k - 1] + f19[i - 1, j + 1, k + 1])./26
          f20[i, j, k] = (f20[i - 1, j, k] + f20[i + 1, j, k])./26 + (f20[i, j - 1, k] + f20[i, j + 1, k])./26 + (f20[i, j, k - 1] + f20[i, j, k + 1])./26+ (f20[i - 1, j - 1, k] + f20[i + 1, j + 1, k])./26 + (f20[i - 1, j + 1, k] + f20[i + 1, j - 1, k])./26 + (f20[i - 1, j, k - 1] + f20[i + 1, j, k + 1])./26 + (f20[i - 1, j, k + 1] + f20[i + 1, j, k - 1])./26 + (f20[i, j - 1, k - 1] + f20[i, j + 1, k + 1])./26 + (f20[i, j - 1, k + 1] + f20[i, j + 1, k - 1])./26 + (f20[i - 1, j - 1, k - 1] + f20[i + 1, j + 1, k + 1])./26 + (f20[i - 1, j - 1, k + 1] + f20[i + 1, j + 1, k - 1])./26 + (f20[i - 1, j + 1, k - 1] + f20[i + 1, j - 1, k + 1])./26 + (f20[i + 1, j - 1, k - 1] + f20[i - 1, j + 1, k + 1])./26
          f21[i, j, k] = (f21[i - 1, j, k] + f21[i + 1, j, k])./26 + (f21[i, j - 1, k] + f21[i, j + 1, k])./26 + (f21[i, j, k - 1] + f21[i, j, k + 1])./26+ (f21[i - 1, j - 1, k] + f21[i + 1, j + 1, k])./26 + (f21[i - 1, j + 1, k] + f21[i + 1, j - 1, k])./26 + (f21[i - 1, j, k - 1] + f21[i + 1, j, k + 1])./26 + (f21[i - 1, j, k + 1] + f21[i + 1, j, k - 1])./26 + (f21[i, j - 1, k - 1] + f21[i, j + 1, k + 1])./26 + (f21[i, j - 1, k + 1] + f21[i, j + 1, k - 1])./26 + (f21[i - 1, j - 1, k - 1] + f21[i + 1, j + 1, k + 1])./26 + (f21[i - 1, j - 1, k + 1] + f21[i + 1, j + 1, k - 1])./26 + (f21[i - 1, j + 1, k - 1] + f21[i + 1, j - 1, k + 1])./26 + (f21[i + 1, j - 1, k - 1] + f21[i - 1, j + 1, k + 1])./26
          f22[i, j, k] = (f22[i - 1, j, k] + f22[i + 1, j, k])./26 + (f22[i, j - 1, k] + f22[i, j + 1, k])./26 + (f22[i, j, k - 1] + f22[i, j, k + 1])./26+ (f22[i - 1, j - 1, k] + f22[i + 1, j + 1, k])./26 + (f22[i - 1, j + 1, k] + f22[i + 1, j - 1, k])./26 + (f22[i - 1, j, k - 1] + f22[i + 1, j, k + 1])./26 + (f22[i - 1, j, k + 1] + f22[i + 1, j, k - 1])./26 + (f22[i, j - 1, k - 1] + f22[i, j + 1, k + 1])./26 + (f22[i, j - 1, k + 1] + f22[i, j + 1, k - 1])./26 + (f22[i - 1, j - 1, k - 1] + f22[i + 1, j + 1, k + 1])./26 + (f22[i - 1, j - 1, k + 1] + f22[i + 1, j + 1, k - 1])./26 + (f22[i - 1, j + 1, k - 1] + f22[i + 1, j - 1, k + 1])./26 + (f22[i + 1, j - 1, k - 1] + f22[i - 1, j + 1, k + 1])./26
          f23[i, j, k] = (f23[i - 1, j, k] + f23[i + 1, j, k])./26 + (f23[i, j - 1, k] + f23[i, j + 1, k])./26 + (f23[i, j, k - 1] + f23[i, j, k + 1])./26+ (f23[i - 1, j - 1, k] + f23[i + 1, j + 1, k])./26 + (f23[i - 1, j + 1, k] + f23[i + 1, j - 1, k])./26 + (f23[i - 1, j, k - 1] + f23[i + 1, j, k + 1])./26 + (f23[i - 1, j, k + 1] + f23[i + 1, j, k - 1])./26 + (f23[i, j - 1, k - 1] + f23[i, j + 1, k + 1])./26 + (f23[i, j - 1, k + 1] + f23[i, j + 1, k - 1])./26 + (f23[i - 1, j - 1, k - 1] + f23[i + 1, j + 1, k + 1])./26 + (f23[i - 1, j - 1, k + 1] + f23[i + 1, j + 1, k - 1])./26 + (f23[i - 1, j + 1, k - 1] + f23[i + 1, j - 1, k + 1])./26 + (f23[i + 1, j - 1, k - 1] + f23[i - 1, j + 1, k + 1])./26
          f24[i, j, k] = (f24[i - 1, j, k] + f24[i + 1, j, k])./26 + (f24[i, j - 1, k] + f24[i, j + 1, k])./26 + (f24[i, j, k - 1] + f24[i, j, k + 1])./26+ (f24[i - 1, j - 1, k] + f24[i + 1, j + 1, k])./26 + (f24[i - 1, j + 1, k] + f24[i + 1, j - 1, k])./26 + (f24[i - 1, j, k - 1] + f24[i + 1, j, k + 1])./26 + (f24[i - 1, j, k + 1] + f24[i + 1, j, k - 1])./26 + (f24[i, j - 1, k - 1] + f24[i, j + 1, k + 1])./26 + (f24[i, j - 1, k + 1] + f24[i, j + 1, k - 1])./26 + (f24[i - 1, j - 1, k - 1] + f24[i + 1, j + 1, k + 1])./26 + (f24[i - 1, j - 1, k + 1] + f24[i + 1, j + 1, k - 1])./26 + (f24[i - 1, j + 1, k - 1] + f24[i + 1, j - 1, k + 1])./26 + (f24[i + 1, j - 1, k - 1] + f24[i - 1, j + 1, k + 1])./26
          f25[i, j, k] = (f25[i - 1, j, k] + f25[i + 1, j, k])./26 + (f25[i, j - 1, k] + f25[i, j + 1, k])./26 + (f25[i, j, k - 1] + f25[i, j, k + 1])./26+ (f25[i - 1, j - 1, k] + f25[i + 1, j + 1, k])./26 + (f25[i - 1, j + 1, k] + f25[i + 1, j - 1, k])./26 + (f25[i - 1, j, k - 1] + f25[i + 1, j, k + 1])./26 + (f25[i - 1, j, k + 1] + f25[i + 1, j, k - 1])./26 + (f25[i, j - 1, k - 1] + f25[i, j + 1, k + 1])./26 + (f25[i, j - 1, k + 1] + f25[i, j + 1, k - 1])./26 + (f25[i - 1, j - 1, k - 1] + f25[i + 1, j + 1, k + 1])./26 + (f25[i - 1, j - 1, k + 1] + f25[i + 1, j + 1, k - 1])./26 + (f25[i - 1, j + 1, k - 1] + f25[i + 1, j - 1, k + 1])./26 + (f25[i + 1, j - 1, k - 1] + f25[i - 1, j + 1, k + 1])./26
          f26[i, j, k] = (f26[i - 1, j, k] + f26[i + 1, j, k])./26 + (f26[i, j - 1, k] + f26[i, j + 1, k])./26 + (f26[i, j, k - 1] + f26[i, j, k + 1])./26+ (f26[i - 1, j - 1, k] + f26[i + 1, j + 1, k])./26 + (f26[i - 1, j + 1, k] + f26[i + 1, j - 1, k])./26 + (f26[i - 1, j, k - 1] + f26[i + 1, j, k + 1])./26 + (f26[i - 1, j, k + 1] + f26[i + 1, j, k - 1])./26 + (f26[i, j - 1, k - 1] + f26[i, j + 1, k + 1])./26 + (f26[i, j - 1, k + 1] + f26[i, j + 1, k - 1])./26 + (f26[i - 1, j - 1, k - 1] + f26[i + 1, j + 1, k + 1])./26 + (f26[i - 1, j - 1, k + 1] + f26[i + 1, j + 1, k - 1])./26 + (f26[i - 1, j + 1, k - 1] + f26[i + 1, j - 1, k + 1])./26 + (f26[i + 1, j - 1, k - 1] + f26[i - 1, j + 1, k + 1])./26
          f27[i, j, k] = (f27[i - 1, j, k] + f27[i + 1, j, k])./26 + (f27[i, j - 1, k] + f27[i, j + 1, k])./26 + (f27[i, j, k - 1] + f27[i, j, k + 1])./26+ (f27[i - 1, j - 1, k] + f27[i + 1, j + 1, k])./26 + (f27[i - 1, j + 1, k] + f27[i + 1, j - 1, k])./26 + (f27[i - 1, j, k - 1] + f27[i + 1, j, k + 1])./26 + (f27[i - 1, j, k + 1] + f27[i + 1, j, k - 1])./26 + (f27[i, j - 1, k - 1] + f27[i, j + 1, k + 1])./26 + (f27[i, j - 1, k + 1] + f27[i, j + 1, k - 1])./26 + (f27[i - 1, j - 1, k - 1] + f27[i + 1, j + 1, k + 1])./26 + (f27[i - 1, j - 1, k + 1] + f27[i + 1, j + 1, k - 1])./26 + (f27[i - 1, j + 1, k - 1] + f27[i + 1, j - 1, k + 1])./26 + (f27[i + 1, j - 1, k - 1] + f27[i - 1, j + 1, k + 1])./26
        end
      end
    end
    println("80 %")
    f01[1, :, :] = f01[2, :, :]
    f01[Nx, :, :] = f01[Nx - 1, :, :]
    f01[:, 1, :] = f01[:, 2, :]
    f01[:, Ny, :] = f01[:, Ny - 1, :]
    f01[:, :, 1] = f01[:, :, 2]
    f01[:, :, Nz] = f01[:, :, Nz - 1]
    f02[1, :, :] = f02[2, :, :]
    f02[Nx, :, :] = f02[Nx - 1, :, :]
    f02[:, 1, :] = f02[:, 2, :]
    f02[:, Ny, :] = f02[:, Ny - 1, :]
    f02[:, :, 1] = f02[:, :, 2]
    f02[:, :, Nz] = f02[:, :, Nz - 1]
    f03[1, :, :] = f03[2, :, :]
    f03[Nx, :, :] = f03[Nx - 1, :, :]
    f03[:, 1, :] = f03[:, 2, :]
    f03[:, Ny, :] = f03[:, Ny - 1, :]
    f03[:, :, 1] = f03[:, :, 2]
    f03[:, :, Nz] = f03[:, :, Nz - 1]
    f04[1, :, :] = f04[2, :, :]
    f04[Nx, :, :] = f04[Nx - 1, :, :]
    f04[:, 1, :] = f04[:, 2, :]
    f04[:, Ny, :] = f04[:, Ny - 1, :]
    f04[:, :, 1] = f04[:, :, 2]
    f04[:, :, Nz] = f04[:, :, Nz - 1]
    f05[1, :, :] = f05[2, :, :]
    f05[Nx, :, :] = f05[Nx - 1, :, :]
    f05[:, 1, :] = f05[:, 2, :]
    f05[:, Ny, :] = f05[:, Ny - 1, :]
    f05[:, :, 1] = f05[:, :, 2]
    f05[:, :, Nz] = f05[:, :, Nz - 1]
    f06[1, :, :] = f06[2, :, :]
    f06[Nx, :, :] = f06[Nx - 1, :, :]
    f06[:, 1, :] = f06[:, 2, :]
    f06[:, Ny, :] = f06[:, Ny - 1, :]
    f06[:, :, 1] = f06[:, :, 2]
    f06[:, :, Nz] = f06[:, :, Nz - 1]
    f07[1, :, :] = f07[2, :, :]
    f07[Nx, :, :] = f07[Nx - 1, :, :]
    f07[:, 1, :] = f07[:, 2, :]
    f07[:, Ny, :] = f07[:, Ny - 1, :]
    f07[:, :, 1] = f07[:, :, 2]
    f07[:, :, Nz] = f07[:, :, Nz - 1]
    f08[1, :, :] = f08[2, :, :]
    f08[Nx, :, :] = f08[Nx - 1, :, :]
    f08[:, 1, :] = f08[:, 2, :]
    f08[:, Ny, :] = f08[:, Ny - 1, :]
    f08[:, :, 1] = f08[:, :, 2]
    f08[:, :, Nz] = f08[:, :, Nz - 1]
    f09[1, :, :] = f09[2, :, :]
    f09[Nx, :, :] = f09[Nx - 1, :, :]
    f09[:, 1, :] = f09[:, 2, :]
    f09[:, Ny, :] = f09[:, Ny - 1, :]
    f09[:, :, 1] = f09[:, :, 2]
    f09[:, :, Nz] = f09[:, :, Nz - 1]
    f10[1, :, :] = f10[2, :, :]
    f10[Nx, :, :] = f10[Nx - 1, :, :]
    f10[:, 1, :] = f10[:, 2, :]
    f10[:, Ny, :] = f10[:, Ny - 1, :]
    f10[:, :, 1] = f10[:, :, 2]
    f10[:, :, Nz] = f10[:, :, Nz - 1]
    f11[1, :, :] = f11[2, :, :]
    f11[Nx, :, :] = f11[Nx - 1, :, :]
    f11[:, 1, :] = f11[:, 2, :]
    f11[:, Ny, :] = f11[:, Ny - 1, :]
    f11[:, :, 1] = f11[:, :, 2]
    f11[:, :, Nz] = f11[:, :, Nz - 1]
    f12[1, :, :] = f12[2, :, :]
    f12[Nx, :, :] = f12[Nx - 1, :, :]
    f12[:, 1, :] = f12[:, 2, :]
    f12[:, Ny, :] = f12[:, Ny - 1, :]
    f12[:, :, 1] = f12[:, :, 2]
    f12[:, :, Nz] = f12[:, :, Nz - 1]
    f13[1, :, :] = f13[2, :, :]
    f13[Nx, :, :] = f13[Nx - 1, :, :]
    f13[:, 1, :] = f13[:, 2, :]
    f13[:, Ny, :] = f13[:, Ny - 1, :]
    f13[:, :, 1] = f13[:, :, 2]
    f13[:, :, Nz] = f13[:, :, Nz - 1]
    f14[1, :, :] = f14[2, :, :]
    f14[Nx, :, :] = f14[Nx - 1, :, :]
    f14[:, 1, :] = f14[:, 2, :]
    f14[:, Ny, :] = f14[:, Ny - 1, :]
    f14[:, :, 1] = f14[:, :, 2]
    f14[:, :, Nz] = f14[:, :, Nz - 1]
    f15[1, :, :] = f15[2, :, :]
    f15[Nx, :, :] = f15[Nx - 1, :, :]
    f15[:, 1, :] = f15[:, 2, :]
    f15[:, Ny, :] = f15[:, Ny - 1, :]
    f15[:, :, 1] = f15[:, :, 2]
    f15[:, :, Nz] = f15[:, :, Nz - 1]
    f16[1, :, :] = f16[2, :, :]
    f16[Nx, :, :] = f16[Nx - 1, :, :]
    f16[:, 1, :] = f16[:, 2, :]
    f16[:, Ny, :] = f16[:, Ny - 1, :]
    f16[:, :, 1] = f16[:, :, 2]
    f16[:, :, Nz] = f16[:, :, Nz - 1]
    f17[1, :, :] = f17[2, :, :]
    f17[Nx, :, :] = f17[Nx - 1, :, :]
    f17[:, 1, :] = f17[:, 2, :]
    f17[:, Ny, :] = f17[:, Ny - 1, :]
    f17[:, :, 1] = f17[:, :, 2]
    f17[:, :, Nz] = f17[:, :, Nz - 1]
    f18[1, :, :] = f18[2, :, :]
    f18[Nx, :, :] = f18[Nx - 1, :, :]
    f18[:, 1, :] = f18[:, 2, :]
    f18[:, Ny, :] = f18[:, Ny - 1, :]
    f18[:, :, 1] = f18[:, :, 2]
    f18[:, :, Nz] = f18[:, :, Nz - 1]
    f19[1, :, :] = f19[2, :, :]
    f19[Nx, :, :] = f19[Nx - 1, :, :]
    f19[:, 1, :] = f19[:, 2, :]
    f19[:, Ny, :] = f19[:, Ny - 1, :]
    f19[:, :, 1] = f19[:, :, 2]
    f19[:, :, Nz] = f19[:, :, Nz - 1]
    f20[1, :, :] = f20[2, :, :]
    f20[Nx, :, :] = f20[Nx - 1, :, :]
    f20[:, 1, :] = f20[:, 2, :]
    f20[:, Ny, :] = f20[:, Ny - 1, :]
    f20[:, :, 1] = f20[:, :, 2]
    f20[:, :, Nz] = f20[:, :, Nz - 1]
    f21[1, :, :] = f21[2, :, :]
    f21[Nx, :, :] = f21[Nx - 1, :, :]
    f21[:, 1, :] = f21[:, 2, :]
    f21[:, Ny, :] = f21[:, Ny - 1, :]
    f21[:, :, 1] = f21[:, :, 2]
    f21[:, :, Nz] = f21[:, :, Nz - 1]
    f22[1, :, :] = f22[2, :, :]
    f22[Nx, :, :] = f22[Nx - 1, :, :]
    f22[:, 1, :] = f22[:, 2, :]
    f22[:, Ny, :] = f22[:, Ny - 1, :]
    f22[:, :, 1] = f22[:, :, 2]
    f22[:, :, Nz] = f22[:, :, Nz - 1]
    f23[1, :, :] = f23[2, :, :]
    f23[Nx, :, :] = f23[Nx - 1, :, :]
    f23[:, 1, :] = f23[:, 2, :]
    f23[:, Ny, :] = f23[:, Ny - 1, :]
    f23[:, :, 1] = f23[:, :, 2]
    f23[:, :, Nz] = f23[:, :, Nz - 1]
    f24[1, :, :] = f24[2, :, :]
    f24[Nx, :, :] = f24[Nx - 1, :, :]
    f24[:, 1, :] = f24[:, 2, :]
    f24[:, Ny, :] = f24[:, Ny - 1, :]
    f24[:, :, 1] = f24[:, :, 2]
    f24[:, :, Nz] = f24[:, :, Nz - 1]
    f25[1, :, :] = f25[2, :, :]
    f25[Nx, :, :] = f25[Nx - 1, :, :]
    f25[:, 1, :] = f25[:, 2, :]
    f25[:, Ny, :] = f25[:, Ny - 1, :]
    f25[:, :, 1] = f25[:, :, 2]
    f25[:, :, Nz] = f25[:, :, Nz - 1]
    f26[1, :, :] = f26[2, :, :]
    f26[Nx, :, :] = f26[Nx - 1, :, :]
    f26[:, 1, :] = f26[:, 2, :]
    f26[:, Ny, :] = f26[:, Ny - 1, :]
    f26[:, :, 1] = f26[:, :, 2]
    f26[:, :, Nz] = f26[:, :, Nz - 1]
    f27[1, :, :] = f27[2, :, :]
    f27[Nx, :, :] = f27[Nx - 1, :, :]
    f27[:, 1, :] = f27[:, 2, :]
    f27[:, Ny, :] = f27[:, Ny - 1, :]
    f27[:, :, 1] = f27[:, :, 2]
    f27[:, :, Nz] = f27[:, :, Nz - 1]
  end
  println("90 %")
  for i = Gx
    for j = Gy
      for k = Gz
        if Total_Walls[i, j, k] == 1
          f01[i, j, k] = Rho_Initial.*Wi[1]
          f02[i, j, k] = Rho_Initial.*Wi[2]
          f03[i, j, k] = Rho_Initial.*Wi[3]
          f04[i, j, k] = Rho_Initial.*Wi[4]
          f05[i, j, k] = Rho_Initial.*Wi[5]
          f06[i, j, k] = Rho_Initial.*Wi[6]
          f07[i, j, k] = Rho_Initial.*Wi[7]
          f08[i, j, k] = Rho_Initial.*Wi[8]
          f09[i, j, k] = Rho_Initial.*Wi[9]
          f10[i, j, k] = Rho_Initial.*Wi[10]
          f11[i, j, k] = Rho_Initial.*Wi[11]
          f12[i, j, k] = Rho_Initial.*Wi[12]
          f13[i, j, k] = Rho_Initial.*Wi[13]
          f14[i, j, k] = Rho_Initial.*Wi[14]
          f15[i, j, k] = Rho_Initial.*Wi[15]
          f16[i, j, k] = Rho_Initial.*Wi[16]
          f17[i, j, k] = Rho_Initial.*Wi[17]
          f18[i, j, k] = Rho_Initial.*Wi[18]
          f19[i, j, k] = Rho_Initial.*Wi[19]
          f20[i, j, k] = Rho_Initial.*Wi[20]
          f21[i, j, k] = Rho_Initial.*Wi[21]
          f22[i, j, k] = Rho_Initial.*Wi[22]
          f23[i, j, k] = Rho_Initial.*Wi[23]
          f24[i, j, k] = Rho_Initial.*Wi[24]
          f25[i, j, k] = Rho_Initial.*Wi[25]
          f26[i, j, k] = Rho_Initial.*Wi[26]
          f27[i, j, k] = Rho_Initial.*Wi[27]
        end
      end
    end
  end
  Fx_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Fy_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Fz_Obstacle = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Drag_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  YLift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  ZLift_Coefficient = zeros(1, Maximum_Iterations + Previous_Current_Timestep)
  Fx_Obstacle[1:Previous_Current_Timestep] = Import_Data_2[1:Previous_Current_Timestep]
  Fy_Obstacle[1:Previous_Current_Timestep] = Import_Data_3[1:Previous_Current_Timestep]
  Fz_Obstacle[1:Previous_Current_Timestep] = Import_Data_4[1:Previous_Current_Timestep]
  Drag_Coefficient[1:Previous_Current_Timestep] = Import_Data_5[1:Previous_Current_Timestep]
  YLift_Coefficient[1:Previous_Current_Timestep] = Import_Data_6[1:Previous_Current_Timestep]
  ZLift_Coefficient[1:Previous_Current_Timestep] = Import_Data_7[1:Previous_Current_Timestep]
  println("100 %")
end

println(" ")
println("Reynolds Number = ", Re)
println("Mach Number = ", Ma)
println("Knudsen Number = ", sqrt.(pi/2)/(2*Omega*Obstacle_Radius))
println(" ")
println("Nu = ", Nu, " (Kinematic Viscosity)")
println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
println(" ")
println("Total Nodes = ", Nx.*Ny.*Nz)
println("Total Active Nodes = ", Nx.*Ny.*Nz - Int64(length(BBR_Indices)))
println("Total Inactive Nodes = ", Int64(length(BBR_Indices)))
println(" ")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
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

# COLLISION FUNCTION USING THE AA PATTERN ALGORITHM

# CUMULANT LBM COLLISION KERNEL
# zeroth order moment (conservation of mass)
  # Cumulant_M000 [M01]
# first order moments (conservation of momentum)
  # Cumulant_M100 [M02]
  # Cumulant_M010 [M03]
  # Cumulant_M001 [M04]
# second order moments
  # Cumulant_M110 [M05]
  # Cumulant_M101 [M06]
  # Cumulant_M011 [M07]
  # Cumulant_M200 [M08]
  # Cumulant_M020 [M09]
  # Cumulant_M002 [M10]
# third order moments
  # Cumulant_M111 [M11]
  # Cumulant_M210 [M12]
  # Cumulant_M201 [M13]
  # Cumulant_M120 [M14]
  # Cumulant_M102 [M15]
  # Cumulant_M021 [M16]
  # Cumulant_M012 [M17]
# fourth order moments
  # Cumulant_M211 [M18]
  # Cumulant_M121 [M19]
  # Cumulant_M112 [M20]
  # Cumulant_M220 [M21]
  # Cumulant_M202 [M22]
  # Cumulant_M022 [M23]
# fifth order moments
  # Cumulant_M221 [M24]
  # Cumulant_M212 [M25]
  # Cumulant_M122 [M26]
# sixth order moment
  # Cumulant_M222 [M27]
function AAP_Collision_Kernel(f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27)
  if Collision_Model == "SRT_LBM"
    Wi = [8/27, 2/27, 2/27, 2/27, 2/27, 2/27, 2/27, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/54, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216, 1/216]
    Cx = [0, 1, - 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1]
    Cy = [0, 0, 0, 1, - 1, 0, 0, 1, - 1, - 1, 1, 0, 0, 0, 0, 1, - 1, 1, - 1, 1, - 1, 1, - 1, - 1, 1, - 1, 1]
    Cz = [0, 0, 0, 0, 0, 1, - 1, 0, 0, 0, 0, 1, - 1, - 1, 1, 1, - 1, - 1, 1, 1, - 1, - 1, 1, 1, - 1, - 1, 1]
    Rho = f01 + f02 + f03 + f04 + f05 + f06 + f07 + f08 + f09 + f10 + f11 + f12 + f13 + f14 + f15 + f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27
    Ux = 1./Rho.*(f02 + f08 + f10 + f12 + f14 + f20 + f22 + f24 + f26 - f03 - f09 - f11 - f13 - f15 - f21 - f23 - f25 - f27)
    Uy = 1./Rho.*(f04 + f08 + f11 + f16 + f18 + f20 + f22 + f25 + f27 - f05 - f09 - f10 - f17 - f19 - f21 - f23 - f24 - f26)
    Uz = 1./Rho.*(f06 + f12 + f15 + f16 + f19 + f20 + f23 + f24 + f27 - f07 - f13 - f14 - f17 - f18 - f21 - f22 - f25 - f26)
    f01_EQ = Rho.*Wi[1].*(1 + 3*(Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz) + 9/2.*((Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f02_EQ = Rho.*Wi[2].*(1 + 3*(Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz) + 9/2.*((Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f03_EQ = Rho.*Wi[3].*(1 + 3*(Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz) + 9/2.*((Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f04_EQ = Rho.*Wi[4].*(1 + 3*(Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz) + 9/2.*((Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f05_EQ = Rho.*Wi[5].*(1 + 3*(Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz) + 9/2.*((Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f06_EQ = Rho.*Wi[6].*(1 + 3*(Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz) + 9/2.*((Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f07_EQ = Rho.*Wi[7].*(1 + 3*(Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz) + 9/2.*((Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f08_EQ = Rho.*Wi[8].*(1 + 3*(Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz) + 9/2.*((Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f09_EQ = Rho.*Wi[9].*(1 + 3*(Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz) + 9/2.*((Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f10_EQ = Rho.*Wi[10].*(1 + 3*(Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz) + 9/2.*((Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f11_EQ = Rho.*Wi[11].*(1 + 3*(Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz) + 9/2.*((Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f12_EQ = Rho.*Wi[12].*(1 + 3*(Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz) + 9/2.*((Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f13_EQ = Rho.*Wi[13].*(1 + 3*(Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz) + 9/2.*((Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f14_EQ = Rho.*Wi[14].*(1 + 3*(Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz) + 9/2.*((Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f15_EQ = Rho.*Wi[15].*(1 + 3*(Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz) + 9/2.*((Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f16_EQ = Rho.*Wi[16].*(1 + 3*(Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz) + 9/2.*((Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f17_EQ = Rho.*Wi[17].*(1 + 3*(Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz) + 9/2.*((Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f18_EQ = Rho.*Wi[18].*(1 + 3*(Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz) + 9/2.*((Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f19_EQ = Rho.*Wi[19].*(1 + 3*(Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz) + 9/2.*((Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f20_EQ = Rho.*Wi[20].*(1 + 3*(Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz) + 9/2.*((Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f21_EQ = Rho.*Wi[21].*(1 + 3*(Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz) + 9/2.*((Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f22_EQ = Rho.*Wi[22].*(1 + 3*(Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz) + 9/2.*((Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f23_EQ = Rho.*Wi[23].*(1 + 3*(Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz) + 9/2.*((Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f24_EQ = Rho.*Wi[24].*(1 + 3*(Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz) + 9/2.*((Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f25_EQ = Rho.*Wi[25].*(1 + 3*(Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz) + 9/2.*((Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f26_EQ = Rho.*Wi[26].*(1 + 3*(Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz) + 9/2.*((Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f27_EQ = Rho.*Wi[27].*(1 + 3*(Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz) + 9/2.*((Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
    f01 = f01 - Omega.*(f01 - f01_EQ).*Total_Fluid
    f02 = f02 - Omega.*(f02 - f02_EQ).*Total_Fluid
    f03 = f03 - Omega.*(f03 - f03_EQ).*Total_Fluid
    f04 = f04 - Omega.*(f04 - f04_EQ).*Total_Fluid
    f05 = f05 - Omega.*(f05 - f05_EQ).*Total_Fluid
    f06 = f06 - Omega.*(f06 - f06_EQ).*Total_Fluid
    f07 = f07 - Omega.*(f07 - f07_EQ).*Total_Fluid
    f08 = f08 - Omega.*(f08 - f08_EQ).*Total_Fluid
    f09 = f09 - Omega.*(f09 - f09_EQ).*Total_Fluid
    f10 = f10 - Omega.*(f10 - f10_EQ).*Total_Fluid
    f11 = f11 - Omega.*(f11 - f11_EQ).*Total_Fluid
    f12 = f12 - Omega.*(f12 - f12_EQ).*Total_Fluid
    f13 = f13 - Omega.*(f13 - f13_EQ).*Total_Fluid
    f14 = f14 - Omega.*(f14 - f14_EQ).*Total_Fluid
    f15 = f15 - Omega.*(f15 - f15_EQ).*Total_Fluid
    f16 = f16 - Omega.*(f16 - f16_EQ).*Total_Fluid
    f17 = f17 - Omega.*(f17 - f17_EQ).*Total_Fluid
    f18 = f18 - Omega.*(f18 - f18_EQ).*Total_Fluid
    f19 = f19 - Omega.*(f19 - f19_EQ).*Total_Fluid
    f20 = f20 - Omega.*(f20 - f20_EQ).*Total_Fluid
    f21 = f21 - Omega.*(f21 - f21_EQ).*Total_Fluid
    f22 = f22 - Omega.*(f22 - f22_EQ).*Total_Fluid
    f23 = f23 - Omega.*(f23 - f23_EQ).*Total_Fluid
    f24 = f24 - Omega.*(f24 - f24_EQ).*Total_Fluid
    f25 = f25 - Omega.*(f25 - f25_EQ).*Total_Fluid
    f26 = f26 - Omega.*(f26 - f26_EQ).*Total_Fluid
    f27 = f27 - Omega.*(f27 - f27_EQ).*Total_Fluid
  end
  if Collision_Model == "Cumulant_LBM"
    # Input block - from velocity space to raw moment space
    Rho = f01 + f02 + f03 + f04 + f05 + f06 + f07 + f08 + f09 + f10 + f11 + f12 + f13 + f14 + f15 + f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27
    Ux = 1./Rho.*(f02 + f08 + f10 + f12 + f14 + f20 + f22 + f24 + f26 - f03 - f09 - f11 - f13 - f15 - f21 - f23 - f25 - f27)
    Uy = 1./Rho.*(f04 + f08 + f11 + f16 + f18 + f20 + f22 + f25 + f27 - f05 - f09 - f10 - f17 - f19 - f21 - f23 - f24 - f26)
    Uz = 1./Rho.*(f06 + f12 + f15 + f16 + f19 + f20 + f23 + f24 + f27 - f07 - f13 - f14 - f17 - f18 - f21 - f22 - f25 - f26)
    Cumulant_M110raw_IN = 1./Rho.*(f08 + f09 + f20 + f21 + f22 + f23 - f10 - f11 - f24 - f25 - f26 - f27)
    Cumulant_M101raw_IN = 1./Rho.*(f12 + f13 + f20 + f21 + f24 + f25 - f14 - f15 - f22 - f23 - f26 - f27)
    Cumulant_M011raw_IN = 1./Rho.*(f16 + f17 + f20 + f21 + f26 + f27 - f18 - f19 - f22 - f23 - f24 - f25)
    Cumulant_M200raw_IN = 1./Rho.*(f02 + f03 + f08 + f09 + f10 + f11 + f12 + f13 + f14 + f15 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M020raw_IN = 1./Rho.*(f04 + f05 + f08 + f09 + f10 + f11 + f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M002raw_IN = 1./Rho.*(f06 + f07 + f12 + f13 + f14 + f15 + f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M111raw_IN = 1./Rho.*(f20 + f23 + f25 + f26 - f21 - f22 - f24 - f27)
    Cumulant_M210raw_IN = 1./Rho.*(f08 + f11 + f20 + f22 + f25 + f27 - f09 - f10 - f21 - f23 - f24 - f26)
    Cumulant_M201raw_IN = 1./Rho.*(f12 + f15 + f20 + f23 + f24 + f27 - f13 - f14 - f21 - f22 - f25 - f26)
    Cumulant_M120raw_IN = 1./Rho.*(f08 + f10 + f20 + f22 + f24 + f26 - f09 - f11 - f21 - f23 - f25 - f27)
    Cumulant_M102raw_IN = 1./Rho.*(f12 + f14 + f20 + f22 + f24 + f26 - f13 - f15 - f21 - f23 - f25 - f27)
    Cumulant_M021raw_IN = 1./Rho.*(f16 + f19 + f20 + f23 + f24 + f27 - f17 - f18 - f21 - f22 - f25 - f26)
    Cumulant_M012raw_IN = 1./Rho.*(f16 + f18 + f20 + f22 + f25 + f27 - f17 - f19 - f21 - f23 - f24 - f26)
    Cumulant_M211raw_IN = 1./Rho.*(f20 + f21 + f26 + f27 - f22 - f23 - f24 - f25)
    Cumulant_M121raw_IN = 1./Rho.*(f20 + f21 + f24 + f25 - f22 - f23 - f26 - f27)
    Cumulant_M112raw_IN = 1./Rho.*(f20 + f21 + f22 + f23 - f24 - f25 - f26 - f27)
    Cumulant_M220raw_IN = 1./Rho.*(f08 + f09 + f10 + f11 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M202raw_IN = 1./Rho.*(f12 + f13 + f14 + f15 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M022raw_IN = 1./Rho.*(f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    Cumulant_M221raw_IN = 1./Rho.*(f20 + f23 + f24 + f27 - f21 - f22 - f25 - f26)
    Cumulant_M212raw_IN = 1./Rho.*(f20 + f22 + f25 + f27 - f21 - f23 - f24 - f26)
    Cumulant_M122raw_IN = 1./Rho.*(f20 + f22 + f24 + f26 - f21 - f23 - f25 - f27)
    Cumulant_M222raw_IN = 1./Rho.*(f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27)
    # Construct input block -  from raw moment space to central moment space
    Cumulant_M110_IN = Cumulant_M110raw_IN - Ux.*Uy
    Cumulant_M101_IN = Cumulant_M101raw_IN - Ux.*Uz
    Cumulant_M011_IN = Cumulant_M011raw_IN - Uy.*Uz
    Cumulant_M200_IN = Cumulant_M200raw_IN - (Ux.^2)
    Cumulant_M020_IN = Cumulant_M020raw_IN - (Uy.^2)
    Cumulant_M002_IN = Cumulant_M002raw_IN - (Uz.^2)
    Cumulant_M111_IN = Cumulant_M111raw_IN - (Cumulant_M011_IN.*Ux + Cumulant_M101_IN.*Uy + Cumulant_M110_IN.*Uz + Ux.*Uy.*Uz)
    Cumulant_M210_IN = Cumulant_M210raw_IN - (Cumulant_M200_IN.*Uy + 2.*Cumulant_M110_IN.*Ux + (Ux.^2).*Uy)
    Cumulant_M201_IN = Cumulant_M201raw_IN - (Cumulant_M200_IN.*Uz + 2.*Cumulant_M101_IN.*Ux + (Ux.^2).*Uz)
    Cumulant_M120_IN = Cumulant_M120raw_IN - (Cumulant_M020_IN.*Ux + 2.*Cumulant_M110_IN.*Uy + Ux.*(Uy.^2))
    Cumulant_M102_IN = Cumulant_M102raw_IN - (Cumulant_M002_IN.*Ux + 2.*Cumulant_M101_IN.*Uz + Ux.*(Uz.^2))
    Cumulant_M021_IN = Cumulant_M021raw_IN - (Cumulant_M020_IN.*Uz + 2.*Cumulant_M011_IN.*Uy + (Uy.^2).*Uz)
    Cumulant_M012_IN = Cumulant_M012raw_IN - (Cumulant_M002_IN.*Uy + 2.*Cumulant_M011_IN.*Uz + Uy.*(Uz.^2))
    Cumulant_M211central_IN = Cumulant_M211raw_IN - (Cumulant_M210_IN.*Uz + Cumulant_M201_IN.*Uy + 2.*Cumulant_M111_IN.*Ux + Cumulant_M200_IN.*Uy.*Uz + 2.*Cumulant_M110_IN.*Ux.*Uz + 2.*Cumulant_M101_IN.*Ux.*Uy + Cumulant_M011_IN.*(Ux.^2) + (Ux.^2).*Uy.*Uz)
    Cumulant_M121central_IN = Cumulant_M121raw_IN - (Cumulant_M120_IN.*Uz + Cumulant_M021_IN.*Ux + 2.*Cumulant_M111_IN.*Uy + Cumulant_M020_IN.*Ux.*Uz + 2.*Cumulant_M110_IN.*Uy.*Uz + 2.*Cumulant_M011_IN.*Ux.*Uy + Cumulant_M101_IN.*(Uy.^2) + Ux.*(Uy.^2).*Uz)
    Cumulant_M112central_IN = Cumulant_M112raw_IN - (Cumulant_M102_IN.*Uy + Cumulant_M012_IN.*Ux + 2.*Cumulant_M111_IN.*Uz + Cumulant_M002_IN.*Ux.*Uy + 2.*Cumulant_M101_IN.*Uy.*Uz + 2.*Cumulant_M011_IN.*Ux.*Uz + Cumulant_M110_IN.*(Uz.^2) + Ux.*Uy.*(Uz.^2))
    Cumulant_M220central_IN = Cumulant_M220raw_IN - (2.*Cumulant_M210_IN.*Uy + 2.*Cumulant_M120_IN.*Ux + 4.*Cumulant_M110_IN.*Ux.*Uy + Cumulant_M200_IN.*(Uy.^2) + Cumulant_M020_IN.*(Ux.^2) + (Ux.^2).*(Uy.^2))
    Cumulant_M202central_IN = Cumulant_M202raw_IN - (2.*Cumulant_M201_IN.*Uz + 2.*Cumulant_M102_IN.*Ux + 4.*Cumulant_M101_IN.*Ux.*Uz + Cumulant_M200_IN.*(Uz.^2) + Cumulant_M002_IN.*(Ux.^2) + (Ux.^2).*(Uz.^2))
    Cumulant_M022central_IN = Cumulant_M022raw_IN - (2.*Cumulant_M021_IN.*Uz + 2.*Cumulant_M012_IN.*Uy + 4.*Cumulant_M011_IN.*Uy.*Uz + Cumulant_M020_IN.*(Uz.^2) + Cumulant_M002_IN.*(Uy.^2) + (Uy.^2).*(Uz.^2))
    Cumulant_M221central_IN = Cumulant_M221raw_IN - (Cumulant_M220central_IN.*Uz + 2.*Cumulant_M211central_IN.*Uy + 2.*Cumulant_M121central_IN.*Ux + 2.*Cumulant_M210_IN.*Uy.*Uz + 2.*Cumulant_M120_IN.*Ux.*Uz + Cumulant_M201_IN.*(Uy.^2) + Cumulant_M021_IN.*(Ux.^2) + 4.*Cumulant_M111_IN.*Ux.*Uy + Cumulant_M200_IN.*(Uy.^2).*Uz + Cumulant_M020_IN.*(Ux.^2).*Uz + 4.*Cumulant_M110_IN.*Ux.*Uy.*Uz + 2.*Cumulant_M101_IN.*Ux.*(Uy.^2) + 2.*Cumulant_M011_IN.*(Ux.^2).*Uy + (Ux.^2).*(Uy.^2).*Uz)
    Cumulant_M212central_IN = Cumulant_M212raw_IN - (Cumulant_M202central_IN.*Uy + 2.*Cumulant_M211central_IN.*Uz + 2.*Cumulant_M112central_IN.*Ux + 2.*Cumulant_M201_IN.*Uy.*Uz + 2.*Cumulant_M102_IN.*Ux.*Uy + Cumulant_M210_IN.*(Uz.^2) + Cumulant_M012_IN.*(Ux.^2) + 4.*Cumulant_M111_IN.*Ux.*Uz + Cumulant_M200_IN.*Uy.*(Uz.^2) + Cumulant_M002_IN.*(Ux.^2).*Uy + 4.*Cumulant_M101_IN.*Ux.*Uy.*Uz + 2.*Cumulant_M110_IN.*Ux.*(Uz.^2) + 2.*Cumulant_M011_IN.*(Ux.^2).*Uz + (Ux.^2).*(Uy.^2).*Uy)
    Cumulant_M122central_IN = Cumulant_M122raw_IN - (Cumulant_M022central_IN.*Ux + 2.*Cumulant_M121central_IN.*Uz + 2.*Cumulant_M112central_IN.*Uy + 2.*Cumulant_M021_IN.*Ux.*Uz + 2.*Cumulant_M012_IN.*Ux.*Uy + Cumulant_M120_IN.*(Uz.^2) + Cumulant_M102_IN.*(Uy.^2) + 4.*Cumulant_M111_IN.*Uy.*Uz + Cumulant_M020_IN.*Ux.*(Uz.^2) + Cumulant_M002_IN.*Ux.*(Uy.^2) + 4.*Cumulant_M011_IN.*Ux.*Uy.*Uz + 2.*Cumulant_M110_IN.*Uy.*(Uz.^2) + 2.*Cumulant_M101_IN.*(Uy.^2).*Uz + (Ux.^2).*(Uy.^2).*Ux)
    Cumulant_M222central_IN = Cumulant_M222raw_IN - (2.*Cumulant_M221central_IN.*Uz + 2.*Cumulant_M212central_IN.*Uy + 2.*Cumulant_M122central_IN.*Ux + Cumulant_M220central_IN.*(Uz.^2) + Cumulant_M202central_IN.*(Uy.^2) + Cumulant_M022central_IN.*(Ux.^2) + 4.*Cumulant_M211central_IN.*Uy.*Uz + 4.*Cumulant_M121central_IN.*Ux.*Uz + 4.*Cumulant_M112central_IN.*Ux.*Uy + 2.*Cumulant_M210_IN.*Uy.*(Uz.^2) + 2.*Cumulant_M201_IN.*(Uy.^2).*Uz + 2.*Cumulant_M120_IN.*Ux.*(Uz.^2) + 2.*Cumulant_M102_IN.*Ux.*(Uy.^2) + 2.*Cumulant_M021_IN.*(Ux.^2).*Uz + 2.*Cumulant_M012_IN.*(Ux.^2).*Uy + 8.*Cumulant_M111_IN.*Ux.*Uy.*Uz + Cumulant_M200_IN.*(Uy.^2).*(Uz.^2) + Cumulant_M020_IN.*(Ux.^2).*(Uz.^2) + Cumulant_M002_IN.*(Ux.^2).*(Uy.^2) + 4.*Cumulant_M110_IN.*Ux.*Uy.*(Uz.^2) + 4.*Cumulant_M101_IN.*Ux.*(Uy.^2).*Uz + 4.*Cumulant_M011_IN.*(Ux.^2).*Uy.*Uz + (Ux.^2).*(Uy.^2).*(Uz.^2))
    # Construct input block - from central moment space to cumulant space
    Cumulant_M211_IN = Cumulant_M211central_IN - Cumulant_M200_IN.*Cumulant_M011_IN - 2.*Cumulant_M110_IN.*Cumulant_M101_IN
    Cumulant_M121_IN = Cumulant_M121central_IN - Cumulant_M020_IN.*Cumulant_M101_IN - 2.*Cumulant_M110_IN.*Cumulant_M011_IN
    Cumulant_M112_IN = Cumulant_M112central_IN - Cumulant_M002_IN.*Cumulant_M110_IN - 2.*Cumulant_M101_IN.*Cumulant_M011_IN
    Cumulant_M220_IN = Cumulant_M220central_IN - Cumulant_M200_IN.*Cumulant_M020_IN - 2.*(Cumulant_M110_IN.^2)
    Cumulant_M202_IN = Cumulant_M202central_IN - Cumulant_M200_IN.*Cumulant_M002_IN - 2.*(Cumulant_M101_IN.^2)
    Cumulant_M022_IN = Cumulant_M022central_IN - Cumulant_M020_IN.*Cumulant_M002_IN - 2.*(Cumulant_M011_IN.^2)
    Cumulant_M221_IN = Cumulant_M221central_IN - Cumulant_M200_IN.*Cumulant_M021_IN - Cumulant_M020_IN.*Cumulant_M201_IN - 4.*Cumulant_M110_IN.*Cumulant_M111_IN - 2.*(Cumulant_M120_IN.*Cumulant_M101_IN + Cumulant_M210_IN.*Cumulant_M011_IN)
    Cumulant_M212_IN = Cumulant_M212central_IN - Cumulant_M200_IN.*Cumulant_M012_IN - Cumulant_M002_IN.*Cumulant_M210_IN - 4.*Cumulant_M101_IN.*Cumulant_M111_IN - 2.*(Cumulant_M102_IN.*Cumulant_M110_IN + Cumulant_M201_IN.*Cumulant_M011_IN)
    Cumulant_M122_IN = Cumulant_M122central_IN - Cumulant_M020_IN.*Cumulant_M102_IN - Cumulant_M002_IN.*Cumulant_M120_IN - 4.*Cumulant_M011_IN.*Cumulant_M111_IN - 2.*(Cumulant_M012_IN.*Cumulant_M110_IN + Cumulant_M021_IN.*Cumulant_M101_IN)
    Cumulant_M222_IN = Cumulant_M222central_IN - 4.*(Cumulant_M111_IN.^2) - Cumulant_M200_IN.*Cumulant_M022central_IN - Cumulant_M020_IN.*Cumulant_M202central_IN - Cumulant_M002_IN.*Cumulant_M220central_IN - 4.*(Cumulant_M211central_IN.*Cumulant_M011_IN + Cumulant_M121central_IN.*Cumulant_M101_IN + Cumulant_M112central_IN.*Cumulant_M110_IN) - 2.*(Cumulant_M210_IN.*Cumulant_M012_IN + Cumulant_M201_IN.*Cumulant_M021_IN + Cumulant_M120_IN.*Cumulant_M102_IN) + 16.*Cumulant_M110_IN.*Cumulant_M101_IN.*Cumulant_M011_IN + 4.*((Cumulant_M110_IN.^2).*Cumulant_M002_IN + (Cumulant_M101_IN.^2).*Cumulant_M020_IN + (Cumulant_M011_IN.^2).*Cumulant_M200_IN) + 2.*Cumulant_M200_IN.*Cumulant_M020_IN.*Cumulant_M002_IN
    Cumulant_Nsecondorder_xy_IN = Cumulant_M200_IN - Cumulant_M020_IN
    Cumulant_Nsecondorder_xz_IN = Cumulant_M200_IN - Cumulant_M002_IN
    Cumulant_Esecondorder_IN = Cumulant_M200_IN + Cumulant_M020_IN + Cumulant_M002_IN
    Cumulant_Qthirdorder1_IN = Cumulant_M210_IN + Cumulant_M012_IN
    Cumulant_Qthirdorder2_IN = Cumulant_M201_IN + Cumulant_M021_IN
    Cumulant_Qthirdorder3_IN = Cumulant_M120_IN + Cumulant_M102_IN
    Cumulant_Qthirdorder4_IN = Cumulant_M210_IN - Cumulant_M012_IN
    Cumulant_Qthirdorder5_IN = Cumulant_M201_IN - Cumulant_M021_IN
    Cumulant_Qthirdorder6_IN = Cumulant_M120_IN - Cumulant_M102_IN
    Cumulant_Afourthorder1_IN = Cumulant_M220_IN - 2.*Cumulant_M202_IN + Cumulant_M022_IN
    Cumulant_Afourthorder2_IN = Cumulant_M220_IN + Cumulant_M202_IN - 2.*Cumulant_M022_IN
    Cumulant_Afourthorder3_IN = Cumulant_M220_IN + Cumulant_M202_IN + Cumulant_M022_IN
    # First derivatives
    Combined_Cumulant_FirstDerivatives_xy = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xz = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xyz1 = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xyz2 = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xyz3 = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xyz4 = zeros(Nx, Ny, Nz)
    Dx_Uy_Dy_Ux = zeros(Nx, Ny, Nz)
    Dx_Uz_Dz_Ux = zeros(Nx, Ny, Nz)
    Dy_Uz_Dz_Uy = zeros(Nx, Ny, Nz)
    if Cumulant_First_Order_Velocity_Derivatives == 1
      Dx_Ux = - Cumulant_Omega[1]./(2.*Rho).*(2.*Cumulant_M200_IN - Cumulant_M020_IN - Cumulant_M002_IN) - Cumulant_Omega[2]./(2.*Rho).*(Cumulant_Esecondorder_IN - 1)
      Dy_Uy = Dx_Ux + 3.*Cumulant_Omega[1]./(2.*Rho).*Cumulant_Nsecondorder_xy_IN
      Dz_Uz = Dx_Ux + 3.*Cumulant_Omega[1]./(2.*Rho).*Cumulant_Nsecondorder_xz_IN
      Combined_Cumulant_FirstDerivatives_xy = (Ux.^2).*Dx_Ux - (Uy.^2).*Dy_Uy
      Combined_Cumulant_FirstDerivatives_xz = (Ux.^2).*Dx_Ux - (Uz.^2).*Dz_Uz
      Combined_Cumulant_FirstDerivatives_xyz1 = (Ux.^2).*Dx_Ux + (Uy.^2).*Dy_Uy + (Uz.^2).*Dz_Uz
      Combined_Cumulant_FirstDerivatives_xyz2 = Dx_Ux - 2.*Dy_Uy + Dz_Uz
      Combined_Cumulant_FirstDerivatives_xyz3 = Dx_Ux + Dy_Uy - 2.*Dz_Uz
      Combined_Cumulant_FirstDerivatives_xyz4 = Dx_Ux + Dy_Uy + Dz_Uz
      # Mixed derivatives
      Dx_Uy_Dy_Ux = - 3.*Cumulant_Omega[1].*Cumulant_M110_IN./Rho
      Dx_Uz_Dz_Ux = - 3.*Cumulant_Omega[1].*Cumulant_M101_IN./Rho
      Dy_Uz_Dz_Uy = - 3.*Cumulant_Omega[1].*Cumulant_M011_IN./Rho
    end
    # Second derivatives
    Combined_Cumulant_SecondDerivatives_xy = zeros(Nx, Ny, Nz)
    Combined_Cumulant_SecondDerivatives_xz = zeros(Nx, Ny, Nz)
    Combined_Cumulant_SecondDerivatives_xyz = zeros(Nx, Ny, Nz)
    if Cumulant_Second_Order_Velocity_Derivatives == 1
      Dxx_Ux = (circshift(Dx_Ux, [1, 0, 0]) - circshift(Dx_Ux, [ - 1, 0, 0]))./2
      Dyy_Uy = (circshift(Dy_Uy, [0, 1, 0]) - circshift(Dy_Uy, [0, - 1, 0]))./2
      Dzz_Uz = (circshift(Dz_Uz, [0, 0, 1]) - circshift(Dz_Uz, [0, 0, - 1]))./2
      Dxx_Ux[1, :, :] = Dxx_Ux[2, :, :]
      Dxx_Ux[Nx, :, :] = Dxx_Ux[Nx - 1, :, :]
      Dxx_Ux[:, 1, :] = Dxx_Ux[:, 2, :]
      Dxx_Ux[:, Ny, :] = Dxx_Ux[:, Ny - 1, :]
      Dxx_Ux[:, :, 1] = Dxx_Ux[:, :, 2]
      Dxx_Ux[:, :, Nz] = Dxx_Ux[:, :, Nz - 1]
      Dyy_Uy[1, :, :] = Dyy_Uy[2, :, :]
      Dyy_Uy[Nx, :, :] = Dyy_Uy[Nx - 1, :, :]
      Dyy_Uy[:, 1, :] = Dyy_Uy[:, 2, :]
      Dyy_Uy[:, Ny, :] = Dyy_Uy[:, Ny - 1, :]
      Dyy_Uy[:, :, 1] = Dyy_Uy[:, :, 2]
      Dyy_Uy[:, :, Nz] = Dyy_Uy[:, :, Nz - 1]
      Dzz_Uz[1, :, :] = Dzz_Uz[2, :, :]
      Dzz_Uz[Nx, :, :] = Dzz_Uz[Nx - 1, :, :]
      Dzz_Uz[:, 1, :] = Dzz_Uz[:, 2, :]
      Dzz_Uz[:, Ny, :] = Dzz_Uz[:, Ny - 1, :]
      Dzz_Uz[:, :, 1] = Dzz_Uz[:, :, 2]
      Dzz_Uz[:, :, Nz] = Dzz_Uz[:, :, Nz - 1]
      Combined_Cumulant_SecondDerivatives_xy = (Dx_Ux.^2) + Ux.*Dxx_Ux - (Dy_Uy.^2) - Uy.*Dyy_Uy
      Combined_Cumulant_SecondDerivatives_xz = (Dx_Ux.^2) + Ux.*Dxx_Ux - (Dz_Uz.^2) - Uz.*Dzz_Uz
      Combined_Cumulant_SecondDerivatives_xyz = (Dx_Ux.^2) + Ux.*Dxx_Ux + (Dy_Uy.^2) + Uy.*Dyy_Uy + (Dz_Uz.^2) + Uz.*Dzz_Uz
    end
    # Relaxation block - in cumulant space
    Cumulant_M110_OUT = (1 - Cumulant_Omega[1].*Total_Fluid).*Cumulant_M110_IN
    Cumulant_M101_OUT = (1 - Cumulant_Omega[1].*Total_Fluid).*Cumulant_M101_IN
    Cumulant_M011_OUT = (1 - Cumulant_Omega[1].*Total_Fluid).*Cumulant_M011_IN
    Cumulant_Nsecondorder_xy_OUT = (1 - Cumulant_Omega[1].*Total_Fluid).*Cumulant_Nsecondorder_xy_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[1]).*Combined_Cumulant_FirstDerivatives_xy.*Cumulant_First_Order_Velocity_Derivatives.*Total_Fluid + 2.*Rho.*Cumulant_Omega[1].*((((1./Cumulant_Omega[1]) - 1/2).^2) - 1/12).*Combined_Cumulant_SecondDerivatives_xy.*Cumulant_Second_Order_Velocity_Derivatives.*Total_Fluid
    Cumulant_Nsecondorder_xz_OUT = (1 - Cumulant_Omega[1].*Total_Fluid).*Cumulant_Nsecondorder_xz_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[1]).*Combined_Cumulant_FirstDerivatives_xz.*Cumulant_First_Order_Velocity_Derivatives.*Total_Fluid + 2.*Rho.*Cumulant_Omega[1].*((((1./Cumulant_Omega[1]) - 1/2).^2) - 1/12).*Combined_Cumulant_SecondDerivatives_xz.*Cumulant_Second_Order_Velocity_Derivatives.*Total_Fluid
    Cumulant_Esecondorder_OUT = Cumulant_Omega[2].*Total_Fluid + (1 - Cumulant_Omega[2].*Total_Fluid).*Cumulant_Esecondorder_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[2]).*Combined_Cumulant_FirstDerivatives_xyz1.*Cumulant_First_Order_Velocity_Derivatives.*Total_Fluid + (1./(3.*Cumulant_Omega[1])).*(6 - 3.*(Cumulant_Omega[1] + Cumulant_Omega[2]) + Cumulant_Omega[1].*Cumulant_Omega[2]).*Combined_Cumulant_SecondDerivatives_xyz.*Cumulant_Second_Order_Velocity_Derivatives.*Total_Fluid
    Cumulant_Qthirdorder1_OUT = (1 - Cumulant_Omega[3].*Total_Fluid).*Cumulant_Qthirdorder1_IN
    Cumulant_Qthirdorder2_OUT = (1 - Cumulant_Omega[3].*Total_Fluid).*Cumulant_Qthirdorder2_IN
    Cumulant_Qthirdorder3_OUT = (1 - Cumulant_Omega[3].*Total_Fluid).*Cumulant_Qthirdorder3_IN
    Cumulant_Qthirdorder4_OUT = (1 - Cumulant_Omega[4].*Total_Fluid).*Cumulant_Qthirdorder4_IN
    Cumulant_Qthirdorder5_OUT = (1 - Cumulant_Omega[4].*Total_Fluid).*Cumulant_Qthirdorder5_IN
    Cumulant_Qthirdorder6_OUT = (1 - Cumulant_Omega[4].*Total_Fluid).*Cumulant_Qthirdorder6_IN
    Cumulant_M111_OUT = (1 - Cumulant_Omega[5].*Total_Fluid).*Cumulant_M111_IN
    Cumulant_Afourthorder1_OUT = (1 - Cumulant_Omega[6].*Total_Fluid).*Cumulant_Afourthorder1_IN + 2./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[6].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz2.*Total_Fluid
    Cumulant_Afourthorder2_OUT = (1 - Cumulant_Omega[6].*Total_Fluid).*Cumulant_Afourthorder2_IN + 2./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[6].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz3.*Total_Fluid
    Cumulant_Afourthorder3_OUT = (1 - Cumulant_Omega[7].*Total_Fluid).*Cumulant_Afourthorder3_IN - 4./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[7].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz4.*Total_Fluid
    Cumulant_M211_OUT = (1 - Cumulant_Omega[8].*Total_Fluid).*Cumulant_M221_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dy_Uz_Dz_Uy.*Total_Fluid
    Cumulant_M121_OUT = (1 - Cumulant_Omega[8].*Total_Fluid).*Cumulant_M121_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dx_Uz_Dz_Ux.*Total_Fluid
    Cumulant_M112_OUT = (1 - Cumulant_Omega[8].*Total_Fluid).*Cumulant_M112_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dx_Uy_Dy_Ux.*Total_Fluid
    Cumulant_M221_OUT = (1 - Cumulant_Omega[9].*Total_Fluid).*Cumulant_M221_IN
    Cumulant_M212_OUT = (1 - Cumulant_Omega[9].*Total_Fluid).*Cumulant_M212_IN
    Cumulant_M122_OUT = (1 - Cumulant_Omega[9].*Total_Fluid).*Cumulant_M122_IN
    Cumulant_M222_OUT = (1 - Cumulant_Omega[10].*Total_Fluid).*Cumulant_M222_IN
    # Construct output block - from cumulant space to central moment space
    Cumulant_M200_OUT = 1./3.*(Cumulant_Esecondorder_OUT + Cumulant_Nsecondorder_xy_OUT + Cumulant_Nsecondorder_xz_OUT)
    Cumulant_M020_OUT = 1./3.*(Cumulant_Esecondorder_OUT - 2.*Cumulant_Nsecondorder_xy_OUT + Cumulant_Nsecondorder_xz_OUT)
    Cumulant_M002_OUT = 1./3.*(Cumulant_Esecondorder_OUT + Cumulant_Nsecondorder_xy_OUT - 2.*Cumulant_Nsecondorder_xz_OUT)
    Cumulant_M210_OUT = 1./2.*(Cumulant_Qthirdorder1_OUT + Cumulant_Qthirdorder4_OUT)
    Cumulant_M201_OUT = 1./2.*(Cumulant_Qthirdorder2_OUT + Cumulant_Qthirdorder5_OUT)
    Cumulant_M120_OUT = 1./2.*(Cumulant_Qthirdorder3_OUT + Cumulant_Qthirdorder6_OUT)
    Cumulant_M102_OUT = 1./2.*(Cumulant_Qthirdorder3_OUT - Cumulant_Qthirdorder6_OUT)
    Cumulant_M021_OUT = 1./2.*(Cumulant_Qthirdorder2_OUT - Cumulant_Qthirdorder5_OUT)
    Cumulant_M012_OUT = 1./2.*(Cumulant_Qthirdorder1_OUT - Cumulant_Qthirdorder4_OUT)
    Cumulant_M220_OUT = 1./3.*(Cumulant_Afourthorder3_OUT + Cumulant_Afourthorder1_OUT + Cumulant_Afourthorder2_OUT)
    Cumulant_M202_OUT = 1./3.*(Cumulant_Afourthorder3_OUT - Cumulant_Afourthorder1_OUT)
    Cumulant_M022_OUT = 1./3.*(Cumulant_Afourthorder3_OUT - Cumulant_Afourthorder2_OUT)
    Cumulant_M211central_OUT = Cumulant_M211_OUT + Cumulant_M200_OUT.*Cumulant_M011_OUT + 2.*Cumulant_M110_OUT.*Cumulant_M101_OUT
    Cumulant_M121central_OUT = Cumulant_M121_OUT + Cumulant_M020_OUT.*Cumulant_M101_OUT + 2.*Cumulant_M110_OUT.*Cumulant_M011_OUT
    Cumulant_M112central_OUT = Cumulant_M112_OUT + Cumulant_M002_OUT.*Cumulant_M110_OUT + 2.*Cumulant_M101_OUT.*Cumulant_M011_OUT
    Cumulant_M220central_OUT = Cumulant_M220_OUT + Cumulant_M200_OUT.*Cumulant_M020_OUT + 2.*(Cumulant_M110_OUT.^2)
    Cumulant_M202central_OUT = Cumulant_M202_OUT + Cumulant_M200_OUT.*Cumulant_M002_OUT + 2.*(Cumulant_M101_OUT.^2)
    Cumulant_M022central_OUT = Cumulant_M022_OUT + Cumulant_M020_OUT.*Cumulant_M002_OUT + 2.*(Cumulant_M011_OUT.^2)
    Cumulant_M221central_OUT = Cumulant_M221_OUT + Cumulant_M200_OUT.*Cumulant_M021_OUT + Cumulant_M020_OUT.*Cumulant_M201_OUT + 4.*Cumulant_M110_OUT.*Cumulant_M111_OUT + 2.*(Cumulant_M120_OUT.*Cumulant_M101_OUT + Cumulant_M210_OUT.*Cumulant_M011_OUT)
    Cumulant_M212central_OUT = Cumulant_M212_OUT + Cumulant_M200_OUT.*Cumulant_M012_OUT + Cumulant_M002_OUT.*Cumulant_M210_OUT + 4.*Cumulant_M101_OUT.*Cumulant_M111_OUT + 2.*(Cumulant_M102_OUT.*Cumulant_M110_OUT + Cumulant_M201_OUT.*Cumulant_M011_OUT)
    Cumulant_M122central_OUT = Cumulant_M122_OUT + Cumulant_M020_OUT.*Cumulant_M102_OUT + Cumulant_M002_OUT.*Cumulant_M120_OUT + 4.*Cumulant_M011_OUT.*Cumulant_M111_OUT + 2.*(Cumulant_M012_OUT.*Cumulant_M110_OUT + Cumulant_M021_OUT.*Cumulant_M101_OUT)
    Cumulant_M222central_OUT = Cumulant_M222_OUT + (4.*(Cumulant_M111_OUT.^2) + Cumulant_M200_OUT.*Cumulant_M022central_OUT + Cumulant_M020_OUT.*Cumulant_M202central_OUT + Cumulant_M002_OUT.*Cumulant_M220central_OUT + 4.*(Cumulant_M211central_OUT.*Cumulant_M011_OUT + Cumulant_M121central_OUT.*Cumulant_M101_OUT + Cumulant_M112central_OUT.*Cumulant_M110_OUT) + 2.*(Cumulant_M210_OUT.*Cumulant_M012_OUT + Cumulant_M201_OUT.*Cumulant_M021_OUT + Cumulant_M120_OUT.*Cumulant_M102_OUT)) - 16.*Cumulant_M110_OUT.*Cumulant_M101_OUT.*Cumulant_M011_OUT - 4.*((Cumulant_M110_OUT.^2).*Cumulant_M002_OUT + (Cumulant_M101_OUT.^2).*Cumulant_M020_OUT + (Cumulant_M011_OUT.^2).*Cumulant_M200_OUT) -  2.*Cumulant_M200_OUT.*Cumulant_M020_OUT.*Cumulant_M002_OUT
    # Construct output block - from central moment space to raw moment space
    Cumulant_M110raw_OUT = Cumulant_M110_OUT + Ux.*Uy
    Cumulant_M101raw_OUT = Cumulant_M101_OUT + Ux.*Uz
    Cumulant_M011raw_OUT = Cumulant_M011_OUT + Uy.*Uz
    Cumulant_M200raw_OUT = Cumulant_M200_OUT + (Ux.^2)
    Cumulant_M020raw_OUT = Cumulant_M020_OUT + (Uy.^2)
    Cumulant_M002raw_OUT = Cumulant_M002_OUT + (Uz.^2)
    Cumulant_M111raw_OUT = Cumulant_M111_OUT + (Cumulant_M011_OUT.*Ux + Cumulant_M101_OUT.*Uy + Cumulant_M110_OUT.*Uz + Ux.*Uy.*Uz)
    Cumulant_M210raw_OUT = Cumulant_M210_OUT + (Cumulant_M200_OUT.*Uy + 2.*Cumulant_M110_OUT.*Ux + (Ux.^2).*Uy)
    Cumulant_M201raw_OUT = Cumulant_M201_OUT + (Cumulant_M200_OUT.*Uz + 2.*Cumulant_M101_OUT.*Ux + (Ux.^2).*Uz)
    Cumulant_M120raw_OUT = Cumulant_M120_OUT + (Cumulant_M020_OUT.*Ux + 2.*Cumulant_M110_OUT.*Uy + Ux.*(Uy.^2))
    Cumulant_M102raw_OUT = Cumulant_M102_OUT + (Cumulant_M002_OUT.*Ux + 2.*Cumulant_M101_OUT.*Uz + Ux.*(Uz.^2))
    Cumulant_M021raw_OUT = Cumulant_M021_OUT + (Cumulant_M020_OUT.*Uz + 2.*Cumulant_M011_OUT.*Uy + (Uy.^2).*Uz)
    Cumulant_M012raw_OUT = Cumulant_M012_OUT + (Cumulant_M002_OUT.*Uy + 2.*Cumulant_M011_OUT.*Uz + Uy.*(Uz.^2))
    Cumulant_M211raw_OUT = Cumulant_M211central_OUT + (Cumulant_M210_OUT.*Uz + Cumulant_M201_OUT.*Uy + 2.*Cumulant_M111_OUT.*Ux + Cumulant_M200_OUT.*Uy.*Uz + 2.*Cumulant_M110_OUT.*Ux.*Uz + 2.*Cumulant_M101_OUT.*Ux.*Uy + Cumulant_M011_OUT.*(Ux.^2) + (Ux.^2).*Uy.*Uz)
    Cumulant_M121raw_OUT = Cumulant_M121central_OUT + (Cumulant_M120_OUT.*Uz + Cumulant_M021_OUT.*Ux + 2.*Cumulant_M111_OUT.*Uy + Cumulant_M020_OUT.*Ux.*Uz + 2.*Cumulant_M110_OUT.*Uy.*Uz + 2.*Cumulant_M011_OUT.*Ux.*Uy + Cumulant_M101_OUT.*(Uy.^2) + Ux.*(Uy.^2).*Uz)
    Cumulant_M112raw_OUT = Cumulant_M112central_OUT + (Cumulant_M102_OUT.*Uy + Cumulant_M012_OUT.*Ux + 2.*Cumulant_M111_OUT.*Uz + Cumulant_M002_OUT.*Ux.*Uy + 2.*Cumulant_M101_OUT.*Uy.*Uz + 2.*Cumulant_M011_OUT.*Ux.*Uz + Cumulant_M110_OUT.*(Uz.^2) + Ux.*Uy.*(Uz.^2))
    Cumulant_M220raw_OUT = Cumulant_M220central_OUT + (2.*Cumulant_M210_OUT.*Uy + 2.*Cumulant_M120_OUT.*Ux + 4.*Cumulant_M110_OUT.*Ux.*Uy + Cumulant_M200_OUT.*(Uy.^2) + Cumulant_M020_OUT.*(Ux.^2) + (Ux.^2).*(Uy.^2))
    Cumulant_M202raw_OUT = Cumulant_M202central_OUT + (2.*Cumulant_M201_OUT.*Uz + 2.*Cumulant_M102_OUT.*Ux + 4.*Cumulant_M101_OUT.*Ux.*Uz + Cumulant_M200_OUT.*(Uz.^2) + Cumulant_M002_OUT.*(Ux.^2) + (Ux.^2).*(Uz.^2))
    Cumulant_M022raw_OUT = Cumulant_M022central_OUT + (2.*Cumulant_M021_OUT.*Uz + 2.*Cumulant_M012_OUT.*Uy + 4.*Cumulant_M011_OUT.*Uy.*Uz + Cumulant_M020_OUT.*(Uz.^2) + Cumulant_M002_OUT.*(Uy.^2) + (Uy.^2).*(Uz.^2))
    Cumulant_M221raw_OUT = Cumulant_M221central_OUT + (Cumulant_M220central_OUT.*Uz + 2.*Cumulant_M211central_OUT.*Uy + 2.*Cumulant_M121central_OUT.*Ux + 2.*Cumulant_M210_OUT.*Uy.*Uz + 2.*Cumulant_M120_OUT.*Ux.*Uz + Cumulant_M201_OUT.*(Uy.^2) + Cumulant_M021_OUT.*(Ux.^2) + 4.*Cumulant_M111_OUT.*Ux.*Uy + Cumulant_M200_OUT.*(Uy.^2).*Uz + Cumulant_M020_OUT.*(Ux.^2).*Uz + 4.*Cumulant_M110_OUT.*Ux.*Uy.*Uz + 2.*Cumulant_M101_OUT.*Ux.*(Uy.^2) + 2.*Cumulant_M011_OUT.*(Ux.^2).*Uy + (Ux.^2).*(Uy.^2).*Uz)
    Cumulant_M212raw_OUT = Cumulant_M212central_OUT + (Cumulant_M202central_OUT.*Uy + 2.*Cumulant_M211central_OUT.*Uz + 2.*Cumulant_M112central_OUT.*Ux + 2.*Cumulant_M201_OUT.*Uy.*Uz + 2.*Cumulant_M102_OUT.*Ux.*Uy + Cumulant_M210_OUT.*(Uz.^2) + Cumulant_M012_OUT.*(Ux.^2) + 4.*Cumulant_M111_OUT.*Ux.*Uz + Cumulant_M200_OUT.*Uy.*(Uz.^2) + Cumulant_M002_OUT.*(Ux.^2).*Uy + 4.*Cumulant_M101_OUT.*Ux.*Uy.*Uz + 2.*Cumulant_M110_OUT.*Ux.*(Uz.^2) + 2.*Cumulant_M011_OUT.*(Ux.^2).*Uz + (Ux.^2).*(Uy.^2).*Uy)
    Cumulant_M122raw_OUT = Cumulant_M122central_OUT + (Cumulant_M022central_OUT.*Ux + 2.*Cumulant_M121central_OUT.*Uz + 2.*Cumulant_M112central_OUT.*Uy + 2.*Cumulant_M021_OUT.*Ux.*Uz + 2.*Cumulant_M012_OUT.*Ux.*Uy + Cumulant_M120_OUT.*(Uz.^2) + Cumulant_M102_OUT.*(Uy.^2) + 4.*Cumulant_M111_OUT.*Uy.*Uz + Cumulant_M020_OUT.*Ux.*(Uz.^2) + Cumulant_M002_OUT.*Ux.*(Uy.^2) + 4.*Cumulant_M011_OUT.*Ux.*Uy.*Uz + 2.*Cumulant_M110_OUT.*Uy.*(Uz.^2) + 2.*Cumulant_M101_OUT.*(Uy.^2).*Uz + (Ux.^2).*(Uy.^2).*Ux)
    Cumulant_M222raw_OUT = Cumulant_M222central_OUT + (2.*Cumulant_M221central_OUT.*Uz + 2.*Cumulant_M212central_OUT.*Uy + 2.*Cumulant_M122central_OUT.*Ux + Cumulant_M220central_OUT.*(Uz.^2) + Cumulant_M202central_OUT.*(Uy.^2) + Cumulant_M022central_OUT.*(Ux.^2) + 4.*Cumulant_M211central_OUT.*Uy.*Uz + 4.*Cumulant_M121central_OUT.*Ux.*Uz + 4.*Cumulant_M112central_OUT.*Ux.*Uy + 2.*Cumulant_M210_OUT.*Uy.*(Uz.^2) + 2.*Cumulant_M201_OUT.*(Uy.^2).*Uz + 2.*Cumulant_M120_OUT.*Ux.*(Uz.^2) + 2.*Cumulant_M102_OUT.*Ux.*(Uy.^2) + 2.*Cumulant_M021_OUT.*(Ux.^2).*Uz + 2.*Cumulant_M012_OUT.*(Ux.^2).*Uy + 8.*Cumulant_M111_OUT.*Ux.*Uy.*Uz + Cumulant_M200_OUT.*(Uy.^2).*(Uz.^2) + Cumulant_M020_OUT.*(Ux.^2).*(Uz.^2) + Cumulant_M002_OUT.*(Ux.^2).*(Uy.^2) + 4.*Cumulant_M110_OUT.*Ux.*Uy.*(Uz.^2) + 4.*Cumulant_M101_OUT.*Ux.*(Uy.^2).*Uz + 4.*Cumulant_M011_OUT.*(Ux.^2).*Uy.*Uz + (Ux.^2).*(Uy.^2).*(Uz.^2))
    # Output block - from raw moment space to velocity space
    f01 = Rho.*(1 - Cumulant_M200raw_OUT - Cumulant_M020raw_OUT - Cumulant_M002raw_OUT + Cumulant_M220raw_OUT + Cumulant_M202raw_OUT + Cumulant_M022raw_OUT - Cumulant_M222raw_OUT)
    f02 = 1./2.*Rho.*(Ux + Cumulant_M200raw_OUT - Cumulant_M120raw_OUT - Cumulant_M102raw_OUT - Cumulant_M220raw_OUT - Cumulant_M202raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f03 = 1./2.*Rho.*( - Ux + Cumulant_M200raw_OUT + Cumulant_M120raw_OUT + Cumulant_M102raw_OUT - Cumulant_M220raw_OUT - Cumulant_M202raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f04 = 1./2.*Rho.*(Uy + Cumulant_M020raw_OUT - Cumulant_M210raw_OUT - Cumulant_M012raw_OUT - Cumulant_M220raw_OUT - Cumulant_M022raw_OUT + Cumulant_M212raw_OUT + Cumulant_M222raw_OUT)
    f05 = 1./2.*Rho.*( - Uy + Cumulant_M020raw_OUT + Cumulant_M210raw_OUT + Cumulant_M012raw_OUT - Cumulant_M220raw_OUT - Cumulant_M022raw_OUT - Cumulant_M212raw_OUT + Cumulant_M222raw_OUT)
    f06 = 1./2.*Rho.*(Uz + Cumulant_M002raw_OUT - Cumulant_M201raw_OUT - Cumulant_M021raw_OUT - Cumulant_M202raw_OUT - Cumulant_M022raw_OUT + Cumulant_M221raw_OUT + Cumulant_M222raw_OUT)
    f07 = 1./2.*Rho.*( - Uz + Cumulant_M002raw_OUT + Cumulant_M201raw_OUT + Cumulant_M021raw_OUT - Cumulant_M202raw_OUT - Cumulant_M022raw_OUT - Cumulant_M221raw_OUT + Cumulant_M222raw_OUT)
    f08 = 1./4.*Rho.*(Cumulant_M110raw_OUT + Cumulant_M210raw_OUT + Cumulant_M120raw_OUT - Cumulant_M112raw_OUT + Cumulant_M220raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f09 = 1./4.*Rho.*(Cumulant_M110raw_OUT - Cumulant_M210raw_OUT - Cumulant_M120raw_OUT - Cumulant_M112raw_OUT + Cumulant_M220raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f10 = 1./4.*Rho.*( - Cumulant_M110raw_OUT - Cumulant_M210raw_OUT + Cumulant_M120raw_OUT + Cumulant_M112raw_OUT + Cumulant_M220raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f11 = 1./4.*Rho.*( - Cumulant_M110raw_OUT + Cumulant_M210raw_OUT - Cumulant_M120raw_OUT + Cumulant_M112raw_OUT + Cumulant_M220raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f12 = 1./4.*Rho.*(Cumulant_M101raw_OUT + Cumulant_M201raw_OUT + Cumulant_M102raw_OUT - Cumulant_M121raw_OUT + Cumulant_M202raw_OUT - Cumulant_M221raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f13 = 1./4.*Rho.*(Cumulant_M101raw_OUT - Cumulant_M201raw_OUT - Cumulant_M102raw_OUT - Cumulant_M121raw_OUT + Cumulant_M202raw_OUT + Cumulant_M221raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f14 = 1./4.*Rho.*( - Cumulant_M101raw_OUT - Cumulant_M201raw_OUT + Cumulant_M102raw_OUT + Cumulant_M121raw_OUT + Cumulant_M202raw_OUT + Cumulant_M221raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f15 = 1./4.*Rho.*( - Cumulant_M101raw_OUT + Cumulant_M201raw_OUT - Cumulant_M102raw_OUT + Cumulant_M121raw_OUT + Cumulant_M202raw_OUT - Cumulant_M221raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f16 = 1./4.*Rho.*(Cumulant_M011raw_OUT + Cumulant_M021raw_OUT + Cumulant_M012raw_OUT - Cumulant_M211raw_OUT + Cumulant_M022raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f17 = 1./4.*Rho.*(Cumulant_M011raw_OUT - Cumulant_M021raw_OUT - Cumulant_M012raw_OUT - Cumulant_M211raw_OUT + Cumulant_M022raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f18 = 1./4.*Rho.*( - Cumulant_M011raw_OUT - Cumulant_M021raw_OUT + Cumulant_M012raw_OUT + Cumulant_M211raw_OUT + Cumulant_M022raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f19 = 1./4.*Rho.*( - Cumulant_M011raw_OUT + Cumulant_M021raw_OUT - Cumulant_M012raw_OUT + Cumulant_M211raw_OUT + Cumulant_M022raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f20 = 1./8.*Rho.*(Cumulant_M111raw_OUT + Cumulant_M211raw_OUT + Cumulant_M121raw_OUT + Cumulant_M112raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f21 = 1./8.*Rho.*( - Cumulant_M111raw_OUT + Cumulant_M211raw_OUT + Cumulant_M121raw_OUT + Cumulant_M112raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f22 = 1./8.*Rho.*( - Cumulant_M111raw_OUT - Cumulant_M211raw_OUT - Cumulant_M121raw_OUT + Cumulant_M112raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f23 = 1./8.*Rho.*(Cumulant_M111raw_OUT - Cumulant_M211raw_OUT - Cumulant_M121raw_OUT + Cumulant_M112raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f24 = 1./8.*Rho.*( - Cumulant_M111raw_OUT - Cumulant_M211raw_OUT + Cumulant_M121raw_OUT - Cumulant_M112raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f25 = 1./8.*Rho.*(Cumulant_M111raw_OUT - Cumulant_M211raw_OUT + Cumulant_M121raw_OUT - Cumulant_M112raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f26 = 1./8.*Rho.*(Cumulant_M111raw_OUT + Cumulant_M211raw_OUT - Cumulant_M121raw_OUT - Cumulant_M112raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f27 = 1./8.*Rho.*( - Cumulant_M111raw_OUT + Cumulant_M211raw_OUT - Cumulant_M121raw_OUT - Cumulant_M112raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
  end
  return f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27
end

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

# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
tic()
Cycle = 1
Current_Timestep = Cycle + Previous_Current_Timestep
while Cycle < Maximum_Iterations + 1
  tic()

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # CUMULANT COLLISION KERNEL
  # ALPHA PART OF THE AA PATTERN ALGORITHM - COLLISION

  # CALLING COLLISION KERNEL FUNCTION
  f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27 = AAP_Collision_Kernel(f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27)

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # CUMULANT COLLISION KERNEL
  # BETA PART OF THE AA PATTERN ALGORITHM - BB, STREAM, BC, COLLISION, BB, STREAM, BC

  # BOUNCE BACK ROUTINE
  for i = Gx
    for j = Gy
      for k = Gz
        if Total_Walls[i, j, k] == 1
          Temp_f02 = f02[i, j, k]
          Temp_f03 = f03[i, j, k]
          Temp_f04 = f04[i, j, k]
          Temp_f05 = f05[i, j, k]
          Temp_f06 = f06[i, j, k]
          Temp_f07 = f07[i, j, k]
          Temp_f08 = f08[i, j, k]
          Temp_f09 = f09[i, j, k]
          Temp_f10 = f10[i, j, k]
          Temp_f11 = f11[i, j, k]
          Temp_f12 = f12[i, j, k]
          Temp_f13 = f13[i, j, k]
          Temp_f14 = f14[i, j, k]
          Temp_f15 = f15[i, j, k]
          Temp_f16 = f16[i, j, k]
          Temp_f17 = f17[i, j, k]
          Temp_f18 = f18[i, j, k]
          Temp_f19 = f19[i, j, k]
          Temp_f20 = f20[i, j, k]
          Temp_f21 = f21[i, j, k]
          Temp_f22 = f22[i, j, k]
          Temp_f23 = f23[i, j, k]
          Temp_f24 = f24[i, j, k]
          Temp_f25 = f25[i, j, k]
          Temp_f26 = f26[i, j, k]
          Temp_f27 = f27[i, j, k]
          f02[i, j, k] = Temp_f03
          f03[i, j, k] = Temp_f02
          f04[i, j, k] = Temp_f05
          f05[i, j, k] = Temp_f04
          f06[i, j, k] = Temp_f07
          f07[i, j, k] = Temp_f06
          f08[i, j, k] = Temp_f09
          f09[i, j, k] = Temp_f08
          f10[i, j, k] = Temp_f11
          f11[i, j, k] = Temp_f10
          f12[i, j, k] = Temp_f13
          f13[i, j, k] = Temp_f12
          f14[i, j, k] = Temp_f15
          f15[i, j, k] = Temp_f14
          f16[i, j, k] = Temp_f17
          f17[i, j, k] = Temp_f16
          f18[i, j, k] = Temp_f19
          f19[i, j, k] = Temp_f18
          f20[i, j, k] = Temp_f21
          f21[i, j, k] = Temp_f20
          f22[i, j, k] = Temp_f23
          f23[i, j, k] = Temp_f22
          f24[i, j, k] = Temp_f25
          f25[i, j, k] = Temp_f24
          f26[i, j, k] = Temp_f27
          f27[i, j, k] = Temp_f26
        end
      end
    end
  end

  # STREAMING STEP
  f02 = circshift(f02, [1, 0, 0])
  f03 = circshift(f03, [ - 1, 0, 0])
  f04 = circshift(f04, [0, 1, 0])
  f05 = circshift(f05, [0, - 1, 0])
  f06 = circshift(f06, [0, 0, 1])
  f07 = circshift(f07, [0, 0, - 1])
  f08 = circshift(f08, [1, 1, 0])
  f09 = circshift(f09, [ - 1, - 1, 0])
  f10 = circshift(f10, [1, - 1, 0])
  f11 = circshift(f11, [ - 1, 1, 0])
  f12 = circshift(f12, [1, 0, 1])
  f13 = circshift(f13, [ - 1, 0, - 1])
  f14 = circshift(f14, [1, 0, - 1])
  f15 = circshift(f15, [ - 1, 0, 1])
  f16 = circshift(f16, [0, 1, 1])
  f17 = circshift(f17, [0, - 1, - 1])
  f18 = circshift(f18, [0, 1, - 1])
  f19 = circshift(f19, [0, - 1, 1])
  f20 = circshift(f20, [1, 1, 1])
  f21 = circshift(f21, [ - 1, - 1, - 1])
  f22 = circshift(f22, [1, 1, - 1])
  f23 = circshift(f23, [ - 1, - 1, 1])
  f24 = circshift(f24, [1, - 1, 1])
  f25 = circshift(f25, [ - 1, 1, - 1])
  f26 = circshift(f26, [1, - 1, - 1])
  f27 = circshift(f27, [ - 1, 1, 1])

  # MACROSCOPIC (Dirichlet) Boundary Conditions
  # Inlet: Poiseuille Profile
  if Boundary_Walls == 1
    Uy[Inlet, Column_y, Column_z] = 0
    Uz[Inlet, Column_y, Column_z] = 0
    for j = 2:(Ny - 1)
      for k = 2:(Nz - 1)
        y_Phys = j - 3/2
        z_Phys = k - 3/2
        Ux[Inlet, j, k] = (4.*Inflow_Velocity./(Ly.^2).*(y_Phys.*Ly - (y_Phys.^2))).*(4.*Inflow_Velocity./(Lz.^2).*(z_Phys.*Lz - (z_Phys.^2)))
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01[Inlet, j, k] + f04[Inlet, j, k] + f05[Inlet, j, k] + f06[Inlet, j, k] + f07[Inlet, j, k] + f16[Inlet, j, k] + f17[Inlet, j, k] + f18[Inlet, j, k] + f19[Inlet, j, k]) + 2.*(f03[Inlet, j, k] + f09[Inlet, j, k] + f11[Inlet, j, k] + f13[Inlet, j, k] + f15[Inlet, j, k] + f21[Inlet, j, k] + f23[Inlet, j, k] + f25[Inlet, j, k] + f27[Inlet, j, k]))
      end
    end
  end

  # ALTERNATE Inlet: Uniform Flow
  if Boundary_Walls == 0
    Ux[Inlet, Column_y, Column_z] = Inflow_Velocity
    Uy[Inlet, Column_y, Column_z] = 0
    Uz[Inlet, Column_y, Column_z] = 0
    for j = Gy
      for k = Gz
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01[Inlet, j, k] + f04[Inlet, j, k] + f05[Inlet, j, k] + f06[Inlet, j, k] + f07[Inlet, j, k] + f16[Inlet, j, k] + f17[Inlet, j, k] + f18[Inlet, j, k] + f19[Inlet, j, k]) + 2.*(f03[Inlet, j, k] + f09[Inlet, j, k] + f11[Inlet, j, k] + f13[Inlet, j, k] + f15[Inlet, j, k] + f21[Inlet, j, k] + f23[Inlet, j, k] + f25[Inlet, j, k] + f27[Inlet, j, k]))
      end
    end
  end

  # Outlet: Constant Pressure
  if Boundary_Walls == 1
    Rho[Outlet, Column_y, Column_z] = Rho_Initial
    for j = 2:(Ny - 1)
      for k = 2:(Nz - 1)
        Ux[Outlet, j, k] = - 1 + 1./Rho[Outlet, j, k].*((f01[Outlet, j, k] + f04[Outlet, j, k] + f05[Outlet, j, k] + f06[Outlet, j, k] + f07[Outlet, j, k] + f16[Outlet, j, k] + f17[Outlet, j, k] + f18[Outlet, j, k] + f19[Outlet, j, k]) + 2.*(f02[Outlet, j, k] + f08[Outlet, j, k] + f10[Outlet, j, k] + f12[Outlet, j, k] + f14[Outlet, j, k] + f20[Outlet, j, k] + f22[Outlet, j, k] + f24[Outlet, j, k] + f26[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = (f04[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f05[Outlet - 1, j, k] - f09[Outlet - 1, j, k] - f10[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f19[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f23[Outlet - 1, j, k] - f24[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
          Uz[Outlet, j, k] = (f06[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f07[Outlet - 1, j, k] - f13[Outlet - 1, j, k] - f14[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f18[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f22[Outlet - 1, j, k] - f25[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
        end
        if Pressure_Outlet_Tangential_Velocities == "No"
          Uy[Outlet, j, k] = 0
          Uz[Outlet, j, k] = 0
        end
      end
    end
  end
  if Boundary_Walls == 0
    Rho[Outlet, Column_y, Column_z] = Rho_Initial
    for j = Gy
      for k = Gz
        Ux[Outlet, j, k] = - 1 + 1./Rho[Outlet, j, k].*((f01[Outlet, j, k] + f04[Outlet, j, k] + f05[Outlet, j, k] + f06[Outlet, j, k] + f07[Outlet, j, k] + f16[Outlet, j, k] + f17[Outlet, j, k] + f18[Outlet, j, k] + f19[Outlet, j, k]) + 2.*(f02[Outlet, j, k] + f08[Outlet, j, k] + f10[Outlet, j, k] + f12[Outlet, j, k] + f14[Outlet, j, k] + f20[Outlet, j, k] + f22[Outlet, j, k] + f24[Outlet, j, k] + f26[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = (f04[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f05[Outlet - 1, j, k] - f09[Outlet - 1, j, k] - f10[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f19[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f23[Outlet - 1, j, k] - f24[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
          Uz[Outlet, j, k] = (f06[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f07[Outlet - 1, j, k] - f13[Outlet - 1, j, k] - f14[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f18[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f22[Outlet - 1, j, k] - f25[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
        end
        if Pressure_Outlet_Tangential_Velocities == "No"
          Uy[Outlet, j, k] = 0
          Uz[Outlet, j, k] = 0
        end
      end
    end
  end

  # MESOSCOPIC Boundary Conditions
  # Inlet: Modified Zou/He Boundary Conditions
  Jx[Inlet, Column_y, Column_z] = Rho[Inlet, Column_y, Column_z].*Ux[Inlet, Column_y, Column_z]
  Ninlet_xy[Inlet, Column_y, Column_z] = 1/6.*(f04[Inlet, Column_y, Column_z] + f16[Inlet, Column_y, Column_z] + f18[Inlet, Column_y, Column_z] - f05[Inlet, Column_y, Column_z] - f17[Inlet, Column_y, Column_z] - f19[Inlet, Column_y, Column_z])
  Ninlet_xz[Inlet, Column_y, Column_z] = 1/6.*(f06[Inlet, Column_y, Column_z] + f16[Inlet, Column_y, Column_z] + f19[Inlet, Column_y, Column_z] - f07[Inlet, Column_y, Column_z] - f17[Inlet, Column_y, Column_z] - f18[Inlet, Column_y, Column_z])
  f02[Inlet, Column_y, Column_z] = f03[Inlet, Column_y, Column_z] + 4./9.*Jx[Inlet, Column_y, Column_z]
  f08[Inlet, Column_y, Column_z] = f09[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f10[Inlet, Column_y, Column_z] = f11[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f12[Inlet, Column_y, Column_z] = f13[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f14[Inlet, Column_y, Column_z] = f15[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f20[Inlet, Column_y, Column_z] = f21[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f22[Inlet, Column_y, Column_z] = f23[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f24[Inlet, Column_y, Column_z] = f25[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f26[Inlet, Column_y, Column_z] = f27[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  # Outlet: Modified Zou/He Boundary Conditions
  Jx[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Ux[Outlet, Column_y, Column_z]
  Jy[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uy[Outlet, Column_y, Column_z]
  Jz[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uz[Outlet, Column_y, Column_z]
  Noutlet_xy[Outlet, Column_y, Column_z] = 1/6.*(f04[Outlet, Column_y, Column_z] + f16[Outlet, Column_y, Column_z] + f18[Outlet, Column_y, Column_z] - f05[Outlet, Column_y, Column_z] - f17[Outlet, Column_y, Column_z] - f19[Outlet, Column_y, Column_z] - 2/3.*Jy[Outlet, Column_y, Column_z])
  Noutlet_xz[Outlet, Column_y, Column_z] = 1/6.*(f06[Outlet, Column_y, Column_z] + f16[Outlet, Column_y, Column_z] + f19[Outlet, Column_y, Column_z] - f07[Outlet, Column_y, Column_z] - f17[Outlet, Column_y, Column_z] - f18[Outlet, Column_y, Column_z] - 2/3.*Jz[Outlet, Column_y, Column_z])
  f03[Outlet, Column_y, Column_z] = f02[Outlet, Column_y, Column_z] - 4./9.*Jx[Outlet, Column_y, Column_z]
  f09[Outlet, Column_y, Column_z] = f08[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jy[Outlet, Column_y, Column_z]
  f11[Outlet, Column_y, Column_z] = f10[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jy[Outlet, Column_y, Column_z]
  f13[Outlet, Column_y, Column_z] = f12[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jz[Outlet, Column_y, Column_z]
  f15[Outlet, Column_y, Column_z] = f14[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jz[Outlet, Column_y, Column_z]
  f21[Outlet, Column_y, Column_z] = f20[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f23[Outlet, Column_y, Column_z] = f22[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]
  f25[Outlet, Column_y, Column_z] = f24[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f27[Outlet, Column_y, Column_z] = f26[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]

  # CALLING COLLISION KERNEL FUNCTION
  f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27 = AAP_Collision_Kernel(f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27)

  # BOUNCE BACK ROUTINE
  for i = Gx
    for j = Gy
      for k = Gz
        if Total_Walls[i, j, k] == 1
          Temp_f02 = f02[i, j, k]
          Temp_f03 = f03[i, j, k]
          Temp_f04 = f04[i, j, k]
          Temp_f05 = f05[i, j, k]
          Temp_f06 = f06[i, j, k]
          Temp_f07 = f07[i, j, k]
          Temp_f08 = f08[i, j, k]
          Temp_f09 = f09[i, j, k]
          Temp_f10 = f10[i, j, k]
          Temp_f11 = f11[i, j, k]
          Temp_f12 = f12[i, j, k]
          Temp_f13 = f13[i, j, k]
          Temp_f14 = f14[i, j, k]
          Temp_f15 = f15[i, j, k]
          Temp_f16 = f16[i, j, k]
          Temp_f17 = f17[i, j, k]
          Temp_f18 = f18[i, j, k]
          Temp_f19 = f19[i, j, k]
          Temp_f20 = f20[i, j, k]
          Temp_f21 = f21[i, j, k]
          Temp_f22 = f22[i, j, k]
          Temp_f23 = f23[i, j, k]
          Temp_f24 = f24[i, j, k]
          Temp_f25 = f25[i, j, k]
          Temp_f26 = f26[i, j, k]
          Temp_f27 = f27[i, j, k]
          f02[i, j, k] = Temp_f03
          f03[i, j, k] = Temp_f02
          f04[i, j, k] = Temp_f05
          f05[i, j, k] = Temp_f04
          f06[i, j, k] = Temp_f07
          f07[i, j, k] = Temp_f06
          f08[i, j, k] = Temp_f09
          f09[i, j, k] = Temp_f08
          f10[i, j, k] = Temp_f11
          f11[i, j, k] = Temp_f10
          f12[i, j, k] = Temp_f13
          f13[i, j, k] = Temp_f12
          f14[i, j, k] = Temp_f15
          f15[i, j, k] = Temp_f14
          f16[i, j, k] = Temp_f17
          f17[i, j, k] = Temp_f16
          f18[i, j, k] = Temp_f19
          f19[i, j, k] = Temp_f18
          f20[i, j, k] = Temp_f21
          f21[i, j, k] = Temp_f20
          f22[i, j, k] = Temp_f23
          f23[i, j, k] = Temp_f22
          f24[i, j, k] = Temp_f25
          f25[i, j, k] = Temp_f24
          f26[i, j, k] = Temp_f27
          f27[i, j, k] = Temp_f26
        end
      end
    end
  end

  # STREAMING STEP
  f02 = circshift(f02, [1, 0, 0])
  f03 = circshift(f03, [ - 1, 0, 0])
  f04 = circshift(f04, [0, 1, 0])
  f05 = circshift(f05, [0, - 1, 0])
  f06 = circshift(f06, [0, 0, 1])
  f07 = circshift(f07, [0, 0, - 1])
  f08 = circshift(f08, [1, 1, 0])
  f09 = circshift(f09, [ - 1, - 1, 0])
  f10 = circshift(f10, [1, - 1, 0])
  f11 = circshift(f11, [ - 1, 1, 0])
  f12 = circshift(f12, [1, 0, 1])
  f13 = circshift(f13, [ - 1, 0, - 1])
  f14 = circshift(f14, [1, 0, - 1])
  f15 = circshift(f15, [ - 1, 0, 1])
  f16 = circshift(f16, [0, 1, 1])
  f17 = circshift(f17, [0, - 1, - 1])
  f18 = circshift(f18, [0, 1, - 1])
  f19 = circshift(f19, [0, - 1, 1])
  f20 = circshift(f20, [1, 1, 1])
  f21 = circshift(f21, [ - 1, - 1, - 1])
  f22 = circshift(f22, [1, 1, - 1])
  f23 = circshift(f23, [ - 1, - 1, 1])
  f24 = circshift(f24, [1, - 1, 1])
  f25 = circshift(f25, [ - 1, 1, - 1])
  f26 = circshift(f26, [1, - 1, - 1])
  f27 = circshift(f27, [ - 1, 1, 1])

  # MACROSCOPIC (Dirichlet) Boundary Conditions
  # Inlet: Poiseuille Profile
  if Boundary_Walls == 1
    Uy[Inlet, Column_y, Column_z] = 0
    Uz[Inlet, Column_y, Column_z] = 0
    for j = 2:(Ny - 1)
      for k = 2:(Nz - 1)
        y_Phys = j - 3/2
        z_Phys = k - 3/2
        Ux[Inlet, j, k] = (4.*Inflow_Velocity./(Ly.^2).*(y_Phys.*Ly - (y_Phys.^2))).*(4.*Inflow_Velocity./(Lz.^2).*(z_Phys.*Lz - (z_Phys.^2)))
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01[Inlet, j, k] + f04[Inlet, j, k] + f05[Inlet, j, k] + f06[Inlet, j, k] + f07[Inlet, j, k] + f16[Inlet, j, k] + f17[Inlet, j, k] + f18[Inlet, j, k] + f19[Inlet, j, k]) + 2.*(f03[Inlet, j, k] + f09[Inlet, j, k] + f11[Inlet, j, k] + f13[Inlet, j, k] + f15[Inlet, j, k] + f21[Inlet, j, k] + f23[Inlet, j, k] + f25[Inlet, j, k] + f27[Inlet, j, k]))
      end
    end
  end

  # ALTERNATE Inlet: Uniform Flow
  if Boundary_Walls == 0
    Ux[Inlet, Column_y, Column_z] = Inflow_Velocity
    Uy[Inlet, Column_y, Column_z] = 0
    Uz[Inlet, Column_y, Column_z] = 0
    for j = Gy
      for k = Gz
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01[Inlet, j, k] + f04[Inlet, j, k] + f05[Inlet, j, k] + f06[Inlet, j, k] + f07[Inlet, j, k] + f16[Inlet, j, k] + f17[Inlet, j, k] + f18[Inlet, j, k] + f19[Inlet, j, k]) + 2.*(f03[Inlet, j, k] + f09[Inlet, j, k] + f11[Inlet, j, k] + f13[Inlet, j, k] + f15[Inlet, j, k] + f21[Inlet, j, k] + f23[Inlet, j, k] + f25[Inlet, j, k] + f27[Inlet, j, k]))
      end
    end
  end

  # Outlet: Constant Pressure
  if Boundary_Walls == 1
    Rho[Outlet, Column_y, Column_z] = Rho_Initial
    for j = 2:(Ny - 1)
      for k = 2:(Nz - 1)
        Ux[Outlet, j, k] = - 1 + 1./Rho[Outlet, j, k].*((f01[Outlet, j, k] + f04[Outlet, j, k] + f05[Outlet, j, k] + f06[Outlet, j, k] + f07[Outlet, j, k] + f16[Outlet, j, k] + f17[Outlet, j, k] + f18[Outlet, j, k] + f19[Outlet, j, k]) + 2.*(f02[Outlet, j, k] + f08[Outlet, j, k] + f10[Outlet, j, k] + f12[Outlet, j, k] + f14[Outlet, j, k] + f20[Outlet, j, k] + f22[Outlet, j, k] + f24[Outlet, j, k] + f26[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = (f04[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f05[Outlet - 1, j, k] - f09[Outlet - 1, j, k] - f10[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f19[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f23[Outlet - 1, j, k] - f24[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
          Uz[Outlet, j, k] = (f06[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f07[Outlet - 1, j, k] - f13[Outlet - 1, j, k] - f14[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f18[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f22[Outlet - 1, j, k] - f25[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
        end
        if Pressure_Outlet_Tangential_Velocities == "No"
          Uy[Outlet, j, k] = 0
          Uz[Outlet, j, k] = 0
        end
      end
    end
  end
  if Boundary_Walls == 0
    Rho[Outlet, Column_y, Column_z] = Rho_Initial
    for j = Gy
      for k = Gz
        Ux[Outlet, j, k] = - 1 + 1./Rho[Outlet, j, k].*((f01[Outlet, j, k] + f04[Outlet, j, k] + f05[Outlet, j, k] + f06[Outlet, j, k] + f07[Outlet, j, k] + f16[Outlet, j, k] + f17[Outlet, j, k] + f18[Outlet, j, k] + f19[Outlet, j, k]) + 2.*(f02[Outlet, j, k] + f08[Outlet, j, k] + f10[Outlet, j, k] + f12[Outlet, j, k] + f14[Outlet, j, k] + f20[Outlet, j, k] + f22[Outlet, j, k] + f24[Outlet, j, k] + f26[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = (f04[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f05[Outlet - 1, j, k] - f09[Outlet - 1, j, k] - f10[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f19[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f23[Outlet - 1, j, k] - f24[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
          Uz[Outlet, j, k] = (f06[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f27[Outlet - 1, j, k] - f07[Outlet - 1, j, k] - f13[Outlet - 1, j, k] - f14[Outlet - 1, j, k] - f17[Outlet - 1, j, k] - f18[Outlet - 1, j, k] - f21[Outlet - 1, j, k] - f22[Outlet - 1, j, k] - f25[Outlet - 1, j, k] - f26[Outlet - 1, j, k])./f01[Outlet - 1, j, k] + f02[Outlet - 1, j, k] + f03[Outlet - 1, j, k] + f04[Outlet - 1, j, k] + f05[Outlet - 1, j, k] + f06[Outlet - 1, j, k] + f07[Outlet - 1, j, k] + f08[Outlet - 1, j, k] + f09[Outlet - 1, j, k] + f10[Outlet - 1, j, k] + f11[Outlet - 1, j, k] + f12[Outlet - 1, j, k] + f13[Outlet - 1, j, k] + f14[Outlet - 1, j, k] + f15[Outlet - 1, j, k] + f16[Outlet - 1, j, k] + f17[Outlet - 1, j, k] + f18[Outlet - 1, j, k] + f19[Outlet - 1, j, k] + f20[Outlet - 1, j, k] + f21[Outlet - 1, j, k] + f22[Outlet - 1, j, k] + f23[Outlet - 1, j, k] + f24[Outlet - 1, j, k] + f25[Outlet - 1, j, k] + f26[Outlet - 1, j, k] + f27[Outlet - 1, j, k]
        end
        if Pressure_Outlet_Tangential_Velocities == "No"
          Uy[Outlet, j, k] = 0
          Uz[Outlet, j, k] = 0
        end
      end
    end
  end

  # MESOSCOPIC Boundary Conditions
  # Inlet: Modified Zou/He Boundary Conditions
  Jx[Inlet, Column_y, Column_z] = Rho[Inlet, Column_y, Column_z].*Ux[Inlet, Column_y, Column_z]
  Ninlet_xy[Inlet, Column_y, Column_z] = 1/6.*(f04[Inlet, Column_y, Column_z] + f16[Inlet, Column_y, Column_z] + f18[Inlet, Column_y, Column_z] - f05[Inlet, Column_y, Column_z] - f17[Inlet, Column_y, Column_z] - f19[Inlet, Column_y, Column_z])
  Ninlet_xz[Inlet, Column_y, Column_z] = 1/6.*(f06[Inlet, Column_y, Column_z] + f16[Inlet, Column_y, Column_z] + f19[Inlet, Column_y, Column_z] - f07[Inlet, Column_y, Column_z] - f17[Inlet, Column_y, Column_z] - f18[Inlet, Column_y, Column_z])
  f02[Inlet, Column_y, Column_z] = f03[Inlet, Column_y, Column_z] + 4./9.*Jx[Inlet, Column_y, Column_z]
  f08[Inlet, Column_y, Column_z] = f09[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f10[Inlet, Column_y, Column_z] = f11[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f12[Inlet, Column_y, Column_z] = f13[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f14[Inlet, Column_y, Column_z] = f15[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f20[Inlet, Column_y, Column_z] = f21[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f22[Inlet, Column_y, Column_z] = f23[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f24[Inlet, Column_y, Column_z] = f25[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f26[Inlet, Column_y, Column_z] = f27[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  # Outlet: Modified Zou/He Boundary Conditions
  Jx[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Ux[Outlet, Column_y, Column_z]
  Jy[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uy[Outlet, Column_y, Column_z]
  Jz[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uz[Outlet, Column_y, Column_z]
  Noutlet_xy[Outlet, Column_y, Column_z] = 1/6.*(f04[Outlet, Column_y, Column_z] + f16[Outlet, Column_y, Column_z] + f18[Outlet, Column_y, Column_z] - f05[Outlet, Column_y, Column_z] - f17[Outlet, Column_y, Column_z] - f19[Outlet, Column_y, Column_z] - 2/3.*Jy[Outlet, Column_y, Column_z])
  Noutlet_xz[Outlet, Column_y, Column_z] = 1/6.*(f06[Outlet, Column_y, Column_z] + f16[Outlet, Column_y, Column_z] + f19[Outlet, Column_y, Column_z] - f07[Outlet, Column_y, Column_z] - f17[Outlet, Column_y, Column_z] - f18[Outlet, Column_y, Column_z] - 2/3.*Jz[Outlet, Column_y, Column_z])
  f03[Outlet, Column_y, Column_z] = f02[Outlet, Column_y, Column_z] - 4./9.*Jx[Outlet, Column_y, Column_z]
  f09[Outlet, Column_y, Column_z] = f08[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jy[Outlet, Column_y, Column_z]
  f11[Outlet, Column_y, Column_z] = f10[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jy[Outlet, Column_y, Column_z]
  f13[Outlet, Column_y, Column_z] = f12[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jz[Outlet, Column_y, Column_z]
  f15[Outlet, Column_y, Column_z] = f14[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jz[Outlet, Column_y, Column_z]
  f21[Outlet, Column_y, Column_z] = f20[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f23[Outlet, Column_y, Column_z] = f22[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]
  f25[Outlet, Column_y, Column_z] = f24[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f27[Outlet, Column_y, Column_z] = f26[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # FORCE ESTIMATION STEP
  if (mod(Cycle + 1, Force_Plot) == 1) || (Cycle == 1)
    println(" ")
    println("Force Computation Plot (Momentum Exchange Method) = ", Cycle)
    println(" ")
    for i = Gx
      XvarPos = 1
      XvarNeg = 1
      if i == 1
        XvarNeg = 1 - Nx
      end
      if i == Nx
        XvarPos = 1 - Nx
      end
      for j = Gy
        YvarPos = 1
        YvarNeg = 1
        if j == 1
          YvarNeg = 1 - Ny
        end
        if j == Ny
          YvarPos = 1 - Ny
        end
        for k = Gz
          ZvarPos = 1
          ZvarNeg = 1
          if k == 1
            ZvarNeg = 1 - Nz
          end
          if k == Nz
            ZvarPos = 1 - Nz
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f02[i, j, k] + f03[i + XvarPos, j, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f03[i, j, k] - f02[i - XvarNeg, j, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + YvarPos, k] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f04[i, j, k] + f05[i, j + YvarPos, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - YvarNeg, k] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f05[i, j, k] - f04[i, j - YvarNeg, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j, k + ZvarPos] == 1)
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f06[i, j, k] + f07[i, j, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j, k - ZvarNeg] == 1)
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f07[i, j, k] - f06[i, j, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j + YvarPos, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f08[i, j, k] + f09[i + XvarPos, j + YvarPos, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f08[i, j, k] + f09[i + XvarPos, j + YvarPos, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j - YvarNeg, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f09[i, j, k] - f08[i - XvarNeg, j - YvarNeg, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f09[i, j, k] - f08[i - XvarNeg, j - YvarNeg, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j - YvarNeg, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f10[i, j, k] + f11[i + XvarPos, j - YvarNeg, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f10[i, j, k] - f11[i + XvarPos, j - YvarNeg, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j + YvarPos, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f11[i, j, k] - f10[i - XvarNeg, j + YvarPos, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f11[i, j, k] + f10[i - XvarNeg, j + YvarPos, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f12[i, j, k] + f13[i + XvarPos, j, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f12[i, j, k] + f13[i + XvarPos, j, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f13[i, j, k] - f12[i - XvarNeg, j, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f13[i, j, k] - f12[i - XvarNeg, j, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f14[i, j, k] + f15[i + XvarPos, j, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f14[i, j, k] - f15[i + XvarPos, j, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f15[i, j, k] - f14[i - XvarNeg, j, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f15[i, j, k] + f14[i - XvarNeg, j, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + YvarPos, k + ZvarPos] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f16[i, j, k] + f17[i, j + YvarPos, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f16[i, j, k] + f17[i, j + YvarPos, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - YvarNeg, k - ZvarNeg] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f17[i, j, k] - f16[i, j - YvarNeg, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f17[i, j, k] - f16[i, j - YvarNeg, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + YvarPos, k - ZvarNeg] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f18[i, j, k] + f19[i, j + YvarPos, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f18[i, j, k] - f19[i, j + YvarPos, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - YvarNeg, k + ZvarPos] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f19[i, j, k] - f18[i, j - YvarNeg, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f19[i, j, k] + f18[i, j - YvarNeg, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j + YvarPos, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f20[i, j, k] + f21[i + XvarPos, j + YvarPos, k + ZvarPos]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f20[i, j, k] + f21[i + XvarPos, j + YvarPos, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f20[i, j, k] + f21[i + XvarPos, j + YvarPos, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j - YvarNeg, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f21[i, j, k] - f20[i - XvarNeg, j - YvarNeg, k - ZvarNeg]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f21[i, j, k] - f20[i - XvarNeg, j - YvarNeg, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f21[i, j, k] - f20[i - XvarNeg, j - YvarNeg, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j + YvarPos, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f22[i, j, k] + f23[i + XvarPos, j + YvarPos, k - ZvarNeg]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f22[i, j, k] + f23[i + XvarPos, j + YvarPos, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f22[i, j, k] - f23[i + XvarPos, j + YvarPos, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j - YvarNeg, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f23[i, j, k] - f22[i - XvarNeg, j - YvarNeg, k + ZvarPos]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f23[i, j, k] - f22[i - XvarNeg, j - YvarNeg, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f23[i, j, k] + f22[i - XvarNeg, j - YvarNeg, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j - YvarNeg, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f24[i, j, k] + f25[i + XvarPos, j - YvarNeg, k + ZvarPos]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f24[i, j, k] - f25[i + XvarPos, j - YvarNeg, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f24[i, j, k] + f25[i + XvarPos, j - YvarNeg, k + ZvarPos]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j + YvarPos, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f25[i, j, k] - f24[i - XvarNeg, j + YvarPos, k - ZvarNeg]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f25[i, j, k] + f24[i - XvarNeg, j + YvarPos, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f25[i, j, k] - f24[i - XvarNeg, j + YvarPos, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + XvarPos, j - YvarNeg, k - ZvarNeg] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f26[i, j, k] + f27[i + XvarPos, j - YvarNeg, k - ZvarNeg]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f26[i, j, k] - f27[i + XvarPos, j - YvarNeg, k - ZvarNeg]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f26[i, j, k] - f27[i + XvarPos, j - YvarNeg, k - ZvarNeg]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - XvarNeg, j + YvarPos, k + ZvarPos] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f27[i, j, k] - f26[i - XvarNeg, j + YvarPos, k + ZvarPos]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f27[i, j, k] + f26[i - XvarNeg, j + YvarPos, k + ZvarPos]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f27[i, j, k] + f26[i - XvarNeg, j + YvarPos, k + ZvarPos]
          end
        end
      end
    end
  end
  if (mod(Cycle + 1, Force_Plot) != 1) && (Cycle != 1)
    Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep - 1]
    Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep - 1]
    Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep - 1]
  end
  # Non-dimensionalisation of forces
  CrossSection_Area = sum(Obstacle[Obstacle_Center_x, :, :])
  Drag_Coefficient[Current_Timestep] = 2.*Fx_Obstacle[Current_Timestep]./(Rho_Initial.*(Inflow_Velocity.^2).*CrossSection_Area)
  YLift_Coefficient[Current_Timestep] = 2.*Fy_Obstacle[Current_Timestep]./(Rho_Initial.*(Inflow_Velocity.^2).*CrossSection_Area)
  ZLift_Coefficient[Current_Timestep] = 2.*Fz_Obstacle[Current_Timestep]./(Rho_Initial.*(Inflow_Velocity.^2).*CrossSection_Area)
  if (Cycle == 1) && (Restart_Calculation == "Yes")
    Fx_Obstacle[Current_Timestep - 1] = Fx_Obstacle[Current_Timestep - 2]
    Fy_Obstacle[Current_Timestep - 1] = Fy_Obstacle[Current_Timestep - 2]
    Fz_Obstacle[Current_Timestep - 1] = Fz_Obstacle[Current_Timestep - 2]
    Drag_Coefficient[Current_Timestep - 1] = Drag_Coefficient[Current_Timestep - 2]
    YLift_Coefficient[Current_Timestep - 1] = YLift_Coefficient[Current_Timestep - 2]
    ZLift_Coefficient[Current_Timestep - 1] = ZLift_Coefficient[Current_Timestep - 2]
  end

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # RAMP UP FUNCTION
  if Ramp_Up_Test == "Yes"
    if Cycle > Ramp_Up_Initial
      Re = Re + Ramp_Up_Increment # Reynolds Number of the flow
      Nu = Inflow_Velocity*2*Obstacle_Radius/Re # Kinematic Viscosity
      Omega = 1/(3*Nu + 1/2) # Relaxation Parameter
      #Omega_Positive = Omega
      #Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
      #MRT_Omega[1] = Omega
      #CMRT_Omega[1] = Omega
      Cumulant_Omega[1] = Omega
      println(" ")
      println("Reynolds Number = ", Re)
      println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
    end
    # INSTABILITY DETECTION
    if (Drag_Coefficient[Current_Timestep] > 100) || (YLift_Coefficient[Current_Timestep] > 100) || (ZLift_Coefficient[Current_Timestep] > 100) || isnan.(Drag_Coefficient[Current_Timestep]) || isnan.(YLift_Coefficient[Current_Timestep]) || isnan.(ZLift_Coefficient[Current_Timestep]) || isinf.(Drag_Coefficient[Current_Timestep]) || isinf.(YLift_Coefficient[Current_Timestep]) || isinf.(ZLift_Coefficient[Current_Timestep])
      Cycle = Maximum_Iterations
      Fx_Obstacle[Current_Timestep:end] = NaN
      Fy_Obstacle[Current_Timestep:end] = NaN
      Fz_Obstacle[Current_Timestep:end] = NaN
      Drag_Coefficient[Current_Timestep:end] = NaN
      YLift_Coefficient[Current_Timestep:end] = NaN
      ZLift_Coefficient[Current_Timestep:end] = NaN
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

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # VISUALISATION STEP
  if mod(Cycle + 1, Cycle_Plot) == 1
    println(" ")
    println("Cycle Plot = ", Cycle)
    println(" ")

    # MACROSCOPIC Variables
    Rho = f01 + f02 + f03 + f04 + f05 + f06 + f07 + f08 + f09 + f10 + f11 + f12 + f13 + f14 + f15 + f16 + f17 + f18 + f19 + f20 + f21 + f22 + f23 + f24 + f25 + f26 + f27
    Jx = f02 + f08 + f10 + f12 + f14 + f20 + f22 + f24 + f26 - f03 - f09 - f11 - f13 - f15 - f21 - f23 - f25 - f27
    Jy = f04 + f08 + f11 + f16 + f18 + f20 + f22 + f25 + f27 - f05 - f09 - f10 - f17 - f19 - f21 - f23 - f24 - f26
    Jz = f06 + f12 + f15 + f16 + f19 + f20 + f23 + f24 + f27 - f07 - f13 - f14 - f17 - f18 - f21 - f22 - f25 - f26
    Ux = Jx./Rho
    Uy = Jy./Rho
    Uz = Jz./Rho

    Ut_Plot = sqrt.(Ux.^2 + Uy.^2 + Uz.^2)./Inflow_Velocity
    Ux_Plot = Ux./Inflow_Velocity
    Uy_Plot = Uy./Inflow_Velocity
    Uz_Plot = Uz./Inflow_Velocity
    Rho_Plot = (Rho./3)./(Rho_Initial./3)

    Ux_Plot[1, :, :] = NaN
    Ux_Plot[Nx, :, :] = NaN
    Ux_Plot[:, 1, :] = NaN
    Ux_Plot[:, Ny, :] = NaN
    Ux_Plot[:, :, 1] = NaN
    Ux_Plot[:, :, Nz] = NaN
    Uy_Plot[1, :, :] = NaN
    Uy_Plot[Nx, :, :] = NaN
    Uy_Plot[:, 1, :] = NaN
    Uy_Plot[:, Ny, :] = NaN
    Uy_Plot[:, :, 1] = NaN
    Uy_Plot[:, :, Nz] = NaN
    Uz_Plot[1, :, :] = NaN
    Uz_Plot[Nx, :, :] = NaN
    Uz_Plot[:, 1, :] = NaN
    Uz_Plot[:, Ny, :] = NaN
    Uz_Plot[:, :, 1] = NaN
    Uz_Plot[:, :, Nz] = NaN
    Ut_Plot[1, :, :] = NaN
    Ut_Plot[Nx, :, :] = NaN
    Ut_Plot[:, 1, :] = NaN
    Ut_Plot[:, Ny, :] = NaN
    Ut_Plot[:, :, 1] = NaN
    Ut_Plot[:, :, Nz] = NaN
    Rho_Plot[1, :, :] = NaN
    Rho_Plot[Nx, :, :] = NaN
    Rho_Plot[:, 1, :] = NaN
    Rho_Plot[:, Ny, :] = NaN
    Rho_Plot[:, :, 1] = NaN
    Rho_Plot[:, :, Nz] = NaN

    # Q-Criterion / Delta-Criterion / Lambda2-Criterion plotting
    QCriterion = zeros(Nx, Ny, Nz)
    QCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
    QCriterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
    DeltaCriterion = zeros(Nx, Ny, Nz)
    DeltaCriterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
    DeltaCriterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
    Lambda2Criterion = zeros(Nx, Ny, Nz)
    Lambda2Criterion_Mod2DPlotter = zeros(Nx, Ny, Nz)
    Lambda2Criterion_Mod3DIsosurface = zeros(Nx, Ny, Nz)
    DelUx_Delx = (circshift(Ux, [1, 0, 0]) - circshift(Ux, [ - 1, 0, 0]))./2
    DelUx_Dely = (circshift(Ux, [0, 1, 0]) - circshift(Ux, [0, - 1, 0]))./2
    DelUx_Delz = (circshift(Ux, [0, 0, 1]) - circshift(Ux, [0, 0, - 1]))./2
    DelUy_Delx = (circshift(Uy, [1, 0, 0]) - circshift(Uy, [ - 1, 0, 0]))./2
    DelUy_Dely = (circshift(Uy, [0, 1, 0]) - circshift(Uy, [0, - 1, 0]))./2
    DelUy_Delz = (circshift(Uy, [0, 0, 1]) - circshift(Uy, [0, 0, - 1]))./2
    DelUz_Delx = (circshift(Uz, [1, 0, 0]) - circshift(Uz, [ - 1, 0, 0]))./2
    DelUz_Dely = (circshift(Uz, [0, 1, 0]) - circshift(Uz, [0, - 1, 0]))./2
    DelUz_Delz = (circshift(Uz, [0, 0, 1]) - circshift(Uz, [0, 0, - 1]))./2
    DelUx_Delx[1, :, :] = DelUx_Delx[2, :, :]
    DelUx_Delx[Nx, :, :] = DelUx_Delx[Nx - 1, :, :]
    DelUx_Delx[:, 1, :] = DelUx_Delx[:, 2, :]
    DelUx_Delx[:, Ny, :] = DelUx_Delx[:, Ny - 1, :]
    DelUx_Delx[:, :, 1] = DelUx_Delx[:, :, 2]
    DelUx_Delx[:, :, Nz] = DelUx_Delx[:, :, Nz - 1]
    DelUx_Dely[1, :, :] = DelUx_Dely[2, :, :]
    DelUx_Dely[Nx, :, :] = DelUx_Dely[Nx - 1, :, :]
    DelUx_Dely[:, 1, :] = DelUx_Dely[:, 2, :]
    DelUx_Dely[:, Ny, :] = DelUx_Dely[:, Ny - 1, :]
    DelUx_Dely[:, :, 1] = DelUx_Dely[:, :, 2]
    DelUx_Dely[:, :, Nz] = DelUx_Dely[:, :, Nz - 1]
    DelUx_Delz[1, :, :] = DelUx_Delz[2, :, :]
    DelUx_Delz[Nx, :, :] = DelUx_Delz[Nx - 1, :, :]
    DelUx_Delz[:, 1, :] = DelUx_Delz[:, 2, :]
    DelUx_Delz[:, Ny, :] = DelUx_Delz[:, Ny - 1, :]
    DelUx_Delz[:, :, 1] = DelUx_Delz[:, :, 2]
    DelUx_Delz[:, :, Nz] = DelUx_Delz[:, :, Nz - 1]
    DelUy_Delx[1, :, :] = DelUy_Delx[2, :, :]
    DelUy_Delx[Nx, :, :] = DelUy_Delx[Nx - 1, :, :]
    DelUy_Delx[:, 1, :] = DelUy_Delx[:, 2, :]
    DelUy_Delx[:, Ny, :] = DelUy_Delx[:, Ny - 1, :]
    DelUy_Delx[:, :, 1] = DelUy_Delx[:, :, 2]
    DelUy_Delx[:, :, Nz] = DelUy_Delx[:, :, Nz - 1]
    DelUy_Dely[1, :, :] = DelUy_Dely[2, :, :]
    DelUy_Dely[Nx, :, :] = DelUy_Dely[Nx - 1, :, :]
    DelUy_Dely[:, 1, :] = DelUy_Dely[:, 2, :]
    DelUy_Dely[:, Ny, :] = DelUy_Dely[:, Ny - 1, :]
    DelUy_Dely[:, :, 1] = DelUy_Dely[:, :, 2]
    DelUy_Dely[:, :, Nz] = DelUy_Dely[:, :, Nz - 1]
    DelUy_Delz[1, :, :] = DelUy_Delz[2, :, :]
    DelUy_Delz[Nx, :, :] = DelUy_Delz[Nx - 1, :, :]
    DelUy_Delz[:, 1, :] = DelUy_Delz[:, 2, :]
    DelUy_Delz[:, Ny, :] = DelUy_Delz[:, Ny - 1, :]
    DelUy_Delz[:, :, 1] = DelUy_Delz[:, :, 2]
    DelUy_Delz[:, :, Nz] = DelUy_Delz[:, :, Nz - 1]
    DelUz_Delx[1, :, :] = DelUz_Delx[2, :, :]
    DelUz_Delx[Nx, :, :] = DelUz_Delx[Nx - 1, :, :]
    DelUz_Delx[:, 1, :] = DelUz_Delx[:, 2, :]
    DelUz_Delx[:, Ny, :] = DelUz_Delx[:, Ny - 1, :]
    DelUz_Delx[:, :, 1] = DelUz_Delx[:, :, 2]
    DelUz_Delx[:, :, Nz] = DelUz_Delx[:, :, Nz - 1]
    DelUz_Dely[1, :, :] = DelUz_Dely[2, :, :]
    DelUz_Dely[Nx, :, :] = DelUz_Dely[Nx - 1, :, :]
    DelUz_Dely[:, 1, :] = DelUz_Dely[:, 2, :]
    DelUz_Dely[:, Ny, :] = DelUz_Dely[:, Ny - 1, :]
    DelUz_Dely[:, :, 1] = DelUz_Dely[:, :, 2]
    DelUz_Dely[:, :, Nz] = DelUz_Dely[:, :, Nz - 1]
    DelUz_Delz[1, :, :] = DelUz_Delz[2, :, :]
    DelUz_Delz[Nx, :, :] = DelUz_Delz[Nx - 1, :, :]
    DelUz_Delz[:, 1, :] = DelUz_Delz[:, 2, :]
    DelUz_Delz[:, Ny, :] = DelUz_Delz[:, Ny - 1, :]
    DelUz_Delz[:, :, 1] = DelUz_Delz[:, :, 2]
    DelUz_Delz[:, :, Nz] = DelUz_Delz[:, :, Nz - 1]
    Jacobian1_Vorticity_Tensor = zeros(Nx, Ny, Nz)
    Jacobian2_Vorticity_Tensor = 1./2.*(DelUx_Dely - DelUy_Delx)
    Jacobian3_Vorticity_Tensor = 1./2.*(DelUx_Delz - DelUz_Delx)
    Jacobian4_Vorticity_Tensor = 1./2.*(DelUy_Delx - DelUx_Dely)
    Jacobian5_Vorticity_Tensor = zeros(Nx, Ny, Nz)
    Jacobian6_Vorticity_Tensor = 1./2.*(DelUy_Delz - DelUz_Dely)
    Jacobian7_Vorticity_Tensor = 1./2.*(DelUz_Delx - DelUx_Delz)
    Jacobian8_Vorticity_Tensor = 1./2.*(DelUz_Dely - DelUy_Delz)
    Jacobian9_Vorticity_Tensor = zeros(Nx, Ny, Nz)
    Jacobian1_Strain_Rate_Tensor = DelUx_Delx
    Jacobian2_Strain_Rate_Tensor = 1./2.*(DelUx_Dely + DelUy_Delx)
    Jacobian3_Strain_Rate_Tensor = 1./2.*(DelUx_Delz + DelUz_Delx)
    Jacobian4_Strain_Rate_Tensor = 1./2.*(DelUy_Delx + DelUx_Dely)
    Jacobian5_Strain_Rate_Tensor = DelUy_Dely
    Jacobian6_Strain_Rate_Tensor = 1./2.*(DelUy_Delz + DelUz_Dely)
    Jacobian7_Strain_Rate_Tensor = 1./2.*(DelUz_Delx + DelUx_Delz)
    Jacobian8_Strain_Rate_Tensor = 1./2.*(DelUz_Dely + DelUy_Delz)
    Jacobian9_Strain_Rate_Tensor = DelUz_Delz
    Vorticity_Tensor_Normal = (Jacobian1_Vorticity_Tensor.^2) + (Jacobian2_Vorticity_Tensor.^2) + (Jacobian3_Vorticity_Tensor.^2) + (Jacobian4_Vorticity_Tensor.^2) + (Jacobian5_Vorticity_Tensor.^2) + (Jacobian6_Vorticity_Tensor.^2) + (Jacobian7_Vorticity_Tensor.^2) + (Jacobian8_Vorticity_Tensor.^2) + (Jacobian9_Vorticity_Tensor.^2)
    Strain_Rate_Tensor_Normal = (Jacobian1_Strain_Rate_Tensor.^2) + (Jacobian2_Strain_Rate_Tensor.^2) + (Jacobian3_Strain_Rate_Tensor.^2) + (Jacobian4_Strain_Rate_Tensor.^2) + (Jacobian5_Strain_Rate_Tensor.^2) + (Jacobian6_Strain_Rate_Tensor.^2) + (Jacobian7_Strain_Rate_Tensor.^2) + (Jacobian8_Strain_Rate_Tensor.^2) + (Jacobian9_Strain_Rate_Tensor.^2)
    QCriterion = 1./2.*(Vorticity_Tensor_Normal - Strain_Rate_Tensor_Normal)
    Determinant_Tensor1 = Jacobian1_Vorticity_Tensor + Jacobian1_Strain_Rate_Tensor
    Determinant_Tensor2 = Jacobian2_Vorticity_Tensor + Jacobian2_Strain_Rate_Tensor
    Determinant_Tensor3 = Jacobian3_Vorticity_Tensor + Jacobian3_Strain_Rate_Tensor
    Determinant_Tensor4 = Jacobian4_Vorticity_Tensor + Jacobian4_Strain_Rate_Tensor
    Determinant_Tensor5 = Jacobian5_Vorticity_Tensor + Jacobian5_Strain_Rate_Tensor
    Determinant_Tensor6 = Jacobian6_Vorticity_Tensor + Jacobian6_Strain_Rate_Tensor
    Determinant_Tensor7 = Jacobian7_Vorticity_Tensor + Jacobian7_Strain_Rate_Tensor
    Determinant_Tensor8 = Jacobian8_Vorticity_Tensor + Jacobian8_Strain_Rate_Tensor
    Determinant_Tensor9 = Jacobian9_Vorticity_Tensor + Jacobian9_Strain_Rate_Tensor
    R_Determinant = - Determinant_Tensor1.*(Determinant_Tensor5.*Determinant_Tensor9 - Determinant_Tensor6.*Determinant_Tensor8) + Determinant_Tensor2.*(Determinant_Tensor4.*Determinant_Tensor9 - Determinant_Tensor6.*Determinant_Tensor7) - Determinant_Tensor3.*(Determinant_Tensor4.*Determinant_Tensor8 - Determinant_Tensor5.*Determinant_Tensor7)
    DeltaCriterion = ((QCriterion./3).^3) + ((R_Determinant./2).^2)
    Lambda2EigenMatrix = zeros(3, 3)
    Lambda2EigenValue_Warning = 0
    for i = Gx
      for j = Gy
        for k = Gz
          Lambda2EigenMatrix[1, 1] = Jacobian1_Vorticity_Tensor[i, j, k].*Jacobian1_Vorticity_Tensor[i, j, k] + Jacobian2_Vorticity_Tensor[i, j, k].*Jacobian4_Vorticity_Tensor[i, j, k] + Jacobian3_Vorticity_Tensor[i, j, k].*Jacobian7_Vorticity_Tensor[i, j, k] + Jacobian1_Strain_Rate_Tensor[i, j, k].*Jacobian1_Strain_Rate_Tensor[i, j, k] + Jacobian2_Strain_Rate_Tensor[i, j, k].*Jacobian4_Strain_Rate_Tensor[i, j, k] + Jacobian3_Strain_Rate_Tensor[i, j, k].*Jacobian7_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[1, 2] = Jacobian1_Vorticity_Tensor[i, j, k].*Jacobian2_Vorticity_Tensor[i, j, k] + Jacobian2_Vorticity_Tensor[i, j, k].*Jacobian5_Vorticity_Tensor[i, j, k] + Jacobian3_Vorticity_Tensor[i, j, k].*Jacobian8_Vorticity_Tensor[i, j, k] + Jacobian1_Strain_Rate_Tensor[i, j, k].*Jacobian2_Strain_Rate_Tensor[i, j, k] + Jacobian2_Strain_Rate_Tensor[i, j, k].*Jacobian5_Strain_Rate_Tensor[i, j, k] + Jacobian3_Strain_Rate_Tensor[i, j, k].*Jacobian8_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[1, 3] = Jacobian1_Vorticity_Tensor[i, j, k].*Jacobian3_Vorticity_Tensor[i, j, k] + Jacobian2_Vorticity_Tensor[i, j, k].*Jacobian6_Vorticity_Tensor[i, j, k] + Jacobian3_Vorticity_Tensor[i, j, k].*Jacobian9_Vorticity_Tensor[i, j, k] + Jacobian1_Strain_Rate_Tensor[i, j, k].*Jacobian3_Strain_Rate_Tensor[i, j, k] + Jacobian2_Strain_Rate_Tensor[i, j, k].*Jacobian6_Strain_Rate_Tensor[i, j, k] + Jacobian3_Strain_Rate_Tensor[i, j, k].*Jacobian9_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[2, 1] = Jacobian4_Vorticity_Tensor[i, j, k].*Jacobian1_Vorticity_Tensor[i, j, k] + Jacobian5_Vorticity_Tensor[i, j, k].*Jacobian4_Vorticity_Tensor[i, j, k] + Jacobian6_Vorticity_Tensor[i, j, k].*Jacobian7_Vorticity_Tensor[i, j, k] + Jacobian4_Strain_Rate_Tensor[i, j, k].*Jacobian1_Strain_Rate_Tensor[i, j, k] + Jacobian5_Strain_Rate_Tensor[i, j, k].*Jacobian4_Strain_Rate_Tensor[i, j, k] + Jacobian6_Strain_Rate_Tensor[i, j, k].*Jacobian7_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[2, 2] = Jacobian4_Vorticity_Tensor[i, j, k].*Jacobian2_Vorticity_Tensor[i, j, k] + Jacobian5_Vorticity_Tensor[i, j, k].*Jacobian5_Vorticity_Tensor[i, j, k] + Jacobian6_Vorticity_Tensor[i, j, k].*Jacobian8_Vorticity_Tensor[i, j, k] + Jacobian4_Strain_Rate_Tensor[i, j, k].*Jacobian2_Strain_Rate_Tensor[i, j, k] + Jacobian5_Strain_Rate_Tensor[i, j, k].*Jacobian5_Strain_Rate_Tensor[i, j, k] + Jacobian6_Strain_Rate_Tensor[i, j, k].*Jacobian8_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[2, 3] = Jacobian4_Vorticity_Tensor[i, j, k].*Jacobian3_Vorticity_Tensor[i, j, k] + Jacobian5_Vorticity_Tensor[i, j, k].*Jacobian6_Vorticity_Tensor[i, j, k] + Jacobian6_Vorticity_Tensor[i, j, k].*Jacobian9_Vorticity_Tensor[i, j, k] + Jacobian4_Strain_Rate_Tensor[i, j, k].*Jacobian3_Strain_Rate_Tensor[i, j, k] + Jacobian5_Strain_Rate_Tensor[i, j, k].*Jacobian6_Strain_Rate_Tensor[i, j, k] + Jacobian6_Strain_Rate_Tensor[i, j, k].*Jacobian9_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[3, 1] = Jacobian7_Vorticity_Tensor[i, j, k].*Jacobian1_Vorticity_Tensor[i, j, k] + Jacobian8_Vorticity_Tensor[i, j, k].*Jacobian4_Vorticity_Tensor[i, j, k] + Jacobian9_Vorticity_Tensor[i, j, k].*Jacobian7_Vorticity_Tensor[i, j, k] + Jacobian7_Strain_Rate_Tensor[i, j, k].*Jacobian1_Strain_Rate_Tensor[i, j, k] + Jacobian8_Strain_Rate_Tensor[i, j, k].*Jacobian4_Strain_Rate_Tensor[i, j, k] + Jacobian9_Strain_Rate_Tensor[i, j, k].*Jacobian7_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[3, 2] = Jacobian7_Vorticity_Tensor[i, j, k].*Jacobian2_Vorticity_Tensor[i, j, k] + Jacobian8_Vorticity_Tensor[i, j, k].*Jacobian5_Vorticity_Tensor[i, j, k] + Jacobian9_Vorticity_Tensor[i, j, k].*Jacobian8_Vorticity_Tensor[i, j, k] + Jacobian7_Strain_Rate_Tensor[i, j, k].*Jacobian2_Strain_Rate_Tensor[i, j, k] + Jacobian8_Strain_Rate_Tensor[i, j, k].*Jacobian5_Strain_Rate_Tensor[i, j, k] + Jacobian9_Strain_Rate_Tensor[i, j, k].*Jacobian8_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[3, 3] = Jacobian7_Vorticity_Tensor[i, j, k].*Jacobian3_Vorticity_Tensor[i, j, k] + Jacobian8_Vorticity_Tensor[i, j, k].*Jacobian6_Vorticity_Tensor[i, j, k] + Jacobian9_Vorticity_Tensor[i, j, k].*Jacobian9_Vorticity_Tensor[i, j, k] + Jacobian7_Strain_Rate_Tensor[i, j, k].*Jacobian3_Strain_Rate_Tensor[i, j, k] + Jacobian8_Strain_Rate_Tensor[i, j, k].*Jacobian6_Strain_Rate_Tensor[i, j, k] + Jacobian9_Strain_Rate_Tensor[i, j, k].*Jacobian9_Strain_Rate_Tensor[i, j, k]
          Lambda2EigenMatrix[isnan.(Lambda2EigenMatrix)] = 0
          Lambda2EigenMatrix[isinf.(Lambda2EigenMatrix)] = 0
          Lambda2EigenValues = eigvals(Lambda2EigenMatrix)
          Lambda2EigenValues[isnan.(Lambda2EigenValues)] = 0
          Lambda2EigenValues[isinf.(Lambda2EigenValues)] = 0
          if isreal(Lambda2EigenValues)
            Lambda2EigenValues = sort(Lambda2EigenValues)
            Lambda2Criterion[i, j, k] = - Lambda2EigenValues[2]
          else
            Lambda2EigenValue_Warning = Lambda2EigenValue_Warning + 1
            Lambda2Criterion[i, j, k] = NaN
          end
        end
      end
    end
    if Lambda2EigenValue_Warning > 0
      println(" ")
      println("WARNING: When computing Lambda2-Criterion, ", 100*Lambda2EigenValue_Warning./(Nx.*Ny.*Nz - Int64(length(BBR_Indices))), " percent of active nodes had at least one IMAGINARY EIGENVALUE")
      println("WARNING: When computing Lambda2-Criterion, ", 100*Lambda2EigenValue_Warning./(Nx.*Ny.*Nz - Int64(length(BBR_Indices))), " percent of active nodes had at least one IMAGINARY EIGENVALUE")
      println("WARNING: When computing Lambda2-Criterion, ", 100*Lambda2EigenValue_Warning./(Nx.*Ny.*Nz - Int64(length(BBR_Indices))), " percent of active nodes had at least one IMAGINARY EIGENVALUE")
      println(" ")
    end
    QCriterion_Mod3DIsosurface = QCriterion.*1
    QCriterion_Mod2DPlotter = QCriterion.*1
    DeltaCriterion_Mod3DIsosurface = DeltaCriterion.*1
    DeltaCriterion_Mod2DPlotter = DeltaCriterion.*1
    Lambda2Criterion_Mod3DIsosurface = Lambda2Criterion.*1
    Lambda2Criterion_Mod2DPlotter = Lambda2Criterion.*1
    QCriterion_Mod2DPlotter[1, :, :] = NaN
    QCriterion_Mod2DPlotter[Nx, :, :] = NaN
    QCriterion_Mod2DPlotter[:, 1, :] = NaN
    QCriterion_Mod2DPlotter[:, Ny, :] = NaN
    QCriterion_Mod2DPlotter[:, :, 1] = NaN
    QCriterion_Mod2DPlotter[:, :, Nz] = NaN
    DeltaCriterion_Mod2DPlotter[1, :, :] = NaN
    DeltaCriterion_Mod2DPlotter[Nx, :, :] = NaN
    DeltaCriterion_Mod2DPlotter[:, 1, :] = NaN
    DeltaCriterion_Mod2DPlotter[:, Ny, :] = NaN
    DeltaCriterion_Mod2DPlotter[:, :, 1] = NaN
    DeltaCriterion_Mod2DPlotter[:, :, Nz] = NaN
    Lambda2Criterion_Mod2DPlotter[1, :, :] = NaN
    Lambda2Criterion_Mod2DPlotter[Nx, :, :] = NaN
    Lambda2Criterion_Mod2DPlotter[:, 1, :] = NaN
    Lambda2Criterion_Mod2DPlotter[:, Ny, :] = NaN
    Lambda2Criterion_Mod2DPlotter[:, :, 1] = NaN
    Lambda2Criterion_Mod2DPlotter[:, :, Nz] = NaN
    QCriterion_Mod2DPlotter[findin(QCriterion_Mod2DPlotter, QCriterion_Mod2DPlotter[QCriterion_Mod2DPlotter .> (Criterion_VisualCrop*(maximum(QCriterion_Mod2DPlotter)))])] = Criterion_VisualCrop.*maximum(QCriterion_Mod2DPlotter)
    DeltaCriterion_Mod2DPlotter[findin(DeltaCriterion_Mod2DPlotter, DeltaCriterion_Mod2DPlotter[DeltaCriterion_Mod2DPlotter .> (Criterion_VisualCrop*(maximum(DeltaCriterion_Mod2DPlotter)))])] = Criterion_VisualCrop.*maximum(DeltaCriterion_Mod2DPlotter)
    Lambda2Criterion_Mod2DPlotter[findin(Lambda2Criterion_Mod2DPlotter, Lambda2Criterion_Mod2DPlotter[Lambda2Criterion_Mod2DPlotter .> (Criterion_VisualCrop*(maximum(Lambda2Criterion_Mod2DPlotter)))])] = Criterion_VisualCrop.*maximum(Lambda2Criterion_Mod2DPlotter)
    QCriterion_Mod3DIsosurface[findin(QCriterion_Mod3DIsosurface, QCriterion_Mod3DIsosurface[QCriterion_Mod3DIsosurface .> (Criterion_VisualCrop*(maximum(QCriterion_Mod3DIsosurface)))])] = Criterion_VisualCrop.*maximum(QCriterion_Mod3DIsosurface)
    DeltaCriterion_Mod3DIsosurface[findin(DeltaCriterion_Mod3DIsosurface, DeltaCriterion_Mod3DIsosurface[DeltaCriterion_Mod3DIsosurface .> (Criterion_VisualCrop*(maximum(DeltaCriterion_Mod3DIsosurface)))])] = Criterion_VisualCrop.*maximum(DeltaCriterion_Mod3DIsosurface)
    Lambda2Criterion_Mod3DIsosurface[findin(Lambda2Criterion_Mod3DIsosurface, Lambda2Criterion_Mod3DIsosurface[Lambda2Criterion_Mod3DIsosurface .> (Criterion_VisualCrop*(maximum(Lambda2Criterion_Mod3DIsosurface)))])] = Criterion_VisualCrop.*maximum(Lambda2Criterion_Mod3DIsosurface)
    for i = Gx
      for j = Gy
        for k = Gz
          if QCriterion_Mod3DIsosurface[i, j, k] <= QCriterionCrop
            QCriterion_Mod3DIsosurface[i, j, k] = 0
          end
          if DeltaCriterion_Mod3DIsosurface[i, j, k] <= DeltaCriterionCrop
            DeltaCriterion_Mod3DIsosurface[i, j, k] = 0
          end
          if Lambda2Criterion_Mod3DIsosurface[i, j, k] <= Lambda2CriterionCrop
            Lambda2Criterion_Mod3DIsosurface[i, j, k] = 0
          end
          if Total_Walls[i, j, k] == 1
            QCriterion_Mod3DIsosurface[i, j, k] = 0
            DeltaCriterion_Mod3DIsosurface[i, j, k] = 0
            Lambda2Criterion_Mod3DIsosurface[i, j, k] = 0
          end
        end
      end
    end
    if Criterion_OpenViewer == "Yes"
      QCriterion_Mod3DIsosurface[:, 1:Int64(round(Ny./2, RoundUp)), Int64(round(Nz./2, RoundUp)):end] = 0
      DeltaCriterion_Mod3DIsosurface[:, 1:Int64(round(Ny./2, RoundUp)), Int64(round(Nz./2, RoundUp)):end] = 0
      Lambda2Criterion_Mod3DIsosurface[:, 1:Int64(round(Ny./2, RoundUp)), Int64(round(Nz./2, RoundUp)):end] = 0
    end
    QCriterion_Mod3DIsosurface[1, :, :] = 0
    QCriterion_Mod3DIsosurface[Nx, :, :] = 0
    QCriterion_Mod3DIsosurface[:, 1, :] = 0
    QCriterion_Mod3DIsosurface[:, Ny, :] = 0
    QCriterion_Mod3DIsosurface[:, :, 1] = 0
    QCriterion_Mod3DIsosurface[:, :, Nz] = 0
    DeltaCriterion_Mod3DIsosurface[1, :, :] = 0
    DeltaCriterion_Mod3DIsosurface[Nx, :, :] = 0
    DeltaCriterion_Mod3DIsosurface[:, 1, :] = 0
    DeltaCriterion_Mod3DIsosurface[:, Ny, :] = 0
    DeltaCriterion_Mod3DIsosurface[:, :, 1] = 0
    DeltaCriterion_Mod3DIsosurface[:, :, Nz] = 0
    Lambda2Criterion_Mod3DIsosurface[1, :, :] = 0
    Lambda2Criterion_Mod3DIsosurface[Nx, :, :] = 0
    Lambda2Criterion_Mod3DIsosurface[:, 1, :] = 0
    Lambda2Criterion_Mod3DIsosurface[:, Ny, :] = 0
    Lambda2Criterion_Mod3DIsosurface[:, :, 1] = 0
    Lambda2Criterion_Mod3DIsosurface[:, :, Nz] = 0
    QPlot1_X = reshape(X_Plot, Nx.*Ny.*Nz)
    QPlot1_Y = reshape(Y_Plot, Nx.*Ny.*Nz)
    QPlot1_Z = reshape(Z_Plot, Nx.*Ny.*Nz)
    QFinder = find(QCriterion_Mod3DIsosurface)
    DeltaPlot1_X = reshape(X_Plot, Nx.*Ny.*Nz)
    DeltaPlot1_Y = reshape(Y_Plot, Nx.*Ny.*Nz)
    DeltaPlot1_Z = reshape(Z_Plot, Nx.*Ny.*Nz)
    DeltaFinder = find(DeltaCriterion_Mod3DIsosurface)
    Lambda2Plot1_X = reshape(X_Plot, Nx.*Ny.*Nz)
    Lambda2Plot1_Y = reshape(Y_Plot, Nx.*Ny.*Nz)
    Lambda2Plot1_Z = reshape(Z_Plot, Nx.*Ny.*Nz)
    Lambda2Finder = find(Lambda2Criterion_Mod3DIsosurface)
    if Display_Contours == "Criterion"
      QPlot1_Colour = reshape(QCriterion_Mod3DIsosurface, Nx.*Ny.*Nz)
      DeltaPlot1_Colour = reshape(DeltaCriterion_Mod3DIsosurface, Nx.*Ny.*Nz)
      Lambda2Plot1_Colour = reshape(Lambda2Criterion_Mod3DIsosurface, Nx.*Ny.*Nz)
    end
    if Display_Contours == "Velocity"
      QPlot1_Colour = reshape(Ut_Plot, Nx.*Ny.*Nz)
      DeltaPlot1_Colour = reshape(Ut_Plot, Nx.*Ny.*Nz)
      Lambda2Plot1_Colour = reshape(Ut_Plot, Nx.*Ny.*Nz)
    end
    if Display_Contours == "Pressure"
      QPlot1_Colour = reshape(Rho_Plot, Nx.*Ny.*Nz)
      DeltaPlot1_Colour = reshape(Rho_Plot, Nx.*Ny.*Nz)
      Lambda2Plot1_Colour = reshape(Rho_Plot, Nx.*Ny.*Nz)
    end
    while length(QFinder) > Graphics_Threshold
      QCriterion_Mod3DIsosurface = QCriterion_Mod3DIsosurface[1:2:end]
      QPlot1_X = QPlot1_X[1:2:end]
      QPlot1_Y = QPlot1_Y[1:2:end]
      QPlot1_Z = QPlot1_Z[1:2:end]
      QPlot1_Colour = QPlot1_Colour[1:2:end]
      QFinder = find(QCriterion_Mod3DIsosurface)
    end
    while length(DeltaFinder) > Graphics_Threshold
      DeltaCriterion_Mod3DIsosurface = DeltaCriterion_Mod3DIsosurface[1:2:end]
      DeltaPlot1_X = DeltaPlot1_X[1:2:end]
      DeltaPlot1_Y = DeltaPlot1_Y[1:2:end]
      DeltaPlot1_Z = DeltaPlot1_Z[1:2:end]
      DeltaPlot1_Colour = DeltaPlot1_Colour[1:2:end]
      DeltaFinder = find(DeltaCriterion_Mod3DIsosurface)
    end
    while length(Lambda2Finder) > Graphics_Threshold
      Lambda2Criterion_Mod3DIsosurface = Lambda2Criterion_Mod3DIsosurface[1:2:end]
      Lambda2Plot1_X = Lambda2Plot1_X[1:2:end]
      Lambda2Plot1_Y = Lambda2Plot1_Y[1:2:end]
      Lambda2Plot1_Z = Lambda2Plot1_Z[1:2:end]
      Lambda2Plot1_Colour = Lambda2Plot1_Colour[1:2:end]
      Lambda2Finder = find(Lambda2Criterion_Mod3DIsosurface)
    end
    QPlot2_X = zeros(length(QFinder))
    QPlot2_Y = zeros(length(QFinder))
    QPlot2_Z = zeros(length(QFinder))
    QPlot2_Colour = zeros(length(QFinder))
    DeltaPlot2_X = zeros(length(DeltaFinder))
    DeltaPlot2_Y = zeros(length(DeltaFinder))
    DeltaPlot2_Z = zeros(length(DeltaFinder))
    DeltaPlot2_Colour = zeros(length(DeltaFinder))
    Lambda2Plot2_X = zeros(length(Lambda2Finder))
    Lambda2Plot2_Y = zeros(length(Lambda2Finder))
    Lambda2Plot2_Z = zeros(length(Lambda2Finder))
    Lambda2Plot2_Colour = zeros(length(Lambda2Finder))
    for ijk = 1:length(QFinder)
      QPlot2_X[ijk] = QPlot1_X[QFinder[ijk]]
      QPlot2_Y[ijk] = QPlot1_Y[QFinder[ijk]]
      QPlot2_Z[ijk] = QPlot1_Z[QFinder[ijk]]
      QPlot2_Colour[ijk] = QPlot1_Colour[QFinder[ijk]]
    end
    for ijk = 1:length(DeltaFinder)
      DeltaPlot2_X[ijk] = DeltaPlot1_X[DeltaFinder[ijk]]
      DeltaPlot2_Y[ijk] = DeltaPlot1_Y[DeltaFinder[ijk]]
      DeltaPlot2_Z[ijk] = DeltaPlot1_Z[DeltaFinder[ijk]]
      DeltaPlot2_Colour[ijk] = DeltaPlot1_Colour[DeltaFinder[ijk]]
    end
    for ijk = 1:length(Lambda2Finder)
      Lambda2Plot2_X[ijk] = Lambda2Plot1_X[Lambda2Finder[ijk]]
      Lambda2Plot2_Y[ijk] = Lambda2Plot1_Y[Lambda2Finder[ijk]]
      Lambda2Plot2_Z[ijk] = Lambda2Plot1_Z[Lambda2Finder[ijk]]
      Lambda2Plot2_Colour[ijk] = Lambda2Plot1_Colour[Lambda2Finder[ijk]]
    end

    for i = Gx
      for j = Gy
        for k = Gz
          if Total_Walls[i, j, k] == 1
            Ux_Plot[i, j, k] = NaN
            Uy_Plot[i, j, k] = NaN
            Uz_Plot[i, j, k] = NaN
            Ut_Plot[i, j, k] = NaN
            Rho_Plot[i, j, k] = NaN
            QCriterion_Mod2DPlotter[i, j, k] = NaN
            DeltaCriterion_Mod2DPlotter[i, j, k] = NaN
            Lambda2Criterion_Mod2DPlotter[i, j, k] = NaN
          end
        end
      end
    end

    using Plots
    plotly()
    plot()
    plot!((1:Current_Timestep - 1).'.', Drag_Coefficient[1, 1:Current_Timestep - 1])
    plot!((1:Current_Timestep - 1).'.', YLift_Coefficient[1, 1:Current_Timestep - 1])
    plot!((1:Current_Timestep - 1).'.', ZLift_Coefficient[1, 1:Current_Timestep - 1])
    xlims!(0, Current_Timestep - 1)
    ylims!( - 1, 3)
    gui()

    using Plots
    plotly()
    if sum(QFinder) > 0
      scatter3d(QPlot2_X, QPlot2_Y, QPlot2_Z, zcolor = QPlot2_Colour, marker = (:circle, 2, stroke(0)), aspectratio = :equal, color = :plasma)
    end
    xlims!(0, Nx)
    ylims!(0, Ny)
    zlims!(0, Nz)
    gui()

    using Plots
    plotly()
    if sum(DeltaFinder) > 0
      scatter3d(DeltaPlot2_X, DeltaPlot2_Y, DeltaPlot2_Z, zcolor = DeltaPlot2_Colour, marker = (:circle, 2, stroke(0)), aspectratio = :equal, color = :plasma)
    end
    xlims!(0, Nx)
    ylims!(0, Ny)
    zlims!(0, Nz)
    gui()

    using Plots
    plotly()
    if sum(Lambda2Finder) > 0
      scatter3d(Lambda2Plot2_X, Lambda2Plot2_Y, Lambda2Plot2_Z, zcolor = Lambda2Plot2_Colour, marker = (:circle, 2, stroke(0)), aspectratio = :equal, color = :plasma)
    end
    xlims!(0, Nx)
    ylims!(0, Ny)
    zlims!(0, Nz)
    gui()

    using Plots
    plotly()
    L_Plot = grid(5, 4, heights = [1/5, 1/5, 1/5, 1/5, 1/5], widths = [75/200, 75/200, 25/200, 25/200])
    P_Plot = plot(st = [:heatmap], layout = L_Plot, link = :x, colorbar = :none, legend = :none)
    heatmap!(P_Plot[1], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Ux_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[5], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Uy_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[9], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Uz_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[13], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Ut_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[17], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Rho_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[2], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Ux_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[6], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Uy_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[10], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Uz_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[14], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Ut_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[18], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Rho_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[3], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ux_Plot[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[7], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uy_Plot[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[11], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uz_Plot[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[15], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ut_Plot[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[19], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Rho_Plot[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[4], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ux_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] x-Velocity at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[8], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uy_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] y-Velocity at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[12], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uz_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] z-Velocity at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[16], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ut_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] Total Velocity at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[20], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Rho_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] Total Pressure at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    gui()

    using Plots
    plotly()
    L_Plot = grid(3, 4, heights = [1/3, 1/3, 1/3], widths = [75/200, 75/200, 25/200, 25/200])
    P_Plot = plot(st = [:heatmap], layout = L_Plot, link = :x, colorbar = :none, legend = :none)
    heatmap!(P_Plot[1], X_Plot[:, 1, 1], Y_Plot[1, :, 1], QCriterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[5], X_Plot[:, 1, 1], Y_Plot[1, :, 1], DeltaCriterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[9], X_Plot[:, 1, 1], Y_Plot[1, :, 1], Lambda2Criterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[2], X_Plot[:, 1, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[6], X_Plot[:, 1, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[10], X_Plot[:, 1, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[3], Y_Plot[1, :, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[7], Y_Plot[1, :, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[11], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[Obstacle_Center_x, :, :].', xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[4], Y_Plot[1, :, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] Q-Criterion at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[8], Y_Plot[1, :, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] Delta-Criterion at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[12], Y_Plot[1, :, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane] Lambda2-Criterion at Time Step = $Current_Timestep                      ", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    gui()
  end

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # AUTOSAVE STEP
  if ((Autosave_Data_Incrementally == "Yes") && (mod(Cycle + 1, Autosave_Increment) == 1)) || ((Autosave_Data_Maximum_Iterations == "Yes") && (Cycle == Maximum_Iterations))
    println(" ")
    println("SAVING DATA")
    println("SAVING DATA")
    println("SAVING DATA")
    println(" ")

    Printer_Nx = Int64(Nx - 2)
    Printer_Ny = Int64(Ny - 2)
    Printer_Nz = Int64(Nz - 2)
    Printer_Nx_Mod = Nx
    Printer_Ny_Mod = Ny
    Printer_Nz_Mod = Nz
    Printer_Re = Re
    Printer_Ma = Ma
    Printer_Rho_Initial = Rho_Initial
    Printer_Maximum_Iterations = Maximum_Iterations
    Printer_Cycle_Plot = Cycle_Plot
    Printer_Force_Plot = Force_Plot
    Printer_Force_Plot_Crop = Force_Plot_Crop
    Printer_QCriterionCrop = QCriterionCrop
    Printer_DeltaCriterionCrop = DeltaCriterionCrop
    Printer_Lambda2CriterionCrop = Lambda2CriterionCrop
    Printer_Boundary_Walls = Boundary_Walls
    Printer_Sphere_Cube_CircularCylinder_SquareCylinder = Sphere_Cube_CircularCylinder_SquareCylinder
    Printer_Previous_Cycle_Plot = Previous_Cycle_Plot
    Printer_Current_Timestep = Current_Timestep

    Printer_Obstacle_Center_x = Obstacle_Center_x
    Printer_Obstacle_Center_y = Obstacle_Center_y
    Printer_Obstacle_Center_z = Obstacle_Center_z
    Printer_Obstacle_Radius = Obstacle_Radius
    Printer_Nu = Nu
    Printer_Omega = Omega
    Printer_Obstacle = Obstacle
    Printer_Wall = Wall
    Printer_BBR_Indices_i = BBR_Indices_i
    Printer_BBR_Indices_j = BBR_Indices_j
    Printer_BBR_Indices_k = BBR_Indices_k
    Printer_BBR_Indices = BBR_Indices

    Printer_Fx_Obstacle = Fx_Obstacle.*1
    Printer_Fy_Obstacle = Fy_Obstacle.*1
    Printer_Fz_Obstacle = Fz_Obstacle.*1
    Printer_Drag_Coefficient = Drag_Coefficient.*1
    Printer_YLift_Coefficient = YLift_Coefficient.*1
    Printer_ZLift_Coefficient = ZLift_Coefficient.*1

    Printer_Input_Parameters = [Printer_Nx Printer_Ny Printer_Nz Printer_Re Printer_Ma Printer_Rho_Initial Printer_Maximum_Iterations Printer_Cycle_Plot Printer_Force_Plot Printer_Force_Plot_Crop Printer_QCriterionCrop Printer_DeltaCriterionCrop Printer_Lambda2CriterionCrop Printer_Boundary_Walls Printer_Sphere_Cube_CircularCylinder_SquareCylinder Printer_Current_Timestep]

    Outfile_LBM_D3Q27_1 = "LBM D3Q27 $Autosave_Title - #1 INPUT PARAMETERS - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_1 = open(Outfile_LBM_D3Q27_1, "w")
    show(Outfile_Opener_LBM_D3Q27_1, "$Printer_Input_Parameters")
    close(Outfile_Opener_LBM_D3Q27_1)

    Outfile_LBM_D3Q27_2 = "LBM D3Q27 $Autosave_Title - #2 Fx Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_2 = open(Outfile_LBM_D3Q27_2, "w")
    show(Outfile_Opener_LBM_D3Q27_2, "$Printer_Fx_Obstacle")
    close(Outfile_Opener_LBM_D3Q27_2)

    Outfile_LBM_D3Q27_3 = "LBM D3Q27 $Autosave_Title - #3 Fy Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_3 = open(Outfile_LBM_D3Q27_3, "w")
    show(Outfile_Opener_LBM_D3Q27_3, "$Printer_Fy_Obstacle")
    close(Outfile_Opener_LBM_D3Q27_3)

    Outfile_LBM_D3Q27_4 = "LBM D3Q27 $Autosave_Title - #4 Fz Obstacle - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_4 = open(Outfile_LBM_D3Q27_4, "w")
    show(Outfile_Opener_LBM_D3Q27_4, "$Printer_Fz_Obstacle")
    close(Outfile_Opener_LBM_D3Q27_4)

    Outfile_LBM_D3Q27_5 = "LBM D3Q27 $Autosave_Title - #5 Drag Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_5 = open(Outfile_LBM_D3Q27_5, "w")
    show(Outfile_Opener_LBM_D3Q27_5, "$Printer_Drag_Coefficient")
    close(Outfile_Opener_LBM_D3Q27_5)

    Outfile_LBM_D3Q27_6 = "LBM D3Q27 $Autosave_Title - #6 Y-Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_6 = open(Outfile_LBM_D3Q27_6, "w")
    show(Outfile_Opener_LBM_D3Q27_6, "$Printer_YLift_Coefficient")
    close(Outfile_Opener_LBM_D3Q27_6)

    Outfile_LBM_D3Q27_7 = "LBM D3Q27 $Autosave_Title - #7 Z-Lift Coefficient - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
    Outfile_Opener_LBM_D3Q27_7 = open(Outfile_LBM_D3Q27_7, "w")
    show(Outfile_Opener_LBM_D3Q27_7, "$Printer_ZLift_Coefficient")
    close(Outfile_Opener_LBM_D3Q27_7)

    # Data manipulation and export (Matrices)
    for k = Gz
      println("Saving pane ", k, " of ", Nz)

      Printer_f01 = f01[:, :, k]
      Printer_f02 = f02[:, :, k]
      Printer_f03 = f03[:, :, k]
      Printer_f04 = f04[:, :, k]
      Printer_f05 = f05[:, :, k]
      Printer_f06 = f06[:, :, k]
      Printer_f07 = f07[:, :, k]
      Printer_f08 = f08[:, :, k]
      Printer_f09 = f09[:, :, k]
      Printer_f10 = f10[:, :, k]
      Printer_f11 = f11[:, :, k]
      Printer_f12 = f12[:, :, k]
      Printer_f13 = f13[:, :, k]
      Printer_f14 = f14[:, :, k]
      Printer_f15 = f15[:, :, k]
      Printer_f16 = f16[:, :, k]
      Printer_f17 = f17[:, :, k]
      Printer_f18 = f18[:, :, k]
      Printer_f19 = f19[:, :, k]
      Printer_f20 = f20[:, :, k]
      Printer_f21 = f21[:, :, k]
      Printer_f22 = f22[:, :, k]
      Printer_f23 = f23[:, :, k]
      Printer_f24 = f24[:, :, k]
      Printer_f25 = f25[:, :, k]
      Printer_f26 = f26[:, :, k]
      Printer_f27 = f27[:, :, k]
      Printer_Ux = Ux[:, :, k]
      Printer_Uy = Uy[:, :, k]
      Printer_Uz = Uz[:, :, k]
      Printer_Rho = Rho[:, :, k]
      Printer_X_Plot = X_Plot[:, :, k]
      Printer_Y_Plot = Y_Plot[:, :, k]
      Printer_Z_Plot = Z_Plot[:, :, k]
      Printer_Ut_Plot = Ut_Plot[:, :, k]
      Printer_Ux_Plot = Ux_Plot[:, :, k]
      Printer_Uy_Plot = Uy_Plot[:, :, k]
      Printer_Uz_Plot = Uz_Plot[:, :, k]
      Printer_Rho_Plot = Rho_Plot[:, :, k]
      Printer_QCriterion = QCriterion[:, :, k]
      Printer_DeltaCriterion = DeltaCriterion[:, :, k]
      Printer_Lambda2Criterion = Lambda2Criterion[:, :, k]
      Printer_QCriterion_Mod2DPlotter = QCriterion_Mod2DPlotter[:, :, k]
      Printer_DeltaCriterion_Mod2DPlotter = DeltaCriterion_Mod2DPlotter[:, :, k]
      Printer_Lambda2Criterion_Mod2DPlotter = Lambda2Criterion_Mod2DPlotter[:, :, k]

      Printer_f01 = reshape(Printer_f01, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f02 = reshape(Printer_f02, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f03 = reshape(Printer_f03, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f04 = reshape(Printer_f04, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f05 = reshape(Printer_f05, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f06 = reshape(Printer_f06, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f07 = reshape(Printer_f07, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f08 = reshape(Printer_f08, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f09 = reshape(Printer_f09, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f10 = reshape(Printer_f10, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f11 = reshape(Printer_f11, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f12 = reshape(Printer_f12, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f13 = reshape(Printer_f13, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f14 = reshape(Printer_f14, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f15 = reshape(Printer_f15, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f16 = reshape(Printer_f16, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f17 = reshape(Printer_f17, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f18 = reshape(Printer_f18, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f19 = reshape(Printer_f19, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f20 = reshape(Printer_f20, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f21 = reshape(Printer_f21, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f22 = reshape(Printer_f22, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f23 = reshape(Printer_f23, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f24 = reshape(Printer_f24, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f25 = reshape(Printer_f25, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f26 = reshape(Printer_f26, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f27 = reshape(Printer_f27, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Ux = reshape(Printer_Ux, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Uy = reshape(Printer_Uy, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Uz = reshape(Printer_Uz, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Rho = reshape(Printer_Rho, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_X_Plot = reshape(Printer_X_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Y_Plot = reshape(Printer_Y_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Z_Plot = reshape(Printer_Z_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Ut_Plot = reshape(Printer_Ut_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Ux_Plot = reshape(Printer_Ux_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Uy_Plot = reshape(Printer_Uy_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Uz_Plot = reshape(Printer_Uz_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Rho_Plot = reshape(Printer_Rho_Plot, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_QCriterion = reshape(Printer_QCriterion, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_DeltaCriterion = reshape(Printer_DeltaCriterion, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Lambda2Criterion = reshape(Printer_Lambda2Criterion, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_QCriterion_Mod2DPlotter = reshape(Printer_QCriterion_Mod2DPlotter, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_DeltaCriterion_Mod2DPlotter = reshape(Printer_DeltaCriterion_Mod2DPlotter, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_Lambda2Criterion_Mod2DPlotter = reshape(Printer_Lambda2Criterion_Mod2DPlotter, (Printer_Nx + 2).*(Printer_Ny + 2))

      Outfile_LBM_D3Q27_8 = "LBM D3Q27 $Autosave_Title - #8 (Part $k of $Printer_Nz_Mod) f01 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_8 = open(Outfile_LBM_D3Q27_8, "w")
      show(Outfile_Opener_LBM_D3Q27_8, "$Printer_f01")
      close(Outfile_Opener_LBM_D3Q27_8)

      Outfile_LBM_D3Q27_9 = "LBM D3Q27 $Autosave_Title - #9 (Part $k of $Printer_Nz_Mod) f02 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_9 = open(Outfile_LBM_D3Q27_9, "w")
      show(Outfile_Opener_LBM_D3Q27_9, "$Printer_f02")
      close(Outfile_Opener_LBM_D3Q27_9)

      Outfile_LBM_D3Q27_10 = "LBM D3Q27 $Autosave_Title - #10 (Part $k of $Printer_Nz_Mod) f03 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_10 = open(Outfile_LBM_D3Q27_10, "w")
      show(Outfile_Opener_LBM_D3Q27_10, "$Printer_f03")
      close(Outfile_Opener_LBM_D3Q27_10)

      Outfile_LBM_D3Q27_11 = "LBM D3Q27 $Autosave_Title - #11 (Part $k of $Printer_Nz_Mod) f04 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_11 = open(Outfile_LBM_D3Q27_11, "w")
      show(Outfile_Opener_LBM_D3Q27_11, "$Printer_f04")
      close(Outfile_Opener_LBM_D3Q27_11)

      Outfile_LBM_D3Q27_12 = "LBM D3Q27 $Autosave_Title - #12 (Part $k of $Printer_Nz_Mod) f05 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_12 = open(Outfile_LBM_D3Q27_12, "w")
      show(Outfile_Opener_LBM_D3Q27_12, "$Printer_f05")
      close(Outfile_Opener_LBM_D3Q27_12)

      Outfile_LBM_D3Q27_13 = "LBM D3Q27 $Autosave_Title - #13 (Part $k of $Printer_Nz_Mod) f06 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_13 = open(Outfile_LBM_D3Q27_13, "w")
      show(Outfile_Opener_LBM_D3Q27_13, "$Printer_f06")
      close(Outfile_Opener_LBM_D3Q27_13)

      Outfile_LBM_D3Q27_14 = "LBM D3Q27 $Autosave_Title - #14 (Part $k of $Printer_Nz_Mod) f07 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_14 = open(Outfile_LBM_D3Q27_14, "w")
      show(Outfile_Opener_LBM_D3Q27_14, "$Printer_f07")
      close(Outfile_Opener_LBM_D3Q27_14)

      Outfile_LBM_D3Q27_15 = "LBM D3Q27 $Autosave_Title - #15 (Part $k of $Printer_Nz_Mod) f08 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_15 = open(Outfile_LBM_D3Q27_15, "w")
      show(Outfile_Opener_LBM_D3Q27_15, "$Printer_f08")
      close(Outfile_Opener_LBM_D3Q27_15)

      Outfile_LBM_D3Q27_16 = "LBM D3Q27 $Autosave_Title - #16 (Part $k of $Printer_Nz_Mod) f09 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_16 = open(Outfile_LBM_D3Q27_16, "w")
      show(Outfile_Opener_LBM_D3Q27_16, "$Printer_f09")
      close(Outfile_Opener_LBM_D3Q27_16)

      Outfile_LBM_D3Q27_17 = "LBM D3Q27 $Autosave_Title - #17 (Part $k of $Printer_Nz_Mod) f10 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_17 = open(Outfile_LBM_D3Q27_17, "w")
      show(Outfile_Opener_LBM_D3Q27_17, "$Printer_f10")
      close(Outfile_Opener_LBM_D3Q27_17)

      Outfile_LBM_D3Q27_18 = "LBM D3Q27 $Autosave_Title - #18 (Part $k of $Printer_Nz_Mod) f11 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_18 = open(Outfile_LBM_D3Q27_18, "w")
      show(Outfile_Opener_LBM_D3Q27_18, "$Printer_f11")
      close(Outfile_Opener_LBM_D3Q27_18)

      Outfile_LBM_D3Q27_19 = "LBM D3Q27 $Autosave_Title - #19 (Part $k of $Printer_Nz_Mod) f12 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_19 = open(Outfile_LBM_D3Q27_19, "w")
      show(Outfile_Opener_LBM_D3Q27_19, "$Printer_f12")
      close(Outfile_Opener_LBM_D3Q27_19)

      Outfile_LBM_D3Q27_20 = "LBM D3Q27 $Autosave_Title - #20 (Part $k of $Printer_Nz_Mod) f13 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_20 = open(Outfile_LBM_D3Q27_20, "w")
      show(Outfile_Opener_LBM_D3Q27_20, "$Printer_f13")
      close(Outfile_Opener_LBM_D3Q27_20)

      Outfile_LBM_D3Q27_21 = "LBM D3Q27 $Autosave_Title - #21 (Part $k of $Printer_Nz_Mod) f14 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_21 = open(Outfile_LBM_D3Q27_21, "w")
      show(Outfile_Opener_LBM_D3Q27_21, "$Printer_f14")
      close(Outfile_Opener_LBM_D3Q27_21)

      Outfile_LBM_D3Q27_22 = "LBM D3Q27 $Autosave_Title - #22 (Part $k of $Printer_Nz_Mod) f15 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_22 = open(Outfile_LBM_D3Q27_22, "w")
      show(Outfile_Opener_LBM_D3Q27_22, "$Printer_f15")
      close(Outfile_Opener_LBM_D3Q27_22)

      Outfile_LBM_D3Q27_23 = "LBM D3Q27 $Autosave_Title - #23 (Part $k of $Printer_Nz_Mod) f16 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_23 = open(Outfile_LBM_D3Q27_23, "w")
      show(Outfile_Opener_LBM_D3Q27_23, "$Printer_f16")
      close(Outfile_Opener_LBM_D3Q27_23)

      Outfile_LBM_D3Q27_24 = "LBM D3Q27 $Autosave_Title - #24 (Part $k of $Printer_Nz_Mod) f17 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_24 = open(Outfile_LBM_D3Q27_24, "w")
      show(Outfile_Opener_LBM_D3Q27_24, "$Printer_f17")
      close(Outfile_Opener_LBM_D3Q27_24)

      Outfile_LBM_D3Q27_25 = "LBM D3Q27 $Autosave_Title - #25 (Part $k of $Printer_Nz_Mod) f18 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_25 = open(Outfile_LBM_D3Q27_25, "w")
      show(Outfile_Opener_LBM_D3Q27_25, "$Printer_f18")
      close(Outfile_Opener_LBM_D3Q27_25)

      Outfile_LBM_D3Q27_26 = "LBM D3Q27 $Autosave_Title - #26 (Part $k of $Printer_Nz_Mod) f19 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_26 = open(Outfile_LBM_D3Q27_26, "w")
      show(Outfile_Opener_LBM_D3Q27_26, "$Printer_f19")
      close(Outfile_Opener_LBM_D3Q27_26)

      Outfile_LBM_D3Q27_27 = "LBM D3Q27 $Autosave_Title - #27 (Part $k of $Printer_Nz_Mod) f20 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_27 = open(Outfile_LBM_D3Q27_27, "w")
      show(Outfile_Opener_LBM_D3Q27_27, "$Printer_f20")
      close(Outfile_Opener_LBM_D3Q27_27)

      Outfile_LBM_D3Q27_28 = "LBM D3Q27 $Autosave_Title - #28 (Part $k of $Printer_Nz_Mod) f21 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_28 = open(Outfile_LBM_D3Q27_28, "w")
      show(Outfile_Opener_LBM_D3Q27_28, "$Printer_f21")
      close(Outfile_Opener_LBM_D3Q27_28)

      Outfile_LBM_D3Q27_29 = "LBM D3Q27 $Autosave_Title - #29 (Part $k of $Printer_Nz_Mod) f22 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_29 = open(Outfile_LBM_D3Q27_29, "w")
      show(Outfile_Opener_LBM_D3Q27_29, "$Printer_f22")
      close(Outfile_Opener_LBM_D3Q27_29)

      Outfile_LBM_D3Q27_30 = "LBM D3Q27 $Autosave_Title - #30 (Part $k of $Printer_Nz_Mod) f23 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_30 = open(Outfile_LBM_D3Q27_30, "w")
      show(Outfile_Opener_LBM_D3Q27_30, "$Printer_f23")
      close(Outfile_Opener_LBM_D3Q27_30)

      Outfile_LBM_D3Q27_31 = "LBM D3Q27 $Autosave_Title - #31 (Part $k of $Printer_Nz_Mod) f24 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_31 = open(Outfile_LBM_D3Q27_31, "w")
      show(Outfile_Opener_LBM_D3Q27_31, "$Printer_f24")
      close(Outfile_Opener_LBM_D3Q27_31)

      Outfile_LBM_D3Q27_32 = "LBM D3Q27 $Autosave_Title - #32 (Part $k of $Printer_Nz_Mod) f25 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_32 = open(Outfile_LBM_D3Q27_32, "w")
      show(Outfile_Opener_LBM_D3Q27_32, "$Printer_f25")
      close(Outfile_Opener_LBM_D3Q27_32)

      Outfile_LBM_D3Q27_33 = "LBM D3Q27 $Autosave_Title - #33 (Part $k of $Printer_Nz_Mod) f26 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_33 = open(Outfile_LBM_D3Q27_33, "w")
      show(Outfile_Opener_LBM_D3Q27_33, "$Printer_f26")
      close(Outfile_Opener_LBM_D3Q27_33)

      Outfile_LBM_D3Q27_34 = "LBM D3Q27 $Autosave_Title - #34 (Part $k of $Printer_Nz_Mod) f27 - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_34 = open(Outfile_LBM_D3Q27_34, "w")
      show(Outfile_Opener_LBM_D3Q27_34, "$Printer_f27")
      close(Outfile_Opener_LBM_D3Q27_34)

      Outfile_LBM_D3Q27_35 = "LBM D3Q27 $Autosave_Title - #35 (Part $k of $Printer_Nz_Mod) Ux - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_35 = open(Outfile_LBM_D3Q27_35, "w")
      show(Outfile_Opener_LBM_D3Q27_35, "$Printer_Ux")
      close(Outfile_Opener_LBM_D3Q27_35)

      Outfile_LBM_D3Q27_36 = "LBM D3Q27 $Autosave_Title - #36 (Part $k of $Printer_Nz_Mod) Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_36 = open(Outfile_LBM_D3Q27_36, "w")
      show(Outfile_Opener_LBM_D3Q27_36, "$Printer_Uy")
      close(Outfile_Opener_LBM_D3Q27_36)

      Outfile_LBM_D3Q27_37 = "LBM D3Q27 $Autosave_Title - #37 (Part $k of $Printer_Nz_Mod) Uy - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_37 = open(Outfile_LBM_D3Q27_37, "w")
      show(Outfile_Opener_LBM_D3Q27_37, "$Printer_Uy")
      close(Outfile_Opener_LBM_D3Q27_37)

      Outfile_LBM_D3Q27_38 = "LBM D3Q27 $Autosave_Title - #38 (Part $k of $Printer_Nz_Mod) Rho - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_38 = open(Outfile_LBM_D3Q27_38, "w")
      show(Outfile_Opener_LBM_D3Q27_38, "$Printer_Rho")
      close(Outfile_Opener_LBM_D3Q27_38)

      Outfile_LBM_D3Q27_39 = "LBM D3Q27 $Autosave_Title - #39 (Part $k of $Printer_Nz_Mod) X_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_39 = open(Outfile_LBM_D3Q27_39, "w")
      show(Outfile_Opener_LBM_D3Q27_39, "$Printer_X_Plot")
      close(Outfile_Opener_LBM_D3Q27_39)

      Outfile_LBM_D3Q27_40 = "LBM D3Q27 $Autosave_Title - #40 (Part $k of $Printer_Nz_Mod) Y_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_40 = open(Outfile_LBM_D3Q27_40, "w")
      show(Outfile_Opener_LBM_D3Q27_40, "$Printer_Y_Plot")
      close(Outfile_Opener_LBM_D3Q27_40)

      Outfile_LBM_D3Q27_41 = "LBM D3Q27 $Autosave_Title - #41 (Part $k of $Printer_Nz_Mod) Z_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_41 = open(Outfile_LBM_D3Q27_41, "w")
      show(Outfile_Opener_LBM_D3Q27_41, "$Printer_Z_Plot")
      close(Outfile_Opener_LBM_D3Q27_41)

      Outfile_LBM_D3Q27_42 = "LBM D3Q27 $Autosave_Title - #42 (Part $k of $Printer_Nz_Mod) Ut_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_42 = open(Outfile_LBM_D3Q27_42, "w")
      show(Outfile_Opener_LBM_D3Q27_42, "$Printer_Ut_Plot")
      close(Outfile_Opener_LBM_D3Q27_42)

      Outfile_LBM_D3Q27_43 = "LBM D3Q27 $Autosave_Title - #43 (Part $k of $Printer_Nz_Mod) Ux_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_43 = open(Outfile_LBM_D3Q27_43, "w")
      show(Outfile_Opener_LBM_D3Q27_43, "$Printer_Ux_Plot")
      close(Outfile_Opener_LBM_D3Q27_43)

      Outfile_LBM_D3Q27_44 = "LBM D3Q27 $Autosave_Title - #44 (Part $k of $Printer_Nz_Mod) Uy_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_44 = open(Outfile_LBM_D3Q27_44, "w")
      show(Outfile_Opener_LBM_D3Q27_44, "$Printer_Uy_Plot")
      close(Outfile_Opener_LBM_D3Q27_44)

      Outfile_LBM_D3Q27_45 = "LBM D3Q27 $Autosave_Title - #45 (Part $k of $Printer_Nz_Mod) Uz_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_45 = open(Outfile_LBM_D3Q27_45, "w")
      show(Outfile_Opener_LBM_D3Q27_45, "$Printer_Uz_Plot")
      close(Outfile_Opener_LBM_D3Q27_45)

      Outfile_LBM_D3Q27_46 = "LBM D3Q27 $Autosave_Title - #46 (Part $k of $Printer_Nz_Mod) Rho_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_46 = open(Outfile_LBM_D3Q27_46, "w")
      show(Outfile_Opener_LBM_D3Q27_46, "$Printer_Rho_Plot")
      close(Outfile_Opener_LBM_D3Q27_46)

      Outfile_LBM_D3Q27_47 = "LBM D3Q27 $Autosave_Title - #47 (Part $k of $Printer_Nz_Mod) Q-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_47 = open(Outfile_LBM_D3Q27_47, "w")
      show(Outfile_Opener_LBM_D3Q27_47, "$Printer_QCriterion")
      close(Outfile_Opener_LBM_D3Q27_47)

      Outfile_LBM_D3Q27_48 = "LBM D3Q27 $Autosave_Title - #48 (Part $k of $Printer_Nz_Mod) Delta-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_48 = open(Outfile_LBM_D3Q27_48, "w")
      show(Outfile_Opener_LBM_D3Q27_48, "$Printer_DeltaCriterion")
      close(Outfile_Opener_LBM_D3Q27_48)

      Outfile_LBM_D3Q27_49 = "LBM D3Q27 $Autosave_Title - #49 (Part $k of $Printer_Nz_Mod) Lambda2-Criterion - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_49 = open(Outfile_LBM_D3Q27_49, "w")
      show(Outfile_Opener_LBM_D3Q27_49, "$Printer_Lambda2Criterion")
      close(Outfile_Opener_LBM_D3Q27_49)

      Outfile_LBM_D3Q27_50 = "LBM D3Q27 $Autosave_Title - #50 (Part $k of $Printer_Nz_Mod) Q-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_50 = open(Outfile_LBM_D3Q27_50, "w")
      show(Outfile_Opener_LBM_D3Q27_50, "$Printer_QCriterion_Mod2DPlotter")
      close(Outfile_Opener_LBM_D3Q27_50)

      Outfile_LBM_D3Q27_51 = "LBM D3Q27 $Autosave_Title - #51 (Part $k of $Printer_Nz_Mod) Delta-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_51 = open(Outfile_LBM_D3Q27_51, "w")
      show(Outfile_Opener_LBM_D3Q27_51, "$Printer_DeltaCriterion_Mod2DPlotter")
      close(Outfile_Opener_LBM_D3Q27_51)

      Outfile_LBM_D3Q27_52 = "LBM D3Q27 $Autosave_Title - #52 (Part $k of $Printer_Nz_Mod) Lambda2-Criterion_Plot - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_52 = open(Outfile_LBM_D3Q27_52, "w")
      show(Outfile_Opener_LBM_D3Q27_52, "$Printer_Lambda2Criterion_Mod2DPlotter")
      close(Outfile_Opener_LBM_D3Q27_52)
    end
  end

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # NEXT CYCLE COUNT
  println("Cycle = ", Cycle, " out of ", Maximum_Iterations)
  toc()
  println(" ")
  Cycle = Cycle + 1
  Current_Timestep = Cycle + Previous_Current_Timestep
end
toc()
Current_Timestep = Current_Timestep - 1
println(" ")
println("CALCULATION COMPLETE")
println("CALCULATION COMPLETE")
println("CALCULATION COMPLETE")
println(" ")
println("Reynolds Number = ", Re)
println("Mach Number = ", Ma)
println("Knudsen Number = ", sqrt.(pi/2)/(2*Omega*Obstacle_Radius))
println(" ")
println("Nu = ", Nu, " (Kinematic Viscosity)")
println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
println(" ")
println("Total Nodes = ", Nx.*Ny.*Nz)
println("Total Active Nodes = ", Nx.*Ny.*Nz - Int64(length(BBR_Indices)))
println("Total Inactive Nodes = ", Int64(length(BBR_Indices)))
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

using Plots
plotly()
heatmap(title = "BLANK")
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
plot()
plot!((1:Current_Timestep - 1).'.', Drag_Coefficient[1, 1:Current_Timestep - 1])
plot!((1:Current_Timestep - 1).'.', YLift_Coefficient[1, 1:Current_Timestep - 1])
plot!((1:Current_Timestep - 1).'.', ZLift_Coefficient[1, 1:Current_Timestep - 1])
xlims!(0, Current_Timestep - 1)
ylims!( - 1, 3)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Ux_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Uy_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Uz_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Ut_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Rho_Plot[:, :, Obstacle_Center_z].', title = "[XY plane] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], QCriterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], DeltaCriterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Y_Plot[1, :, 1], Lambda2Criterion_Mod2DPlotter[:, :, Obstacle_Center_z].', title = "[XY plane] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_y:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
ylims!(1, Ny)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Ux_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Uy_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Uz_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Ut_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Rho_Plot[:, Obstacle_Center_y, :].', title = "[XZ plane] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(X_Plot[:, 1, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[:, Obstacle_Center_y, :].', title = "[XZ plane] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:20:Nx - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
xlims!(1, Nx)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ux_Plot[Obstacle_Center_x, :, :].', title = "[YZ plane 1] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uy_Plot[Obstacle_Center_x, :, :].', title = "[YZ plane 1] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uz_Plot[Obstacle_Center_x, :, :].', title = "[YZ plane 1] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ut_Plot[Obstacle_Center_x, :, :].', title = "[YZ plane 1] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Rho_Plot[Obstacle_Center_x, :, :].', title = "[YZ plane 1] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[Obstacle_Center_x, :, :].', title = "[YZ plane 1] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[Obstacle_Center_x, :, :].', title = "[YZ plane 1] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[Obstacle_Center_x, :, :].', title = "[YZ plane 1] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ux_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] x-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uy_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] y-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Uz_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] z-Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Ut_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] Total Velocity at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Rho_Plot[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] Total Pressure at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], QCriterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] Q-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], DeltaCriterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] Delta-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

using Plots
plotly()
heatmap!(Y_Plot[1, :, 1], Z_Plot[1, 1, :], Lambda2Criterion_Mod2DPlotter[Obstacle_Center_x + Int64(round(Obstacle_Radius, RoundDown)) + 2, :, :].', title = "[YZ plane 2] Lambda2-Criterion at Time Step = $Current_Timestep", titlefont = font(6), xtickfont = font(4), xticks = 0:Obstacle_Center_y:Ny - 2, ytickfont = font(4), yticks = 0:Obstacle_Center_z:Nz - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
ylims!(1, Ny)
zlims!(1, Nz)
gui()

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
