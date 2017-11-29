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
Nx = 111 # Number of cells in the x-direction in units of 100
Ny = 37 # Number of cells in the y-direction in units of 100
Nz = 37 # Number of cells in the z-direction in units of 100
Re = 27.553 # Reynolds Number of the flow
Ma = 0.1 # Mach Number of the flow
Rho_Initial = 1 # Macroscopic density
Boundary_Walls = 0 # Set to 0 for no walls or set to 1 for walls at the upper and lower surface
Sphere_Cube_CircularCylinder_SquareCylinder = 1 # Set to 1 for sphere, 2 for cube, 3 for circular cylinder or 4 for square cylinder
Blockage_Ratio = 1/15

# ADDITIONAL REQUIREMENTS {REQUIRED FOR NEW OR EXISTING RUNS BUT DO NOT NEED TO BE CONGRUENT WITH EXISITING RUNS (FOR EXAMPLE A DIFFERENT COLLISION MODEL MAY BE USED)}
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

  Temp_f01_IN = zeros(Nx, Ny, Nz)
  Temp_f02_IN = zeros(Nx, Ny, Nz)
  Temp_f03_IN = zeros(Nx, Ny, Nz)
  Temp_f04_IN = zeros(Nx, Ny, Nz)
  Temp_f05_IN = zeros(Nx, Ny, Nz)
  Temp_f06_IN = zeros(Nx, Ny, Nz)
  Temp_f07_IN = zeros(Nx, Ny, Nz)
  Temp_f08_IN = zeros(Nx, Ny, Nz)
  Temp_f09_IN = zeros(Nx, Ny, Nz)
  Temp_f10_IN = zeros(Nx, Ny, Nz)
  Temp_f11_IN = zeros(Nx, Ny, Nz)
  Temp_f12_IN = zeros(Nx, Ny, Nz)
  Temp_f13_IN = zeros(Nx, Ny, Nz)
  Temp_f14_IN = zeros(Nx, Ny, Nz)
  Temp_f15_IN = zeros(Nx, Ny, Nz)
  Temp_f16_IN = zeros(Nx, Ny, Nz)
  Temp_f17_IN = zeros(Nx, Ny, Nz)
  Temp_f18_IN = zeros(Nx, Ny, Nz)
  Temp_f19_IN = zeros(Nx, Ny, Nz)
  Temp_f20_IN = zeros(Nx, Ny, Nz)
  Temp_f21_IN = zeros(Nx, Ny, Nz)
  Temp_f22_IN = zeros(Nx, Ny, Nz)
  Temp_f23_IN = zeros(Nx, Ny, Nz)
  Temp_f24_IN = zeros(Nx, Ny, Nz)
  Temp_f25_IN = zeros(Nx, Ny, Nz)
  Temp_f26_IN = zeros(Nx, Ny, Nz)
  Temp_f27_IN = zeros(Nx, Ny, Nz)
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

    Temp_f01_IN[:, :, k] = Import_Data_8
    Temp_f02_IN[:, :, k] = Import_Data_9
    Temp_f03_IN[:, :, k] = Import_Data_10
    Temp_f04_IN[:, :, k] = Import_Data_11
    Temp_f05_IN[:, :, k] = Import_Data_12
    Temp_f06_IN[:, :, k] = Import_Data_13
    Temp_f07_IN[:, :, k] = Import_Data_14
    Temp_f08_IN[:, :, k] = Import_Data_15
    Temp_f09_IN[:, :, k] = Import_Data_16
    Temp_f10_IN[:, :, k] = Import_Data_17
    Temp_f11_IN[:, :, k] = Import_Data_18
    Temp_f12_IN[:, :, k] = Import_Data_19
    Temp_f13_IN[:, :, k] = Import_Data_20
    Temp_f14_IN[:, :, k] = Import_Data_21
    Temp_f15_IN[:, :, k] = Import_Data_22
    Temp_f16_IN[:, :, k] = Import_Data_23
    Temp_f17_IN[:, :, k] = Import_Data_24
    Temp_f18_IN[:, :, k] = Import_Data_25
    Temp_f19_IN[:, :, k] = Import_Data_26
    Temp_f20_IN[:, :, k] = Import_Data_27
    Temp_f21_IN[:, :, k] = Import_Data_28
    Temp_f22_IN[:, :, k] = Import_Data_29
    Temp_f23_IN[:, :, k] = Import_Data_30
    Temp_f24_IN[:, :, k] = Import_Data_31
    Temp_f25_IN[:, :, k] = Import_Data_32
    Temp_f26_IN[:, :, k] = Import_Data_33
    Temp_f27_IN[:, :, k] = Import_Data_34
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
if Restart_Calculation == "No"
  Nx = Nx + 2 # To account for loss of boundary nodes at a later stage
  Ny = Ny + 2 # To account for loss of boundary nodes at a later stage
  Nz = Nz + 2 # To account for loss of boundary nodes at a later stage
end
Obstacle_Center_x = Int64(round(Nx/6, RoundUp))
Obstacle_Center_y = Int64(round(Ny/2, RoundUp))
Obstacle_Center_z = Int64(round(Nz/2, RoundUp))
if Sphere_Cube_CircularCylinder_SquareCylinder == 1
  Obstacle_Radius = sqrt(Blockage_Ratio.*Ny.*Nz./pi)
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 2
  Obstacle_Radius = sqrt(Blockage_Ratio.*Ny.*Nz./4)
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 3
  Obstacle_Radius = Blockage_Ratio.*Ny./2
end
if Sphere_Cube_CircularCylinder_SquareCylinder == 4
  Obstacle_Radius = Blockage_Ratio.*Ny./2
end

# Initial Calculations
Inflow_Velocity = Ma/sqrt(3)
Nu = Inflow_Velocity.*2.*Obstacle_Radius/Re # Kinematic Viscosity
Omega = 1/(3.*Nu + 1/2) # Relaxation Parameter
Omega_Positive = Omega
Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
MRT_Omega[1] = Omega
CMRT_Omega[1] = Omega
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
  Cumulant_Second_Order_Velocity_Derivatives = 1
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
Cx = [0, 1, -1, 0, 0, 0, 0, 1, -1, 1, -1, 1, -1, 1, -1, 0, 0, 0, 0, 1, -1, 1, -1, 1, -1, 1, -1]
Cy = [0, 0, 0, 1, -1, 0, 0, 1, -1, -1, 1, 0, 0, 0, 0, 1, -1, 1, -1, 1, -1, 1, -1, -1, 1, -1, 1]
Cz = [0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1]
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
    end
  end
end
BBR_Indices_i = BBR_Indices_i.*(Obstacle + Wall)
BBR_Indices_j = BBR_Indices_j.*(Obstacle + Wall)
BBR_Indices_k = BBR_Indices_k.*(Obstacle + Wall)
BBR_Indices = find(Obstacle + Wall)

f01_IN = zeros(Nx, Ny, Nz)
f02_IN = zeros(Nx, Ny, Nz)
f03_IN = zeros(Nx, Ny, Nz)
f04_IN = zeros(Nx, Ny, Nz)
f05_IN = zeros(Nx, Ny, Nz)
f06_IN = zeros(Nx, Ny, Nz)
f07_IN = zeros(Nx, Ny, Nz)
f08_IN = zeros(Nx, Ny, Nz)
f09_IN = zeros(Nx, Ny, Nz)
f10_IN = zeros(Nx, Ny, Nz)
f11_IN = zeros(Nx, Ny, Nz)
f12_IN = zeros(Nx, Ny, Nz)
f13_IN = zeros(Nx, Ny, Nz)
f14_IN = zeros(Nx, Ny, Nz)
f15_IN = zeros(Nx, Ny, Nz)
f16_IN = zeros(Nx, Ny, Nz)
f17_IN = zeros(Nx, Ny, Nz)
f18_IN = zeros(Nx, Ny, Nz)
f19_IN = zeros(Nx, Ny, Nz)
f20_IN = zeros(Nx, Ny, Nz)
f21_IN = zeros(Nx, Ny, Nz)
f22_IN = zeros(Nx, Ny, Nz)
f23_IN = zeros(Nx, Ny, Nz)
f24_IN = zeros(Nx, Ny, Nz)
f25_IN = zeros(Nx, Ny, Nz)
f26_IN = zeros(Nx, Ny, Nz)
f27_IN = zeros(Nx, Ny, Nz)
f01_EQ = zeros(Nx, Ny, Nz)
f02_EQ = zeros(Nx, Ny, Nz)
f03_EQ = zeros(Nx, Ny, Nz)
f04_EQ = zeros(Nx, Ny, Nz)
f05_EQ = zeros(Nx, Ny, Nz)
f06_EQ = zeros(Nx, Ny, Nz)
f07_EQ = zeros(Nx, Ny, Nz)
f08_EQ = zeros(Nx, Ny, Nz)
f09_EQ = zeros(Nx, Ny, Nz)
f10_EQ = zeros(Nx, Ny, Nz)
f11_EQ = zeros(Nx, Ny, Nz)
f12_EQ = zeros(Nx, Ny, Nz)
f13_EQ = zeros(Nx, Ny, Nz)
f14_EQ = zeros(Nx, Ny, Nz)
f15_EQ = zeros(Nx, Ny, Nz)
f16_EQ = zeros(Nx, Ny, Nz)
f17_EQ = zeros(Nx, Ny, Nz)
f18_EQ = zeros(Nx, Ny, Nz)
f19_EQ = zeros(Nx, Ny, Nz)
f20_EQ = zeros(Nx, Ny, Nz)
f21_EQ = zeros(Nx, Ny, Nz)
f22_EQ = zeros(Nx, Ny, Nz)
f23_EQ = zeros(Nx, Ny, Nz)
f24_EQ = zeros(Nx, Ny, Nz)
f25_EQ = zeros(Nx, Ny, Nz)
f26_EQ = zeros(Nx, Ny, Nz)
f27_EQ = zeros(Nx, Ny, Nz)
f01_OUT = zeros(Nx, Ny, Nz)
f02_OUT = zeros(Nx, Ny, Nz)
f03_OUT = zeros(Nx, Ny, Nz)
f04_OUT = zeros(Nx, Ny, Nz)
f05_OUT = zeros(Nx, Ny, Nz)
f06_OUT = zeros(Nx, Ny, Nz)
f07_OUT = zeros(Nx, Ny, Nz)
f08_OUT = zeros(Nx, Ny, Nz)
f09_OUT = zeros(Nx, Ny, Nz)
f10_OUT = zeros(Nx, Ny, Nz)
f11_OUT = zeros(Nx, Ny, Nz)
f12_OUT = zeros(Nx, Ny, Nz)
f13_OUT = zeros(Nx, Ny, Nz)
f14_OUT = zeros(Nx, Ny, Nz)
f15_OUT = zeros(Nx, Ny, Nz)
f16_OUT = zeros(Nx, Ny, Nz)
f17_OUT = zeros(Nx, Ny, Nz)
f18_OUT = zeros(Nx, Ny, Nz)
f19_OUT = zeros(Nx, Ny, Nz)
f20_OUT = zeros(Nx, Ny, Nz)
f21_OUT = zeros(Nx, Ny, Nz)
f22_OUT = zeros(Nx, Ny, Nz)
f23_OUT = zeros(Nx, Ny, Nz)
f24_OUT = zeros(Nx, Ny, Nz)
f25_OUT = zeros(Nx, Ny, Nz)
f26_OUT = zeros(Nx, Ny, Nz)
f27_OUT = zeros(Nx, Ny, Nz)
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
        if (Obstacle[i, j, k] == 0) && (Wall[i, j, k] == 0)
          Ux[i, j, k] = (4*Inflow_Velocity./(Ly.^2)*(y_Phys[j].*Ly - (y_Phys[j].^2))).*(4*Inflow_Velocity./(Lz.^2)*(z_Phys[k].*Lz - (z_Phys[k].^2)))
        end
      end
    end
  end
  f01_IN = Rho_Initial.*Wi[1].*(1 + 3*(Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz) + 9/2.*((Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f02_IN = Rho_Initial.*Wi[2].*(1 + 3*(Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz) + 9/2.*((Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f03_IN = Rho_Initial.*Wi[3].*(1 + 3*(Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz) + 9/2.*((Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f04_IN = Rho_Initial.*Wi[4].*(1 + 3*(Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz) + 9/2.*((Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f05_IN = Rho_Initial.*Wi[5].*(1 + 3*(Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz) + 9/2.*((Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f06_IN = Rho_Initial.*Wi[6].*(1 + 3*(Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz) + 9/2.*((Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f07_IN = Rho_Initial.*Wi[7].*(1 + 3*(Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz) + 9/2.*((Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f08_IN = Rho_Initial.*Wi[8].*(1 + 3*(Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz) + 9/2.*((Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f09_IN = Rho_Initial.*Wi[9].*(1 + 3*(Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz) + 9/2.*((Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f10_IN = Rho_Initial.*Wi[10].*(1 + 3*(Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz) + 9/2.*((Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f11_IN = Rho_Initial.*Wi[11].*(1 + 3*(Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz) + 9/2.*((Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f12_IN = Rho_Initial.*Wi[12].*(1 + 3*(Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz) + 9/2.*((Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f13_IN = Rho_Initial.*Wi[13].*(1 + 3*(Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz) + 9/2.*((Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f14_IN = Rho_Initial.*Wi[14].*(1 + 3*(Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz) + 9/2.*((Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f15_IN = Rho_Initial.*Wi[15].*(1 + 3*(Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz) + 9/2.*((Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f16_IN = Rho_Initial.*Wi[16].*(1 + 3*(Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz) + 9/2.*((Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f17_IN = Rho_Initial.*Wi[17].*(1 + 3*(Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz) + 9/2.*((Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f18_IN = Rho_Initial.*Wi[18].*(1 + 3*(Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz) + 9/2.*((Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f19_IN = Rho_Initial.*Wi[19].*(1 + 3*(Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz) + 9/2.*((Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f20_IN = Rho_Initial.*Wi[20].*(1 + 3*(Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz) + 9/2.*((Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f21_IN = Rho_Initial.*Wi[21].*(1 + 3*(Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz) + 9/2.*((Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f22_IN = Rho_Initial.*Wi[22].*(1 + 3*(Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz) + 9/2.*((Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f23_IN = Rho_Initial.*Wi[23].*(1 + 3*(Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz) + 9/2.*((Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f24_IN = Rho_Initial.*Wi[24].*(1 + 3*(Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz) + 9/2.*((Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f25_IN = Rho_Initial.*Wi[25].*(1 + 3*(Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz) + 9/2.*((Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f26_IN = Rho_Initial.*Wi[26].*(1 + 3*(Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz) + 9/2.*((Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f27_IN = Rho_Initial.*Wi[27].*(1 + 3*(Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz) + 9/2.*((Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
end

# ALTERNATE INITIAL CONDITIONS: Uniform Flow
if Boundary_Walls == 0
  for i = Gx
    for j = Gy
      for k = Gz
        if (Obstacle[i, j, k] == 0) && (Wall[i, j, k] == 0)
          Ux[i, j, k] = Inflow_Velocity
        end
      end
    end
  end
  f01_IN = Rho_Initial.*Wi[1].*(1 + 3*(Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz) + 9/2.*((Cx[1].*Ux + Cy[1].*Uy + Cz[1].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f02_IN = Rho_Initial.*Wi[2].*(1 + 3*(Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz) + 9/2.*((Cx[2].*Ux + Cy[2].*Uy + Cz[2].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f03_IN = Rho_Initial.*Wi[3].*(1 + 3*(Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz) + 9/2.*((Cx[3].*Ux + Cy[3].*Uy + Cz[3].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f04_IN = Rho_Initial.*Wi[4].*(1 + 3*(Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz) + 9/2.*((Cx[4].*Ux + Cy[4].*Uy + Cz[4].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f05_IN = Rho_Initial.*Wi[5].*(1 + 3*(Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz) + 9/2.*((Cx[5].*Ux + Cy[5].*Uy + Cz[5].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f06_IN = Rho_Initial.*Wi[6].*(1 + 3*(Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz) + 9/2.*((Cx[6].*Ux + Cy[6].*Uy + Cz[6].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f07_IN = Rho_Initial.*Wi[7].*(1 + 3*(Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz) + 9/2.*((Cx[7].*Ux + Cy[7].*Uy + Cz[7].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f08_IN = Rho_Initial.*Wi[8].*(1 + 3*(Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz) + 9/2.*((Cx[8].*Ux + Cy[8].*Uy + Cz[8].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f09_IN = Rho_Initial.*Wi[9].*(1 + 3*(Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz) + 9/2.*((Cx[9].*Ux + Cy[9].*Uy + Cz[9].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f10_IN = Rho_Initial.*Wi[10].*(1 + 3*(Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz) + 9/2.*((Cx[10].*Ux + Cy[10].*Uy + Cz[10].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f11_IN = Rho_Initial.*Wi[11].*(1 + 3*(Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz) + 9/2.*((Cx[11].*Ux + Cy[11].*Uy + Cz[11].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f12_IN = Rho_Initial.*Wi[12].*(1 + 3*(Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz) + 9/2.*((Cx[12].*Ux + Cy[12].*Uy + Cz[12].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f13_IN = Rho_Initial.*Wi[13].*(1 + 3*(Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz) + 9/2.*((Cx[13].*Ux + Cy[13].*Uy + Cz[13].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f14_IN = Rho_Initial.*Wi[14].*(1 + 3*(Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz) + 9/2.*((Cx[14].*Ux + Cy[14].*Uy + Cz[14].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f15_IN = Rho_Initial.*Wi[15].*(1 + 3*(Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz) + 9/2.*((Cx[15].*Ux + Cy[15].*Uy + Cz[15].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f16_IN = Rho_Initial.*Wi[16].*(1 + 3*(Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz) + 9/2.*((Cx[16].*Ux + Cy[16].*Uy + Cz[16].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f17_IN = Rho_Initial.*Wi[17].*(1 + 3*(Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz) + 9/2.*((Cx[17].*Ux + Cy[17].*Uy + Cz[17].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f18_IN = Rho_Initial.*Wi[18].*(1 + 3*(Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz) + 9/2.*((Cx[18].*Ux + Cy[18].*Uy + Cz[18].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f19_IN = Rho_Initial.*Wi[19].*(1 + 3*(Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz) + 9/2.*((Cx[19].*Ux + Cy[19].*Uy + Cz[19].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f20_IN = Rho_Initial.*Wi[20].*(1 + 3*(Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz) + 9/2.*((Cx[20].*Ux + Cy[20].*Uy + Cz[20].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f21_IN = Rho_Initial.*Wi[21].*(1 + 3*(Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz) + 9/2.*((Cx[21].*Ux + Cy[21].*Uy + Cz[21].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f22_IN = Rho_Initial.*Wi[22].*(1 + 3*(Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz) + 9/2.*((Cx[22].*Ux + Cy[22].*Uy + Cz[22].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f23_IN = Rho_Initial.*Wi[23].*(1 + 3*(Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz) + 9/2.*((Cx[23].*Ux + Cy[23].*Uy + Cz[23].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f24_IN = Rho_Initial.*Wi[24].*(1 + 3*(Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz) + 9/2.*((Cx[24].*Ux + Cy[24].*Uy + Cz[24].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f25_IN = Rho_Initial.*Wi[25].*(1 + 3*(Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz) + 9/2.*((Cx[25].*Ux + Cy[25].*Uy + Cz[25].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f26_IN = Rho_Initial.*Wi[26].*(1 + 3*(Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz) + 9/2.*((Cx[26].*Ux + Cy[26].*Uy + Cz[26].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
  f27_IN = Rho_Initial.*Wi[27].*(1 + 3*(Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz) + 9/2.*((Cx[27].*Ux + Cy[27].*Uy + Cz[27].*Uz).^2) - 3/2.*(Ux.^2 + Uy.^2 + Uz.^2))
end

# RESTARTED INITIAL CONDITIONS: Read from file
if Restart_Calculation == "Yes"
  f01_IN = Temp_f01_IN
  f02_IN = Temp_f02_IN
  f03_IN = Temp_f03_IN
  f04_IN = Temp_f04_IN
  f05_IN = Temp_f05_IN
  f06_IN = Temp_f06_IN
  f07_IN = Temp_f07_IN
  f08_IN = Temp_f08_IN
  f09_IN = Temp_f09_IN
  f10_IN = Temp_f10_IN
  f11_IN = Temp_f11_IN
  f12_IN = Temp_f12_IN
  f13_IN = Temp_f13_IN
  f14_IN = Temp_f14_IN
  f15_IN = Temp_f15_IN
  f16_IN = Temp_f16_IN
  f17_IN = Temp_f17_IN
  f18_IN = Temp_f18_IN
  f19_IN = Temp_f19_IN
  f20_IN = Temp_f20_IN
  f21_IN = Temp_f21_IN
  f22_IN = Temp_f22_IN
  f23_IN = Temp_f23_IN
  f24_IN = Temp_f24_IN
  f25_IN = Temp_f25_IN
  f26_IN = Temp_f26_IN
  f27_IN = Temp_f27_IN
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
end

println(" ")
println("Reynolds Number = ", Re)
println("Mach Number = ", Ma)
println("Knudsen Number = ", sqrt(pi/2)/(2*Omega*Obstacle_Radius))
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

# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
# MAIN LOOP (TIME STEPS)
tic()
Cycle = 1
Current_Timestep = Cycle + Previous_Current_Timestep
while Cycle < Maximum_Iterations + 1
  tic()

  # MACROSCOPIC Variables
  Rho = f01_IN + f02_IN + f03_IN + f04_IN + f05_IN + f06_IN + f07_IN + f08_IN + f09_IN + f10_IN + f11_IN + f12_IN + f13_IN + f14_IN + f15_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN
  Jx = f02_IN + f08_IN + f10_IN + f12_IN + f14_IN + f20_IN + f22_IN + f24_IN + f26_IN - f03_IN - f09_IN - f11_IN - f13_IN - f15_IN - f21_IN - f23_IN - f25_IN - f27_IN
  Jy = f04_IN + f08_IN + f11_IN + f16_IN + f18_IN + f20_IN + f22_IN + f25_IN + f27_IN - f05_IN - f09_IN - f10_IN - f17_IN - f19_IN - f21_IN - f23_IN - f24_IN - f26_IN
  Jz = f06_IN + f12_IN + f15_IN + f16_IN + f19_IN + f20_IN + f23_IN + f24_IN + f27_IN - f07_IN - f13_IN - f14_IN - f17_IN - f18_IN - f21_IN - f22_IN - f25_IN - f26_IN
  Ux = Jx./Rho
  Uy = Jy./Rho
  Uz = Jz./Rho

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
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01_IN[Inlet, j, k] + f04_IN[Inlet, j, k] + f05_IN[Inlet, j, k] + f06_IN[Inlet, j, k] + f07_IN[Inlet, j, k] + f16_IN[Inlet, j, k] + f17_IN[Inlet, j, k] + f18_IN[Inlet, j, k] + f19_IN[Inlet, j, k]) + 2.*(f03_IN[Inlet, j, k] + f09_IN[Inlet, j, k] + f11_IN[Inlet, j, k] + f13_IN[Inlet, j, k] + f15_IN[Inlet, j, k] + f21_IN[Inlet, j, k] + f23_IN[Inlet, j, k] + f25_IN[Inlet, j, k] + f27_IN[Inlet, j, k]))
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
        Rho[Inlet, j, k] = 1./(1 - Ux[Inlet, j, k]).*((f01_IN[Inlet, j, k] + f04_IN[Inlet, j, k] + f05_IN[Inlet, j, k] + f06_IN[Inlet, j, k] + f07_IN[Inlet, j, k] + f16_IN[Inlet, j, k] + f17_IN[Inlet, j, k] + f18_IN[Inlet, j, k] + f19_IN[Inlet, j, k]) + 2.*(f03_IN[Inlet, j, k] + f09_IN[Inlet, j, k] + f11_IN[Inlet, j, k] + f13_IN[Inlet, j, k] + f15_IN[Inlet, j, k] + f21_IN[Inlet, j, k] + f23_IN[Inlet, j, k] + f25_IN[Inlet, j, k] + f27_IN[Inlet, j, k]))
      end
    end
  end

  # Outlet: Constant Pressure
  if Boundary_Walls == 1
    Rho[Outlet, Column_y, Column_z] = Rho_Initial
    for j = 2:(Ny - 1)
      for k = 2:(Nz - 1)
        Ux[Outlet, j, k] = -1 + 1./Rho[Outlet, j, k].*((f01_IN[Outlet, j, k] + f04_IN[Outlet, j, k] + f05_IN[Outlet, j, k] + f06_IN[Outlet, j, k] + f07_IN[Outlet, j, k] + f16_IN[Outlet, j, k] + f17_IN[Outlet, j, k] + f18_IN[Outlet, j, k] + f19_IN[Outlet, j, k]) + 2.*(f02_IN[Outlet, j, k] + f08_IN[Outlet, j, k] + f10_IN[Outlet, j, k] + f12_IN[Outlet, j, k] + f14_IN[Outlet, j, k] + f20_IN[Outlet, j, k] + f22_IN[Outlet, j, k] + f24_IN[Outlet, j, k] + f26_IN[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = 9./4.*(f04_IN[Outlet, j, k] - f05_IN[Outlet, j, k])./Rho[Outlet, j, k]
          Uz[Outlet, j, k] = 9./4.*(f06_IN[Outlet, j, k] - f07_IN[Outlet, j, k])./Rho[Outlet, j, k]
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
        Ux[Outlet, j, k] = -1 + 1./Rho[Outlet, j, k].*((f01_IN[Outlet, j, k] + f04_IN[Outlet, j, k] + f05_IN[Outlet, j, k] + f06_IN[Outlet, j, k] + f07_IN[Outlet, j, k] + f16_IN[Outlet, j, k] + f17_IN[Outlet, j, k] + f18_IN[Outlet, j, k] + f19_IN[Outlet, j, k]) + 2.*(f02_IN[Outlet, j, k] + f08_IN[Outlet, j, k] + f10_IN[Outlet, j, k] + f12_IN[Outlet, j, k] + f14_IN[Outlet, j, k] + f20_IN[Outlet, j, k] + f22_IN[Outlet, j, k] + f24_IN[Outlet, j, k] + f26_IN[Outlet, j, k]))
        if Pressure_Outlet_Tangential_Velocities == "Yes"
          Uy[Outlet, j, k] = 9./4.*(f04_IN[Outlet, j, k] - f05_IN[Outlet, j, k])./Rho[Outlet, j, k]
          Uz[Outlet, j, k] = 9./4.*(f06_IN[Outlet, j, k] - f07_IN[Outlet, j, k])./Rho[Outlet, j, k]
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
  Ninlet_xy[Inlet, Column_y, Column_z] = 1/6.*(f04_IN[Inlet, Column_y, Column_z] + f16_IN[Inlet, Column_y, Column_z] + f18_IN[Inlet, Column_y, Column_z] - f05_IN[Inlet, Column_y, Column_z] - f17_IN[Inlet, Column_y, Column_z] - f19_IN[Inlet, Column_y, Column_z])
  Ninlet_xz[Inlet, Column_y, Column_z] = 1/6.*(f06_IN[Inlet, Column_y, Column_z] + f16_IN[Inlet, Column_y, Column_z] + f19_IN[Inlet, Column_y, Column_z] - f07_IN[Inlet, Column_y, Column_z] - f17_IN[Inlet, Column_y, Column_z] - f18_IN[Inlet, Column_y, Column_z])
  f02_IN[Inlet, Column_y, Column_z] = f03_IN[Inlet, Column_y, Column_z] + 4./9.*Jx[Inlet, Column_y, Column_z]
  f08_IN[Inlet, Column_y, Column_z] = f09_IN[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f10_IN[Inlet, Column_y, Column_z] = f11_IN[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f12_IN[Inlet, Column_y, Column_z] = f13_IN[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f14_IN[Inlet, Column_y, Column_z] = f15_IN[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./9.*Jx[Inlet, Column_y, Column_z]
  f20_IN[Inlet, Column_y, Column_z] = f21_IN[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f22_IN[Inlet, Column_y, Column_z] = f23_IN[Inlet, Column_y, Column_z] - Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f24_IN[Inlet, Column_y, Column_z] = f25_IN[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] - Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  f26_IN[Inlet, Column_y, Column_z] = f27_IN[Inlet, Column_y, Column_z] + Ninlet_xy[Inlet, Column_y, Column_z] + Ninlet_xz[Inlet, Column_y, Column_z] + 1./36.*Jx[Inlet, Column_y, Column_z]
  # Outlet: Modified Zou/He Boundary Conditions
  Jx[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Ux[Outlet, Column_y, Column_z]
  Jy[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uy[Outlet, Column_y, Column_z]
  Jz[Outlet, Column_y, Column_z] = Rho[Outlet, Column_y, Column_z].*Uz[Outlet, Column_y, Column_z]
  Noutlet_xy[Outlet, Column_y, Column_z] = 1/6.*(f04_IN[Outlet, Column_y, Column_z] + f16_IN[Outlet, Column_y, Column_z] + f18_IN[Outlet, Column_y, Column_z] - f05_IN[Outlet, Column_y, Column_z] - f17_IN[Outlet, Column_y, Column_z] - f19_IN[Outlet, Column_y, Column_z] - 2/3.*Jy[Outlet, Column_y, Column_z])
  Noutlet_xz[Outlet, Column_y, Column_z] = 1/6.*(f06_IN[Outlet, Column_y, Column_z] + f16_IN[Outlet, Column_y, Column_z] + f19_IN[Outlet, Column_y, Column_z] - f07_IN[Outlet, Column_y, Column_z] - f17_IN[Outlet, Column_y, Column_z] - f18_IN[Outlet, Column_y, Column_z] - 2/3.*Jz[Outlet, Column_y, Column_z])
  f03_IN[Outlet, Column_y, Column_z] = f02_IN[Outlet, Column_y, Column_z] - 4./9.*Jx[Outlet, Column_y, Column_z]
  f09_IN[Outlet, Column_y, Column_z] = f08_IN[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jy[Outlet, Column_y, Column_z]
  f11_IN[Outlet, Column_y, Column_z] = f10_IN[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jy[Outlet, Column_y, Column_z]
  f13_IN[Outlet, Column_y, Column_z] = f12_IN[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] - 1./9.*Jz[Outlet, Column_y, Column_z]
  f15_IN[Outlet, Column_y, Column_z] = f14_IN[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./9.*Jx[Outlet, Column_y, Column_z] + 1./9.*Jz[Outlet, Column_y, Column_z]
  f21_IN[Outlet, Column_y, Column_z] = f20_IN[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f23_IN[Outlet, Column_y, Column_z] = f22_IN[Outlet, Column_y, Column_z] + Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] - 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]
  f25_IN[Outlet, Column_y, Column_z] = f24_IN[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] + Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] - 1./36.*Jz[Outlet, Column_y, Column_z]
  f27_IN[Outlet, Column_y, Column_z] = f26_IN[Outlet, Column_y, Column_z] - Noutlet_xy[Outlet, Column_y, Column_z] - Noutlet_xz[Outlet, Column_y, Column_z] - 1./36.*Jx[Outlet, Column_y, Column_z] + 1./36.*Jy[Outlet, Column_y, Column_z] + 1./36.*Jz[Outlet, Column_y, Column_z]

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # COLLISION STEP
  # SRT LBM COLLISION MODEL
  if Collision_Model == "SRT_LBM"
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
    f01_OUT = f01_IN - Omega.*(f01_IN - f01_EQ)
    f02_OUT = f02_IN - Omega.*(f02_IN - f02_EQ)
    f03_OUT = f03_IN - Omega.*(f03_IN - f03_EQ)
    f04_OUT = f04_IN - Omega.*(f04_IN - f04_EQ)
    f05_OUT = f05_IN - Omega.*(f05_IN - f05_EQ)
    f06_OUT = f06_IN - Omega.*(f06_IN - f06_EQ)
    f07_OUT = f07_IN - Omega.*(f07_IN - f07_EQ)
    f08_OUT = f08_IN - Omega.*(f08_IN - f08_EQ)
    f09_OUT = f09_IN - Omega.*(f09_IN - f09_EQ)
    f10_OUT = f10_IN - Omega.*(f10_IN - f10_EQ)
    f11_OUT = f11_IN - Omega.*(f11_IN - f11_EQ)
    f12_OUT = f12_IN - Omega.*(f12_IN - f12_EQ)
    f13_OUT = f13_IN - Omega.*(f13_IN - f13_EQ)
    f14_OUT = f14_IN - Omega.*(f14_IN - f14_EQ)
    f15_OUT = f15_IN - Omega.*(f15_IN - f15_EQ)
    f16_OUT = f16_IN - Omega.*(f16_IN - f16_EQ)
    f17_OUT = f17_IN - Omega.*(f17_IN - f17_EQ)
    f18_OUT = f18_IN - Omega.*(f18_IN - f18_EQ)
    f19_OUT = f19_IN - Omega.*(f19_IN - f19_EQ)
    f20_OUT = f20_IN - Omega.*(f20_IN - f20_EQ)
    f21_OUT = f21_IN - Omega.*(f21_IN - f21_EQ)
    f22_OUT = f22_IN - Omega.*(f22_IN - f22_EQ)
    f23_OUT = f23_IN - Omega.*(f23_IN - f23_EQ)
    f24_OUT = f24_IN - Omega.*(f24_IN - f24_EQ)
    f25_OUT = f25_IN - Omega.*(f25_IN - f25_EQ)
    f26_OUT = f26_IN - Omega.*(f26_IN - f26_EQ)
    f27_OUT = f27_IN - Omega.*(f27_IN - f27_EQ)
  end
  # TRT LBM COLLISION MODEL
  if Collision_Model == "TRT_LBM"
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
    f01_EQ_Positive = f01_EQ
    f01_EQ_Negative = zeros(Nx, Ny, Nz)
    f02_EQ_Positive = (f02_EQ + f03_EQ)./2
    f02_EQ_Negative = (f02_EQ - f03_EQ)./2
    f03_EQ_Positive = (f03_EQ + f02_EQ)./2
    f03_EQ_Negative = (f03_EQ - f02_EQ)./2
    f04_EQ_Positive = (f04_EQ + f05_EQ)./2
    f04_EQ_Negative = (f04_EQ - f05_EQ)./2
    f05_EQ_Positive = (f05_EQ + f04_EQ)./2
    f05_EQ_Negative = (f05_EQ - f04_EQ)./2
    f06_EQ_Positive = (f06_EQ + f07_EQ)./2
    f06_EQ_Negative = (f06_EQ - f07_EQ)./2
    f07_EQ_Positive = (f07_EQ + f06_EQ)./2
    f07_EQ_Negative = (f07_EQ - f06_EQ)./2
    f08_EQ_Positive = (f08_EQ + f09_EQ)./2
    f08_EQ_Negative = (f08_EQ - f09_EQ)./2
    f09_EQ_Positive = (f09_EQ + f08_EQ)./2
    f09_EQ_Negative = (f09_EQ - f08_EQ)./2
    f10_EQ_Positive = (f10_EQ + f11_EQ)./2
    f10_EQ_Negative = (f10_EQ - f11_EQ)./2
    f11_EQ_Positive = (f11_EQ + f10_EQ)./2
    f11_EQ_Negative = (f11_EQ - f10_EQ)./2
    f12_EQ_Positive = (f12_EQ + f13_EQ)./2
    f12_EQ_Negative = (f12_EQ - f13_EQ)./2
    f13_EQ_Positive = (f13_EQ + f12_EQ)./2
    f13_EQ_Negative = (f13_EQ - f12_EQ)./2
    f14_EQ_Positive = (f14_EQ + f15_EQ)./2
    f14_EQ_Negative = (f14_EQ - f15_EQ)./2
    f15_EQ_Positive = (f15_EQ + f14_EQ)./2
    f15_EQ_Negative = (f15_EQ - f14_EQ)./2
    f16_EQ_Positive = (f16_EQ + f17_EQ)./2
    f16_EQ_Negative = (f16_EQ - f17_EQ)./2
    f17_EQ_Positive = (f17_EQ + f16_EQ)./2
    f17_EQ_Negative = (f17_EQ - f16_EQ)./2
    f18_EQ_Positive = (f18_EQ + f19_EQ)./2
    f18_EQ_Negative = (f18_EQ - f19_EQ)./2
    f19_EQ_Positive = (f19_EQ + f18_EQ)./2
    f19_EQ_Negative = (f19_EQ - f18_EQ)./2
    f20_EQ_Positive = (f20_EQ + f21_EQ)./2
    f20_EQ_Negative = (f20_EQ - f21_EQ)./2
    f21_EQ_Positive = (f21_EQ + f20_EQ)./2
    f21_EQ_Negative = (f21_EQ - f20_EQ)./2
    f22_EQ_Positive = (f22_EQ + f23_EQ)./2
    f22_EQ_Negative = (f22_EQ - f23_EQ)./2
    f23_EQ_Positive = (f23_EQ + f22_EQ)./2
    f23_EQ_Negative = (f23_EQ - f22_EQ)./2
    f24_EQ_Positive = (f24_EQ + f25_EQ)./2
    f24_EQ_Negative = (f24_EQ - f25_EQ)./2
    f25_EQ_Positive = (f25_EQ + f24_EQ)./2
    f25_EQ_Negative = (f25_EQ - f24_EQ)./2
    f26_EQ_Positive = (f26_EQ + f27_EQ)./2
    f26_EQ_Negative = (f26_EQ - f27_EQ)./2
    f27_EQ_Positive = (f27_EQ + f26_EQ)./2
    f27_EQ_Negative = (f27_EQ - f26_EQ)./2
    f01_IN_Positive = f01_IN
    f01_IN_Negative = zeros(Nx, Ny, Nz)
    f02_IN_Positive = (f02_IN + f03_IN)./2
    f02_IN_Negative = (f02_IN - f03_IN)./2
    f03_IN_Positive = (f03_IN + f02_IN)./2
    f03_IN_Negative = (f03_IN - f02_IN)./2
    f04_IN_Positive = (f04_IN + f05_IN)./2
    f04_IN_Negative = (f04_IN - f05_IN)./2
    f05_IN_Positive = (f05_IN + f04_IN)./2
    f05_IN_Negative = (f05_IN - f04_IN)./2
    f06_IN_Positive = (f06_IN + f07_IN)./2
    f06_IN_Negative = (f06_IN - f07_IN)./2
    f07_IN_Positive = (f07_IN + f06_IN)./2
    f07_IN_Negative = (f07_IN - f06_IN)./2
    f08_IN_Positive = (f08_IN + f09_IN)./2
    f08_IN_Negative = (f08_IN - f09_IN)./2
    f09_IN_Positive = (f09_IN + f08_IN)./2
    f09_IN_Negative = (f09_IN - f08_IN)./2
    f10_IN_Positive = (f10_IN + f11_IN)./2
    f10_IN_Negative = (f10_IN - f11_IN)./2
    f11_IN_Positive = (f11_IN + f10_IN)./2
    f11_IN_Negative = (f11_IN - f10_IN)./2
    f12_IN_Positive = (f12_IN + f13_IN)./2
    f12_IN_Negative = (f12_IN - f13_IN)./2
    f13_IN_Positive = (f13_IN + f12_IN)./2
    f13_IN_Negative = (f13_IN - f12_IN)./2
    f14_IN_Positive = (f14_IN + f15_IN)./2
    f14_IN_Negative = (f14_IN - f15_IN)./2
    f15_IN_Positive = (f15_IN + f14_IN)./2
    f15_IN_Negative = (f15_IN - f14_IN)./2
    f16_IN_Positive = (f16_IN + f17_IN)./2
    f16_IN_Negative = (f16_IN - f17_IN)./2
    f17_IN_Positive = (f17_IN + f16_IN)./2
    f17_IN_Negative = (f17_IN - f16_IN)./2
    f18_IN_Positive = (f18_IN + f19_IN)./2
    f18_IN_Negative = (f18_IN - f19_IN)./2
    f19_IN_Positive = (f19_IN + f18_IN)./2
    f19_IN_Negative = (f19_IN - f18_IN)./2
    f20_IN_Positive = (f20_IN + f21_IN)./2
    f20_IN_Negative = (f20_IN - f21_IN)./2
    f21_IN_Positive = (f21_IN + f20_IN)./2
    f21_IN_Negative = (f21_IN - f20_IN)./2
    f22_IN_Positive = (f22_IN + f23_IN)./2
    f22_IN_Negative = (f22_IN - f23_IN)./2
    f23_IN_Positive = (f23_IN + f22_IN)./2
    f23_IN_Negative = (f23_IN - f22_IN)./2
    f24_IN_Positive = (f24_IN + f25_IN)./2
    f24_IN_Negative = (f24_IN - f25_IN)./2
    f25_IN_Positive = (f25_IN + f24_IN)./2
    f25_IN_Negative = (f25_IN - f24_IN)./2
    f26_IN_Positive = (f26_IN + f27_IN)./2
    f26_IN_Negative = (f26_IN - f27_IN)./2
    f27_IN_Positive = (f27_IN + f26_IN)./2
    f27_IN_Negative = (f27_IN - f26_IN)./2
    f01_OUT = f01_IN - Omega_Positive.*(f01_IN_Positive - f01_EQ_Positive) - Omega_Negative.*(f01_IN_Negative - f01_EQ_Negative)
    f02_OUT = f02_IN - Omega_Positive.*(f02_IN_Positive - f02_EQ_Positive) - Omega_Negative.*(f02_IN_Negative - f02_EQ_Negative)
    f03_OUT = f03_IN - Omega_Positive.*(f03_IN_Positive - f03_EQ_Positive) - Omega_Negative.*(f03_IN_Negative - f03_EQ_Negative)
    f04_OUT = f04_IN - Omega_Positive.*(f04_IN_Positive - f04_EQ_Positive) - Omega_Negative.*(f04_IN_Negative - f04_EQ_Negative)
    f05_OUT = f05_IN - Omega_Positive.*(f05_IN_Positive - f05_EQ_Positive) - Omega_Negative.*(f05_IN_Negative - f05_EQ_Negative)
    f06_OUT = f06_IN - Omega_Positive.*(f06_IN_Positive - f06_EQ_Positive) - Omega_Negative.*(f06_IN_Negative - f06_EQ_Negative)
    f07_OUT = f07_IN - Omega_Positive.*(f07_IN_Positive - f07_EQ_Positive) - Omega_Negative.*(f07_IN_Negative - f07_EQ_Negative)
    f08_OUT = f08_IN - Omega_Positive.*(f08_IN_Positive - f08_EQ_Positive) - Omega_Negative.*(f08_IN_Negative - f08_EQ_Negative)
    f09_OUT = f09_IN - Omega_Positive.*(f09_IN_Positive - f09_EQ_Positive) - Omega_Negative.*(f09_IN_Negative - f09_EQ_Negative)
    f10_OUT = f10_IN - Omega_Positive.*(f10_IN_Positive - f10_EQ_Positive) - Omega_Negative.*(f10_IN_Negative - f10_EQ_Negative)
    f11_OUT = f11_IN - Omega_Positive.*(f11_IN_Positive - f11_EQ_Positive) - Omega_Negative.*(f11_IN_Negative - f11_EQ_Negative)
    f12_OUT = f12_IN - Omega_Positive.*(f12_IN_Positive - f12_EQ_Positive) - Omega_Negative.*(f12_IN_Negative - f12_EQ_Negative)
    f13_OUT = f13_IN - Omega_Positive.*(f13_IN_Positive - f13_EQ_Positive) - Omega_Negative.*(f13_IN_Negative - f13_EQ_Negative)
    f14_OUT = f14_IN - Omega_Positive.*(f14_IN_Positive - f14_EQ_Positive) - Omega_Negative.*(f14_IN_Negative - f14_EQ_Negative)
    f15_OUT = f15_IN - Omega_Positive.*(f15_IN_Positive - f15_EQ_Positive) - Omega_Negative.*(f15_IN_Negative - f15_EQ_Negative)
    f16_OUT = f16_IN - Omega_Positive.*(f16_IN_Positive - f16_EQ_Positive) - Omega_Negative.*(f16_IN_Negative - f16_EQ_Negative)
    f17_OUT = f17_IN - Omega_Positive.*(f17_IN_Positive - f17_EQ_Positive) - Omega_Negative.*(f17_IN_Negative - f17_EQ_Negative)
    f18_OUT = f18_IN - Omega_Positive.*(f18_IN_Positive - f18_EQ_Positive) - Omega_Negative.*(f18_IN_Negative - f18_EQ_Negative)
    f19_OUT = f19_IN - Omega_Positive.*(f19_IN_Positive - f19_EQ_Positive) - Omega_Negative.*(f19_IN_Negative - f19_EQ_Negative)
    f20_OUT = f20_IN - Omega_Positive.*(f20_IN_Positive - f20_EQ_Positive) - Omega_Negative.*(f20_IN_Negative - f20_EQ_Negative)
    f21_OUT = f21_IN - Omega_Positive.*(f21_IN_Positive - f21_EQ_Positive) - Omega_Negative.*(f21_IN_Negative - f21_EQ_Negative)
    f22_OUT = f22_IN - Omega_Positive.*(f22_IN_Positive - f22_EQ_Positive) - Omega_Negative.*(f22_IN_Negative - f22_EQ_Negative)
    f23_OUT = f23_IN - Omega_Positive.*(f23_IN_Positive - f23_EQ_Positive) - Omega_Negative.*(f23_IN_Negative - f23_EQ_Negative)
    f24_OUT = f24_IN - Omega_Positive.*(f24_IN_Positive - f24_EQ_Positive) - Omega_Negative.*(f24_IN_Negative - f24_EQ_Negative)
    f25_OUT = f25_IN - Omega_Positive.*(f25_IN_Positive - f25_EQ_Positive) - Omega_Negative.*(f25_IN_Negative - f25_EQ_Negative)
    f26_OUT = f26_IN - Omega_Positive.*(f26_IN_Positive - f26_EQ_Positive) - Omega_Negative.*(f26_IN_Negative - f26_EQ_Negative)
    f27_OUT = f27_IN - Omega_Positive.*(f27_IN_Positive - f27_EQ_Positive) - Omega_Negative.*(f27_IN_Negative - f27_EQ_Negative)
  end
  # MRT LBM COLLISION MODEL
  if Collision_Model == "MRT_LBM"
    # zeroth order moment (conservation of mass)
      # MRT_M000 [M01]
    # first order moments (conservation of momentum)
      # MRT_M100 [M02]
      # MRT_M010 [M03]
      # MRT_M001 [M04]
    # second order moments
      # MRT_M110 [M05]
      # MRT_M101 [M06]
      # MRT_M011 [M07]
      # MRT_M200 [M08]
      # MRT_M020 [M09]
      # MRT_M002 [M10]
    # third order moments
      # MRT_M111 [M11]
      # MRT_M210 [M12]
      # MRT_M201 [M13]
      # MRT_M120 [M14]
      # MRT_M102 [M15]
      # MRT_M021 [M16]
      # MRT_M012 [M17]
    # fourth order moments
      # MRT_M211 [M18]
      # MRT_M121 [M19]
      # MRT_M112 [M20]
      # MRT_M220 [M21]
      # MRT_M202 [M22]
      # MRT_M022 [M23]
    # fifth order moments
      # MRT_M221 [M24]
      # MRT_M212 [M25]
      # MRT_M122 [M26]
    # sixth order moment
      # MRT_M222 [M27]
    # Input block - from velocity space to raw moment space
    MRT_M000_IN = ones(Nx, Ny, Nz)
    MRT_M100_IN = Ux.*1
    MRT_M010_IN = Uy.*1
    MRT_M001_IN = Uz.*1
    MRT_M110_IN = 1./Rho.*(f08_IN + f09_IN + f20_IN + f21_IN + f22_IN + f23_IN - f10_IN - f11_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    MRT_M101_IN = 1./Rho.*(f12_IN + f13_IN + f20_IN + f21_IN + f24_IN + f25_IN - f14_IN - f15_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    MRT_M011_IN = 1./Rho.*(f16_IN + f17_IN + f20_IN + f21_IN + f26_IN + f27_IN - f18_IN - f19_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    MRT_M200_IN = 1./Rho.*(f02_IN + f03_IN + f08_IN + f09_IN + f10_IN + f11_IN + f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M020_IN = 1./Rho.*(f04_IN + f05_IN + f08_IN + f09_IN + f10_IN + f11_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M002_IN = 1./Rho.*(f06_IN + f07_IN + f12_IN + f13_IN + f14_IN + f15_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M111_IN = 1./Rho.*(f20_IN + f23_IN + f25_IN + f26_IN - f21_IN - f22_IN - f24_IN - f27_IN)
    MRT_M210_IN = 1./Rho.*(f08_IN + f11_IN + f20_IN + f22_IN + f25_IN + f27_IN - f09_IN - f10_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    MRT_M201_IN = 1./Rho.*(f12_IN + f15_IN + f20_IN + f23_IN + f24_IN + f27_IN - f13_IN - f14_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    MRT_M120_IN = 1./Rho.*(f08_IN + f10_IN + f20_IN + f22_IN + f24_IN + f26_IN - f09_IN - f11_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    MRT_M102_IN = 1./Rho.*(f12_IN + f14_IN + f20_IN + f22_IN + f24_IN + f26_IN - f13_IN - f15_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    MRT_M021_IN = 1./Rho.*(f16_IN + f19_IN + f20_IN + f23_IN + f24_IN + f27_IN - f17_IN - f18_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    MRT_M012_IN = 1./Rho.*(f16_IN + f18_IN + f20_IN + f22_IN + f25_IN + f27_IN - f17_IN - f19_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    MRT_M211_IN = 1./Rho.*(f20_IN + f21_IN + f26_IN + f27_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    MRT_M121_IN = 1./Rho.*(f20_IN + f21_IN + f24_IN + f25_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    MRT_M112_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    MRT_M220_IN = 1./Rho.*(f08_IN + f09_IN + f10_IN + f11_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M202_IN = 1./Rho.*(f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M022_IN = 1./Rho.*(f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_M221_IN = 1./Rho.*(f20_IN + f23_IN + f24_IN + f27_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    MRT_M212_IN = 1./Rho.*(f20_IN + f22_IN + f25_IN + f27_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    MRT_M122_IN = 1./Rho.*(f20_IN + f22_IN + f24_IN + f26_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    MRT_M222_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    MRT_Nsecondorder_xy_IN = MRT_M200_IN - MRT_M020_IN
    MRT_Nsecondorder_xz_IN = MRT_M200_IN - MRT_M002_IN
    MRT_Esecondorder_IN = MRT_M200_IN + MRT_M020_IN + MRT_M002_IN
    MRT_Qthirdorder1_IN = MRT_M210_IN + MRT_M012_IN
    MRT_Qthirdorder2_IN = MRT_M201_IN + MRT_M021_IN
    MRT_Qthirdorder3_IN = MRT_M120_IN + MRT_M102_IN
    MRT_Qthirdorder4_IN = MRT_M210_IN - MRT_M012_IN
    MRT_Qthirdorder5_IN = MRT_M201_IN - MRT_M021_IN
    MRT_Qthirdorder6_IN = MRT_M120_IN - MRT_M102_IN
    MRT_Afourthorder1_IN = MRT_M220_IN - 2.*MRT_M202_IN + MRT_M022_IN
    MRT_Afourthorder2_IN = MRT_M220_IN + MRT_M202_IN - 2.*MRT_M022_IN
    MRT_Afourthorder3_IN = MRT_M220_IN + MRT_M202_IN + MRT_M022_IN
    # Equilibrium block
    MRT_M110_EQ = MRT_M100_IN.*MRT_M010_IN
    MRT_M101_EQ = MRT_M100_IN.*MRT_M001_IN
    MRT_M011_EQ = MRT_M010_IN.*MRT_M001_IN
    MRT_Nsecondorder_xy_EQ = (MRT_M100_IN.^2) - (MRT_M010_IN.^2)
    MRT_Nsecondorder_xz_EQ = (MRT_M100_IN.^2) - (MRT_M001_IN.^2)
    MRT_Esecondorder_EQ = (MRT_M100_IN.^2) + (MRT_M010_IN.^2) + (MRT_M001_IN.^2) + 1
    MRT_Qthirdorder1_EQ = 2./3.*MRT_M010_IN
    MRT_Qthirdorder2_EQ = 2./3.*MRT_M001_IN
    MRT_Qthirdorder3_EQ = 2./3.*MRT_M100_IN
    MRT_Qthirdorder4_EQ = zeros(Nx, Ny, Nz)
    MRT_Qthirdorder5_EQ = zeros(Nx, Ny, Nz)
    MRT_Qthirdorder6_EQ = zeros(Nx, Ny, Nz)
    MRT_M111_EQ = zeros(Nx, Ny, Nz)
    MRT_Afourthorder1_EQ = - 1./3.*((MRT_M100_IN.^2) - 2.*(MRT_M010_IN.^2) + (MRT_M001_IN.^2))
    MRT_Afourthorder2_EQ = 1./3.*(2.*(MRT_M100_IN.^2) - (MRT_M010_IN.^2) - (MRT_M001_IN.^2))
    MRT_Afourthorder3_EQ = 2./3.*((MRT_M100_IN.^2) + (MRT_M010_IN.^2) + (MRT_M001_IN.^2) + 1./2)
    MRT_M211_EQ = 1./3.*MRT_M010_IN.*MRT_M001_IN
    MRT_M121_EQ = 1./3.*MRT_M100_IN.*MRT_M001_IN
    MRT_M112_EQ = 1./3.*MRT_M100_IN.*MRT_M010_IN
    MRT_M221_EQ = 1./9.*MRT_M001_IN
    MRT_M212_EQ = 1./9.*MRT_M010_IN
    MRT_M122_EQ = 1./9.*MRT_M100_IN
    MRT_M222_EQ = 1./9.*((MRT_M100_IN.^2) + (MRT_M010_IN.^2) + (MRT_M001_IN.^2) + 1./3)
    # Relaxation block - in raw moment space
    MRT_M000_OUT = MRT_M000_IN.*1
    MRT_M100_OUT = MRT_M100_IN.*1
    MRT_M010_OUT = MRT_M010_IN.*1
    MRT_M001_OUT = MRT_M001_IN.*1
    MRT_M110_OUT = MRT_M110_IN - MRT_Omega[1].*(MRT_M110_IN - MRT_M110_EQ)
    MRT_M101_OUT = MRT_M101_IN - MRT_Omega[1].*(MRT_M101_IN - MRT_M101_EQ)
    MRT_M011_OUT = MRT_M011_IN - MRT_Omega[1].*(MRT_M011_IN - MRT_M011_EQ)
    MRT_Nsecondorder_xy_OUT = MRT_Nsecondorder_xy_IN - MRT_Omega[1].*(MRT_Nsecondorder_xy_IN - MRT_Nsecondorder_xy_EQ)
    MRT_Nsecondorder_xz_OUT = MRT_Nsecondorder_xz_IN - MRT_Omega[1].*(MRT_Nsecondorder_xz_IN - MRT_Nsecondorder_xz_EQ)
    MRT_Esecondorder_OUT = MRT_Esecondorder_IN - MRT_Omega[2].*(MRT_Esecondorder_IN - MRT_Esecondorder_EQ)
    MRT_Qthirdorder1_OUT = MRT_Qthirdorder1_IN - MRT_Omega[3].*(MRT_Qthirdorder1_IN - MRT_Qthirdorder1_EQ)
    MRT_Qthirdorder2_OUT = MRT_Qthirdorder2_IN - MRT_Omega[3].*(MRT_Qthirdorder2_IN - MRT_Qthirdorder2_EQ)
    MRT_Qthirdorder3_OUT = MRT_Qthirdorder3_IN - MRT_Omega[3].*(MRT_Qthirdorder3_IN - MRT_Qthirdorder3_EQ)
    MRT_Qthirdorder4_OUT = MRT_Qthirdorder4_IN - MRT_Omega[4].*(MRT_Qthirdorder4_IN - MRT_Qthirdorder4_EQ)
    MRT_Qthirdorder5_OUT = MRT_Qthirdorder5_IN - MRT_Omega[4].*(MRT_Qthirdorder5_IN - MRT_Qthirdorder5_EQ)
    MRT_Qthirdorder6_OUT = MRT_Qthirdorder6_IN - MRT_Omega[4].*(MRT_Qthirdorder6_IN - MRT_Qthirdorder6_EQ)
    MRT_M111_OUT = MRT_M111_IN - MRT_Omega[5].*(MRT_M111_IN - MRT_M111_EQ)
    MRT_Afourthorder1_OUT = MRT_Afourthorder1_IN - MRT_Omega[6].*(MRT_Afourthorder1_IN - MRT_Afourthorder1_EQ)
    MRT_Afourthorder2_OUT = MRT_Afourthorder2_IN - MRT_Omega[6].*(MRT_Afourthorder2_IN - MRT_Afourthorder2_EQ)
    MRT_Afourthorder3_OUT = MRT_Afourthorder3_IN - MRT_Omega[7].*(MRT_Afourthorder3_IN - MRT_Afourthorder3_EQ)
    MRT_M211_OUT = MRT_M211_IN - MRT_Omega[8].*(MRT_M211_IN - MRT_M211_EQ)
    MRT_M121_OUT = MRT_M121_IN - MRT_Omega[8].*(MRT_M121_IN - MRT_M121_EQ)
    MRT_M112_OUT = MRT_M112_IN - MRT_Omega[8].*(MRT_M112_IN - MRT_M112_EQ)
    MRT_M221_OUT = MRT_M221_IN - MRT_Omega[9].*(MRT_M221_IN - MRT_M221_EQ)
    MRT_M212_OUT = MRT_M212_IN - MRT_Omega[9].*(MRT_M212_IN - MRT_M212_EQ)
    MRT_M122_OUT = MRT_M122_IN - MRT_Omega[9].*(MRT_M122_IN - MRT_M122_EQ)
    MRT_M222_OUT = MRT_M222_IN - MRT_Omega[10].*(MRT_M222_IN - MRT_M222_EQ)
    # Output block - from raw moment space to velocity space
    MRT_M200_OUT = 1./3.*(MRT_Esecondorder_OUT + MRT_Nsecondorder_xy_OUT + MRT_Nsecondorder_xz_OUT)
    MRT_M020_OUT = 1./3.*(MRT_Esecondorder_OUT - 2.*MRT_Nsecondorder_xy_OUT + MRT_Nsecondorder_xz_OUT)
    MRT_M002_OUT = 1./3.*(MRT_Esecondorder_OUT + MRT_Nsecondorder_xy_OUT - 2.*MRT_Nsecondorder_xz_OUT)
    MRT_M210_OUT = 1./2.*(MRT_Qthirdorder1_OUT + MRT_Qthirdorder4_OUT)
    MRT_M201_OUT = 1./2.*(MRT_Qthirdorder2_OUT + MRT_Qthirdorder5_OUT)
    MRT_M120_OUT = 1./2.*(MRT_Qthirdorder3_OUT + MRT_Qthirdorder6_OUT)
    MRT_M102_OUT = 1./2.*(MRT_Qthirdorder3_OUT - MRT_Qthirdorder6_OUT)
    MRT_M021_OUT = 1./2.*(MRT_Qthirdorder2_OUT - MRT_Qthirdorder5_OUT)
    MRT_M012_OUT = 1./2.*(MRT_Qthirdorder1_OUT - MRT_Qthirdorder4_OUT)
    MRT_M220_OUT = 1./3.*(MRT_Afourthorder3_OUT + MRT_Afourthorder1_OUT + MRT_Afourthorder2_OUT)
    MRT_M202_OUT = 1./3.*(MRT_Afourthorder3_OUT - MRT_Afourthorder1_OUT)
    MRT_M022_OUT = 1./3.*(MRT_Afourthorder3_OUT - MRT_Afourthorder2_OUT)
    f01_OUT = Rho.*(MRT_M000_OUT - MRT_M200_OUT - MRT_M020_OUT - MRT_M002_OUT + MRT_M220_OUT + MRT_M202_OUT + MRT_M022_OUT - MRT_M222_OUT)
    f02_OUT = 1./2.*Rho.*(MRT_M100_OUT + MRT_M200_OUT - MRT_M120_OUT - MRT_M102_OUT - MRT_M220_OUT - MRT_M202_OUT + MRT_M122_OUT + MRT_M222_OUT)
    f03_OUT = 1./2.*Rho.*( - MRT_M100_OUT + MRT_M200_OUT + MRT_M120_OUT + MRT_M102_OUT - MRT_M220_OUT - MRT_M202_OUT - MRT_M122_OUT + MRT_M222_OUT)
    f04_OUT = 1./2.*Rho.*(MRT_M010_OUT + MRT_M020_OUT - MRT_M210_OUT - MRT_M012_OUT - MRT_M220_OUT - MRT_M022_OUT + MRT_M212_OUT + MRT_M222_OUT)
    f05_OUT = 1./2.*Rho.*( - MRT_M010_OUT + MRT_M020_OUT + MRT_M210_OUT + MRT_M012_OUT - MRT_M220_OUT - MRT_M022_OUT - MRT_M212_OUT + MRT_M222_OUT)
    f06_OUT = 1./2.*Rho.*(MRT_M001_OUT + MRT_M002_OUT - MRT_M201_OUT - MRT_M021_OUT - MRT_M202_OUT - MRT_M022_OUT + MRT_M221_OUT + MRT_M222_OUT)
    f07_OUT = 1./2.*Rho.*( - MRT_M001_OUT + MRT_M002_OUT + MRT_M201_OUT + MRT_M021_OUT - MRT_M202_OUT - MRT_M022_OUT - MRT_M221_OUT + MRT_M222_OUT)
    f08_OUT = 1./4.*Rho.*(MRT_M110_OUT + MRT_M210_OUT + MRT_M120_OUT - MRT_M112_OUT + MRT_M220_OUT - MRT_M212_OUT - MRT_M122_OUT - MRT_M222_OUT)
    f09_OUT = 1./4.*Rho.*(MRT_M110_OUT - MRT_M210_OUT - MRT_M120_OUT - MRT_M112_OUT + MRT_M220_OUT + MRT_M212_OUT + MRT_M122_OUT - MRT_M222_OUT)
    f10_OUT = 1./4.*Rho.*( - MRT_M110_OUT - MRT_M210_OUT + MRT_M120_OUT + MRT_M112_OUT + MRT_M220_OUT + MRT_M212_OUT - MRT_M122_OUT - MRT_M222_OUT)
    f11_OUT = 1./4.*Rho.*( - MRT_M110_OUT + MRT_M210_OUT - MRT_M120_OUT + MRT_M112_OUT + MRT_M220_OUT - MRT_M212_OUT + MRT_M122_OUT - MRT_M222_OUT)
    f12_OUT = 1./4.*Rho.*(MRT_M101_OUT + MRT_M201_OUT + MRT_M102_OUT - MRT_M121_OUT + MRT_M202_OUT - MRT_M221_OUT - MRT_M122_OUT - MRT_M222_OUT)
    f13_OUT = 1./4.*Rho.*(MRT_M101_OUT - MRT_M201_OUT - MRT_M102_OUT - MRT_M121_OUT + MRT_M202_OUT + MRT_M221_OUT + MRT_M122_OUT - MRT_M222_OUT)
    f14_OUT = 1./4.*Rho.*( - MRT_M101_OUT - MRT_M201_OUT + MRT_M102_OUT + MRT_M121_OUT + MRT_M202_OUT + MRT_M221_OUT - MRT_M122_OUT - MRT_M222_OUT)
    f15_OUT = 1./4.*Rho.*( - MRT_M101_OUT + MRT_M201_OUT - MRT_M102_OUT + MRT_M121_OUT + MRT_M202_OUT - MRT_M221_OUT + MRT_M122_OUT - MRT_M222_OUT)
    f16_OUT = 1./4.*Rho.*(MRT_M011_OUT + MRT_M021_OUT + MRT_M012_OUT - MRT_M211_OUT + MRT_M022_OUT - MRT_M221_OUT - MRT_M212_OUT - MRT_M222_OUT)
    f17_OUT = 1./4.*Rho.*(MRT_M011_OUT - MRT_M021_OUT - MRT_M012_OUT - MRT_M211_OUT + MRT_M022_OUT + MRT_M221_OUT + MRT_M212_OUT - MRT_M222_OUT)
    f18_OUT = 1./4.*Rho.*( - MRT_M011_OUT - MRT_M021_OUT + MRT_M012_OUT + MRT_M211_OUT + MRT_M022_OUT + MRT_M221_OUT - MRT_M212_OUT - MRT_M222_OUT)
    f19_OUT = 1./4.*Rho.*( - MRT_M011_OUT + MRT_M021_OUT - MRT_M012_OUT + MRT_M211_OUT + MRT_M022_OUT - MRT_M221_OUT + MRT_M212_OUT - MRT_M222_OUT)
    f20_OUT = 1./8.*Rho.*(MRT_M111_OUT + MRT_M211_OUT + MRT_M121_OUT + MRT_M112_OUT + MRT_M221_OUT + MRT_M212_OUT + MRT_M122_OUT + MRT_M222_OUT)
    f21_OUT = 1./8.*Rho.*( - MRT_M111_OUT + MRT_M211_OUT + MRT_M121_OUT + MRT_M112_OUT - MRT_M221_OUT - MRT_M212_OUT - MRT_M122_OUT + MRT_M222_OUT)
    f22_OUT = 1./8.*Rho.*( - MRT_M111_OUT - MRT_M211_OUT - MRT_M121_OUT + MRT_M112_OUT - MRT_M221_OUT + MRT_M212_OUT + MRT_M122_OUT + MRT_M222_OUT)
    f23_OUT = 1./8.*Rho.*(MRT_M111_OUT - MRT_M211_OUT - MRT_M121_OUT + MRT_M112_OUT + MRT_M221_OUT - MRT_M212_OUT - MRT_M122_OUT + MRT_M222_OUT)
    f24_OUT = 1./8.*Rho.*( - MRT_M111_OUT - MRT_M211_OUT + MRT_M121_OUT - MRT_M112_OUT + MRT_M221_OUT - MRT_M212_OUT + MRT_M122_OUT + MRT_M222_OUT)
    f25_OUT = 1./8.*Rho.*(MRT_M111_OUT - MRT_M211_OUT + MRT_M121_OUT - MRT_M112_OUT - MRT_M221_OUT + MRT_M212_OUT - MRT_M122_OUT + MRT_M222_OUT)
    f26_OUT = 1./8.*Rho.*(MRT_M111_OUT + MRT_M211_OUT - MRT_M121_OUT - MRT_M112_OUT - MRT_M221_OUT - MRT_M212_OUT + MRT_M122_OUT + MRT_M222_OUT)
    f27_OUT = 1./8.*Rho.*( - MRT_M111_OUT + MRT_M211_OUT - MRT_M121_OUT - MRT_M112_OUT + MRT_M221_OUT + MRT_M212_OUT - MRT_M122_OUT + MRT_M222_OUT)
  end
  # CMRT LBM COLLISION MODEL
  if Collision_Model == "CMRT_LBM"
    # zeroth order moment (conservation of mass)
      # CMRT_M000 [M01]
    # first order moments (conservation of momentum)
      # CMRT_M100 [M02]
      # CMRT_M010 [M03]
      # CMRT_M001 [M04]
    # second order moments
      # CMRT_M110 [M05]
      # CMRT_M101 [M06]
      # CMRT_M011 [M07]
      # CMRT_M200 [M08]
      # CMRT_M020 [M09]
      # CMRT_M002 [M10]
    # third order moments
      # CMRT_M111 [M11]
      # CMRT_M210 [M12]
      # CMRT_M201 [M13]
      # CMRT_M120 [M14]
      # CMRT_M102 [M15]
      # CMRT_M021 [M16]
      # CMRT_M012 [M17]
    # fourth order moments
      # CMRT_M211 [M18]
      # CMRT_M121 [M19]
      # CMRT_M112 [M20]
      # CMRT_M220 [M21]
      # CMRT_M202 [M22]
      # CMRT_M022 [M23]
    # fifth order moments
      # CMRT_M221 [M24]
      # CMRT_M212 [M25]
      # CMRT_M122 [M26]
    # sixth order moment
      # CMRT_M222 [M27]
    # Input block - from velocity space to raw moment space
    CMRT_M000raw_IN = ones(Nx, Ny, Nz)
    CMRT_M100raw_IN = Ux.*1
    CMRT_M010raw_IN = Uy.*1
    CMRT_M001raw_IN = Uz.*1
    CMRT_M110raw_IN = 1./Rho.*(f08_IN + f09_IN + f20_IN + f21_IN + f22_IN + f23_IN - f10_IN - f11_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    CMRT_M101raw_IN = 1./Rho.*(f12_IN + f13_IN + f20_IN + f21_IN + f24_IN + f25_IN - f14_IN - f15_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    CMRT_M011raw_IN = 1./Rho.*(f16_IN + f17_IN + f20_IN + f21_IN + f26_IN + f27_IN - f18_IN - f19_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    CMRT_M200raw_IN = 1./Rho.*(f02_IN + f03_IN + f08_IN + f09_IN + f10_IN + f11_IN + f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M020raw_IN = 1./Rho.*(f04_IN + f05_IN + f08_IN + f09_IN + f10_IN + f11_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M002raw_IN = 1./Rho.*(f06_IN + f07_IN + f12_IN + f13_IN + f14_IN + f15_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M111raw_IN = 1./Rho.*(f20_IN + f23_IN + f25_IN + f26_IN - f21_IN - f22_IN - f24_IN - f27_IN)
    CMRT_M210raw_IN = 1./Rho.*(f08_IN + f11_IN + f20_IN + f22_IN + f25_IN + f27_IN - f09_IN - f10_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    CMRT_M201raw_IN = 1./Rho.*(f12_IN + f15_IN + f20_IN + f23_IN + f24_IN + f27_IN - f13_IN - f14_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    CMRT_M120raw_IN = 1./Rho.*(f08_IN + f10_IN + f20_IN + f22_IN + f24_IN + f26_IN - f09_IN - f11_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    CMRT_M102raw_IN = 1./Rho.*(f12_IN + f14_IN + f20_IN + f22_IN + f24_IN + f26_IN - f13_IN - f15_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    CMRT_M021raw_IN = 1./Rho.*(f16_IN + f19_IN + f20_IN + f23_IN + f24_IN + f27_IN - f17_IN - f18_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    CMRT_M012raw_IN = 1./Rho.*(f16_IN + f18_IN + f20_IN + f22_IN + f25_IN + f27_IN - f17_IN - f19_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    CMRT_M211raw_IN = 1./Rho.*(f20_IN + f21_IN + f26_IN + f27_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    CMRT_M121raw_IN = 1./Rho.*(f20_IN + f21_IN + f24_IN + f25_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    CMRT_M112raw_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    CMRT_M220raw_IN = 1./Rho.*(f08_IN + f09_IN + f10_IN + f11_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M202raw_IN = 1./Rho.*(f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M022raw_IN = 1./Rho.*(f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    CMRT_M221raw_IN = 1./Rho.*(f20_IN + f23_IN + f24_IN + f27_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    CMRT_M212raw_IN = 1./Rho.*(f20_IN + f22_IN + f25_IN + f27_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    CMRT_M122raw_IN = 1./Rho.*(f20_IN + f22_IN + f24_IN + f26_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    CMRT_M222raw_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    # Construct input block -  from raw moment space to central moment space
    CMRT_M000central_IN = CMRT_M000raw_IN.*1
    CMRT_M100central_IN = zeros(Nx, Ny, Nz)
    CMRT_M010central_IN = zeros(Nx, Ny, Nz)
    CMRT_M001central_IN = zeros(Nx, Ny, Nz)
    CMRT_M110central_IN = CMRT_M110raw_IN - CMRT_M100raw_IN.*CMRT_M010raw_IN
    CMRT_M101central_IN = CMRT_M101raw_IN - CMRT_M100raw_IN.*CMRT_M001raw_IN
    CMRT_M011central_IN = CMRT_M011raw_IN - CMRT_M010raw_IN.*CMRT_M001raw_IN
    CMRT_M200central_IN = CMRT_M200raw_IN - (CMRT_M100raw_IN.^2)
    CMRT_M020central_IN = CMRT_M020raw_IN - (CMRT_M010raw_IN.^2)
    CMRT_M002central_IN = CMRT_M002raw_IN - (CMRT_M001raw_IN.^2)
    CMRT_M111central_IN = CMRT_M111raw_IN - (CMRT_M011central_IN.*CMRT_M100raw_IN + CMRT_M101central_IN.*CMRT_M010raw_IN + CMRT_M110central_IN.*CMRT_M001raw_IN + CMRT_M100raw_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN)
    CMRT_M210central_IN = CMRT_M210raw_IN - (CMRT_M200central_IN.*CMRT_M010raw_IN + 2.*CMRT_M110central_IN.*CMRT_M100raw_IN + (CMRT_M100raw_IN.^2).*CMRT_M010raw_IN)
    CMRT_M201central_IN = CMRT_M201raw_IN - (CMRT_M200central_IN.*CMRT_M001raw_IN + 2.*CMRT_M101central_IN.*CMRT_M100raw_IN + (CMRT_M100raw_IN.^2).*CMRT_M001raw_IN)
    CMRT_M120central_IN = CMRT_M120raw_IN - (CMRT_M020central_IN.*CMRT_M100raw_IN + 2.*CMRT_M110central_IN.*CMRT_M010raw_IN + CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2))
    CMRT_M102central_IN = CMRT_M102raw_IN - (CMRT_M002central_IN.*CMRT_M100raw_IN + 2.*CMRT_M101central_IN.*CMRT_M001raw_IN + CMRT_M100raw_IN.*(CMRT_M001raw_IN.^2))
    CMRT_M021central_IN = CMRT_M021raw_IN - (CMRT_M020central_IN.*CMRT_M001raw_IN + 2.*CMRT_M011central_IN.*CMRT_M010raw_IN + (CMRT_M010raw_IN.^2).*CMRT_M001raw_IN)
    CMRT_M012central_IN = CMRT_M012raw_IN - (CMRT_M002central_IN.*CMRT_M010raw_IN + 2.*CMRT_M011central_IN.*CMRT_M001raw_IN + CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2))
    CMRT_M211central_IN = CMRT_M211raw_IN - (CMRT_M210central_IN.*CMRT_M001raw_IN + CMRT_M201central_IN.*CMRT_M010raw_IN + 2.*CMRT_M111central_IN.*CMRT_M100raw_IN + CMRT_M200central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M110central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M101central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M011central_IN.*(CMRT_M100raw_IN.^2) + (CMRT_M100raw_IN.^2).*CMRT_M010raw_IN.*CMRT_M001raw_IN)
    CMRT_M121central_IN = CMRT_M121raw_IN - (CMRT_M120central_IN.*CMRT_M001raw_IN + CMRT_M021central_IN.*CMRT_M100raw_IN + 2.*CMRT_M111central_IN.*CMRT_M010raw_IN + CMRT_M020central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M110central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M011central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M101central_IN.*(CMRT_M010raw_IN.^2) + CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN)
    CMRT_M112central_IN = CMRT_M112raw_IN - (CMRT_M102central_IN.*CMRT_M010raw_IN + CMRT_M012central_IN.*CMRT_M100raw_IN + 2.*CMRT_M111central_IN.*CMRT_M001raw_IN + CMRT_M002central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + 2.*CMRT_M101central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M011central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + CMRT_M110central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M100raw_IN.*CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2))
    CMRT_M220central_IN = CMRT_M220raw_IN - (2.*CMRT_M210central_IN.*CMRT_M010raw_IN + 2.*CMRT_M120central_IN.*CMRT_M100raw_IN + 4.*CMRT_M110central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M200central_IN.*(CMRT_M010raw_IN.^2) + CMRT_M020central_IN.*(CMRT_M100raw_IN.^2) + (CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2))
    CMRT_M202central_IN = CMRT_M202raw_IN - (2.*CMRT_M201central_IN.*CMRT_M001raw_IN + 2.*CMRT_M102central_IN.*CMRT_M100raw_IN + 4.*CMRT_M101central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + CMRT_M200central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M002central_IN.*(CMRT_M100raw_IN.^2) + (CMRT_M100raw_IN.^2).*(CMRT_M001raw_IN.^2))
    CMRT_M022central_IN = CMRT_M022raw_IN - (2.*CMRT_M021central_IN.*CMRT_M001raw_IN + 2.*CMRT_M012central_IN.*CMRT_M010raw_IN + 4.*CMRT_M011central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + CMRT_M020central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M002central_IN.*(CMRT_M010raw_IN.^2) + (CMRT_M010raw_IN.^2).*(CMRT_M001raw_IN.^2))
    CMRT_M221central_IN = CMRT_M221raw_IN - (CMRT_M220central_IN.*CMRT_M001raw_IN + 2.*CMRT_M211central_IN.*CMRT_M010raw_IN + 2.*CMRT_M121central_IN.*CMRT_M100raw_IN + 2.*CMRT_M210central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M120central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + CMRT_M201central_IN.*(CMRT_M010raw_IN.^2) + CMRT_M021central_IN.*(CMRT_M100raw_IN.^2) + 4.*CMRT_M111central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M200central_IN.*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN + CMRT_M020central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M001raw_IN + 4.*CMRT_M110central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M101central_IN.*CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2) + 2.*CMRT_M011central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M010raw_IN + (CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN)
    CMRT_M212central_IN = CMRT_M212raw_IN - (CMRT_M202central_IN.*CMRT_M010raw_IN + 2.*CMRT_M211central_IN.*CMRT_M001raw_IN + 2.*CMRT_M112central_IN.*CMRT_M100raw_IN + 2.*CMRT_M201central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M102central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M210central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M012central_IN.*(CMRT_M100raw_IN.^2) + 4.*CMRT_M111central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + CMRT_M200central_IN.*CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2) + CMRT_M002central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M010raw_IN + 4.*CMRT_M101central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M110central_IN.*CMRT_M100raw_IN.*(CMRT_M001raw_IN.^2) + 2.*CMRT_M011central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M001raw_IN + (CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2).*CMRT_M010raw_IN)
    CMRT_M122central_IN = CMRT_M122raw_IN - (CMRT_M022central_IN.*CMRT_M100raw_IN + 2.*CMRT_M121central_IN.*CMRT_M001raw_IN + 2.*CMRT_M112central_IN.*CMRT_M010raw_IN + 2.*CMRT_M021central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M012central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + CMRT_M120central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M102central_IN.*(CMRT_M010raw_IN.^2) + 4.*CMRT_M111central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + CMRT_M020central_IN.*CMRT_M100raw_IN.*(CMRT_M001raw_IN.^2) + CMRT_M002central_IN.*CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2) + 4.*CMRT_M011central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 2.*CMRT_M110central_IN.*CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2) + 2.*CMRT_M101central_IN.*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN + (CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2).*CMRT_M100raw_IN)
    CMRT_M222central_IN = CMRT_M222raw_IN - (2.*CMRT_M221central_IN.*CMRT_M001raw_IN + 2.*CMRT_M212central_IN.*CMRT_M010raw_IN + 2.*CMRT_M122central_IN.*CMRT_M100raw_IN + CMRT_M220central_IN.*(CMRT_M001raw_IN.^2) + CMRT_M202central_IN.*(CMRT_M010raw_IN.^2) + CMRT_M022central_IN.*(CMRT_M100raw_IN.^2) + 4.*CMRT_M211central_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + 4.*CMRT_M121central_IN.*CMRT_M100raw_IN.*CMRT_M001raw_IN + 4.*CMRT_M112central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN + 2.*CMRT_M210central_IN.*CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2) + 2.*CMRT_M201central_IN.*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN + 2.*CMRT_M120central_IN.*CMRT_M100raw_IN.*(CMRT_M001raw_IN.^2) + 2.*CMRT_M102central_IN.*CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2) + 2.*CMRT_M021central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M001raw_IN + 2.*CMRT_M012central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M010raw_IN + 8.*CMRT_M111central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN.*CMRT_M001raw_IN + CMRT_M200central_IN.*(CMRT_M010raw_IN.^2).*(CMRT_M001raw_IN.^2) + CMRT_M020central_IN.*(CMRT_M100raw_IN.^2).*(CMRT_M001raw_IN.^2) + CMRT_M002central_IN.*(CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2) + 4.*CMRT_M110central_IN.*CMRT_M100raw_IN.*CMRT_M010raw_IN.*(CMRT_M001raw_IN.^2) + 4.*CMRT_M101central_IN.*CMRT_M100raw_IN.*(CMRT_M010raw_IN.^2).*CMRT_M001raw_IN + 4.*CMRT_M011central_IN.*(CMRT_M100raw_IN.^2).*CMRT_M010raw_IN.*CMRT_M001raw_IN + (CMRT_M100raw_IN.^2).*(CMRT_M010raw_IN.^2).*(CMRT_M001raw_IN.^2))
    CMRT_Nsecondorder_xy_IN = CMRT_M200central_IN - CMRT_M020central_IN
    CMRT_Nsecondorder_xz_IN = CMRT_M200central_IN - CMRT_M002central_IN
    CMRT_Esecondorder_IN = CMRT_M200central_IN + CMRT_M020central_IN + CMRT_M002central_IN
    CMRT_Qthirdorder1_IN = CMRT_M210central_IN + CMRT_M012central_IN
    CMRT_Qthirdorder2_IN = CMRT_M201central_IN + CMRT_M021central_IN
    CMRT_Qthirdorder3_IN = CMRT_M120central_IN + CMRT_M102central_IN
    CMRT_Qthirdorder4_IN = CMRT_M210central_IN - CMRT_M012central_IN
    CMRT_Qthirdorder5_IN = CMRT_M201central_IN - CMRT_M021central_IN
    CMRT_Qthirdorder6_IN = CMRT_M120central_IN - CMRT_M102central_IN
    CMRT_Afourthorder1_IN = CMRT_M220central_IN - 2.*CMRT_M202central_IN + CMRT_M022central_IN
    CMRT_Afourthorder2_IN = CMRT_M220central_IN + CMRT_M202central_IN - 2.*CMRT_M022central_IN
    CMRT_Afourthorder3_IN = CMRT_M220central_IN + CMRT_M202central_IN + CMRT_M022central_IN
    # Equilibrium block
    CMRT_M110central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M101central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M011central_EQ = zeros(Nx, Ny, Nz)
    CMRT_Nsecondorder_xy_EQ = zeros(Nx, Ny, Nz)
    CMRT_Nsecondorder_xz_EQ = zeros(Nx, Ny, Nz)
    CMRT_Esecondorder_EQ = 1.*ones(Nx, Ny, Nz)
    CMRT_Qthirdorder1_EQ = zeros(Nx, Ny, Nz)
    CMRT_Qthirdorder2_EQ = zeros(Nx, Ny, Nz)
    CMRT_Qthirdorder3_EQ = zeros(Nx, Ny, Nz)
    CMRT_Qthirdorder4_EQ = zeros(Nx, Ny, Nz)
    CMRT_Qthirdorder5_EQ = zeros(Nx, Ny, Nz)
    CMRT_Qthirdorder6_EQ = zeros(Nx, Ny, Nz)
    CMRT_M111central_EQ = zeros(Nx, Ny, Nz)
    CMRT_Afourthorder1_EQ = zeros(Nx, Ny, Nz)
    CMRT_Afourthorder2_EQ = zeros(Nx, Ny, Nz)
    CMRT_Afourthorder3_EQ = 1./3.*ones(Nx, Ny, Nz)
    CMRT_M211central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M121central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M112central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M221central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M212central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M122central_EQ = zeros(Nx, Ny, Nz)
    CMRT_M222central_EQ = 1./27.*ones(Nx, Ny, Nz)
    if Factorized_Cascaded_Model == "Yes"
      CMRT_M110central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M101central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M011central_EQ = zeros(Nx, Ny, Nz)
      CMRT_Nsecondorder_xy_EQ = zeros(Nx, Ny, Nz)
      CMRT_Nsecondorder_xz_EQ = zeros(Nx, Ny, Nz)
      CMRT_Esecondorder_EQ = 1.*ones(Nx, Ny, Nz)
      CMRT_Qthirdorder1_EQ = zeros(Nx, Ny, Nz)
      CMRT_Qthirdorder2_EQ = zeros(Nx, Ny, Nz)
      CMRT_Qthirdorder3_EQ = zeros(Nx, Ny, Nz)
      CMRT_Qthirdorder4_EQ = zeros(Nx, Ny, Nz)
      CMRT_Qthirdorder5_EQ = zeros(Nx, Ny, Nz)
      CMRT_Qthirdorder6_EQ = zeros(Nx, Ny, Nz)
      CMRT_M111central_EQ = zeros(Nx, Ny, Nz)
      CMRT_Afourthorder1_EQ = CMRT_M200central_IN.*CMRT_M020central_IN - 2.*CMRT_M200central_IN.*CMRT_M002central_IN + CMRT_M020central_IN.*CMRT_M002central_IN
      CMRT_Afourthorder2_EQ = CMRT_M200central_IN.*CMRT_M020central_IN + CMRT_M200central_IN.*CMRT_M002central_IN - 2.*CMRT_M020central_IN.*CMRT_M002central_IN
      CMRT_Afourthorder3_EQ = CMRT_M200central_IN.*CMRT_M020central_IN + CMRT_M200central_IN.*CMRT_M002central_IN + CMRT_M020central_IN.*CMRT_M002central_IN
      CMRT_M211central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M121central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M112central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M221central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M212central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M122central_EQ = zeros(Nx, Ny, Nz)
      CMRT_M222central_EQ = CMRT_M200central_IN.*CMRT_M020central_IN.*CMRT_M002central_IN
    end
    # First derivatives
    Combined_Cumulant_FirstDerivatives_xy = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xz = zeros(Nx, Ny, Nz)
    Combined_Cumulant_FirstDerivatives_xyz = zeros(Nx, Ny, Nz)
    if CMRT_First_Order_Velocity_Derivatives == 1
      Dx_Ux = - CMRT_Omega[1]./(2.*Rho).*(2.*CMRT_M200central_IN - CMRT_M020central_IN - CMRT_M002central_IN) - CMRT_Omega[2]./(2.*Rho).*(CMRT_Esecondorder_IN - CMRT_M000raw_IN)
      Dy_Uy = Dx_Ux + 3.*CMRT_Omega[1]./(2.*Rho).*CMRT_Nsecondorder_xy_IN
      Dz_Uz = Dx_Ux + 3.*CMRT_Omega[1]./(2.*Rho).*CMRT_Nsecondorder_xz_IN
      Combined_CMRT_FirstDerivatives_xy = (Ux.^2).*Dx_Ux - (Uy.^2).*Dy_Uy
      Combined_CMRT_FirstDerivatives_xz = (Ux.^2).*Dx_Ux - (Uz.^2).*Dz_Uz
      Combined_CMRT_FirstDerivatives_xyz = (Ux.^2).*Dx_Ux + (Uy.^2).*Dy_Uy + (Uz.^2).*Dz_Uz
    end
    # Relaxation block - in central moment space
    CMRT_M000central_OUT = CMRT_M000central_IN.*1
    CMRT_M100central_OUT = CMRT_M100central_IN.*1
    CMRT_M010central_OUT = CMRT_M010central_IN.*1
    CMRT_M001central_OUT = CMRT_M001central_IN.*1
    CMRT_M110central_OUT = CMRT_M110central_IN - CMRT_Omega[1].*(CMRT_M110central_IN - CMRT_M110central_EQ)
    CMRT_M101central_OUT = CMRT_M101central_IN - CMRT_Omega[1].*(CMRT_M101central_IN - CMRT_M101central_EQ)
    CMRT_M011central_OUT = CMRT_M011central_IN - CMRT_Omega[1].*(CMRT_M011central_IN - CMRT_M011central_EQ)
    CMRT_Nsecondorder_xy_OUT = CMRT_Nsecondorder_xy_IN - CMRT_Omega[1].*(CMRT_Nsecondorder_xy_IN - CMRT_Nsecondorder_xy_EQ) - 3.*Rho.*(1 - 1/2.*CMRT_Omega[1]).*Combined_CMRT_FirstDerivatives_xy.*CMRT_First_Order_Velocity_Derivatives
    CMRT_Nsecondorder_xz_OUT = CMRT_Nsecondorder_xz_IN - CMRT_Omega[1].*(CMRT_Nsecondorder_xz_IN - CMRT_Nsecondorder_xz_EQ) - 3.*Rho.*(1 - 1/2.*CMRT_Omega[1]).*Combined_CMRT_FirstDerivatives_xz.*CMRT_First_Order_Velocity_Derivatives
    CMRT_Esecondorder_OUT = CMRT_Esecondorder_IN - CMRT_Omega[2].*(CMRT_Esecondorder_IN - CMRT_Esecondorder_EQ) - 3.*Rho.*(1 - 1/2.*CMRT_Omega[2]).*Combined_CMRT_FirstDerivatives_xyz.*CMRT_First_Order_Velocity_Derivatives
    CMRT_Qthirdorder1_OUT = CMRT_Qthirdorder1_IN - CMRT_Omega[3].*(CMRT_Qthirdorder1_IN - CMRT_Qthirdorder1_EQ)
    CMRT_Qthirdorder2_OUT = CMRT_Qthirdorder2_IN - CMRT_Omega[3].*(CMRT_Qthirdorder2_IN - CMRT_Qthirdorder2_EQ)
    CMRT_Qthirdorder3_OUT = CMRT_Qthirdorder3_IN - CMRT_Omega[3].*(CMRT_Qthirdorder3_IN - CMRT_Qthirdorder3_EQ)
    CMRT_Qthirdorder4_OUT = CMRT_Qthirdorder4_IN - CMRT_Omega[4].*(CMRT_Qthirdorder4_IN - CMRT_Qthirdorder4_EQ)
    CMRT_Qthirdorder5_OUT = CMRT_Qthirdorder5_IN - CMRT_Omega[4].*(CMRT_Qthirdorder5_IN - CMRT_Qthirdorder5_EQ)
    CMRT_Qthirdorder6_OUT = CMRT_Qthirdorder6_IN - CMRT_Omega[4].*(CMRT_Qthirdorder6_IN - CMRT_Qthirdorder6_EQ)
    CMRT_M111central_OUT = CMRT_M111central_IN - CMRT_Omega[5].*(CMRT_M111central_IN - CMRT_M111central_EQ)
    CMRT_Afourthorder1_OUT = CMRT_Afourthorder1_IN - CMRT_Omega[6].*(CMRT_Afourthorder1_IN - CMRT_Afourthorder1_EQ)
    CMRT_Afourthorder2_OUT = CMRT_Afourthorder2_IN - CMRT_Omega[6].*(CMRT_Afourthorder2_IN - CMRT_Afourthorder2_EQ)
    CMRT_Afourthorder3_OUT = CMRT_Afourthorder3_IN - CMRT_Omega[7].*(CMRT_Afourthorder3_IN - CMRT_Afourthorder3_EQ)
    CMRT_M211central_OUT = CMRT_M211central_IN - CMRT_Omega[8].*(CMRT_M211central_IN - CMRT_M211central_EQ)
    CMRT_M121central_OUT = CMRT_M121central_IN - CMRT_Omega[8].*(CMRT_M121central_IN - CMRT_M121central_EQ)
    CMRT_M112central_OUT = CMRT_M112central_IN - CMRT_Omega[8].*(CMRT_M112central_IN - CMRT_M112central_EQ)
    CMRT_M221central_OUT = CMRT_M221central_IN - CMRT_Omega[9].*(CMRT_M221central_IN - CMRT_M221central_EQ)
    CMRT_M212central_OUT = CMRT_M212central_IN - CMRT_Omega[9].*(CMRT_M212central_IN - CMRT_M212central_EQ)
    CMRT_M122central_OUT = CMRT_M122central_IN - CMRT_Omega[9].*(CMRT_M122central_IN - CMRT_M122central_EQ)
    CMRT_M222central_OUT = CMRT_M222central_IN - CMRT_Omega[10].*(CMRT_M222central_IN - CMRT_M222central_EQ)
    # Construct output block - from central moment space to raw moment space
    CMRT_M200central_OUT = 1./3.*(CMRT_Esecondorder_OUT + CMRT_Nsecondorder_xy_OUT + CMRT_Nsecondorder_xz_OUT)
    CMRT_M020central_OUT = 1./3.*(CMRT_Esecondorder_OUT - 2.*CMRT_Nsecondorder_xy_OUT + CMRT_Nsecondorder_xz_OUT)
    CMRT_M002central_OUT = 1./3.*(CMRT_Esecondorder_OUT + CMRT_Nsecondorder_xy_OUT - 2.*CMRT_Nsecondorder_xz_OUT)
    CMRT_M210central_OUT = 1./2.*(CMRT_Qthirdorder1_OUT + CMRT_Qthirdorder4_OUT)
    CMRT_M201central_OUT = 1./2.*(CMRT_Qthirdorder2_OUT + CMRT_Qthirdorder5_OUT)
    CMRT_M120central_OUT = 1./2.*(CMRT_Qthirdorder3_OUT + CMRT_Qthirdorder6_OUT)
    CMRT_M102central_OUT = 1./2.*(CMRT_Qthirdorder3_OUT - CMRT_Qthirdorder6_OUT)
    CMRT_M021central_OUT = 1./2.*(CMRT_Qthirdorder2_OUT - CMRT_Qthirdorder5_OUT)
    CMRT_M012central_OUT = 1./2.*(CMRT_Qthirdorder1_OUT - CMRT_Qthirdorder4_OUT)
    CMRT_M220central_OUT = 1./3.*(CMRT_Afourthorder3_OUT + CMRT_Afourthorder1_OUT + CMRT_Afourthorder2_OUT)
    CMRT_M202central_OUT = 1./3.*(CMRT_Afourthorder3_OUT - CMRT_Afourthorder1_OUT)
    CMRT_M022central_OUT = 1./3.*(CMRT_Afourthorder3_OUT - CMRT_Afourthorder2_OUT)
    CMRT_M000raw_OUT = ones(Nx, Ny, Nz)
    CMRT_M100raw_OUT = Ux.*1
    CMRT_M010raw_OUT = Uy.*1
    CMRT_M001raw_OUT = Uz.*1
    CMRT_M110raw_OUT = CMRT_M110central_OUT + CMRT_M100raw_OUT.*CMRT_M010raw_OUT
    CMRT_M101raw_OUT = CMRT_M101central_OUT + CMRT_M100raw_OUT.*CMRT_M001raw_OUT
    CMRT_M011raw_OUT = CMRT_M011central_OUT + CMRT_M010raw_OUT.*CMRT_M001raw_OUT
    CMRT_M200raw_OUT = CMRT_M200central_OUT + (CMRT_M100raw_OUT.^2)
    CMRT_M020raw_OUT = CMRT_M020central_OUT + (CMRT_M010raw_OUT.^2)
    CMRT_M002raw_OUT = CMRT_M002central_OUT + (CMRT_M001raw_OUT.^2)
    CMRT_M111raw_OUT = CMRT_M111central_OUT + (CMRT_M011central_OUT.*CMRT_M100raw_OUT + CMRT_M101central_OUT.*CMRT_M010raw_OUT + CMRT_M110central_OUT.*CMRT_M001raw_OUT + CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT)
    CMRT_M210raw_OUT = CMRT_M210central_OUT + (CMRT_M200central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M100raw_OUT + (CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT)
    CMRT_M201raw_OUT = CMRT_M201central_OUT + (CMRT_M200central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M101central_OUT.*CMRT_M100raw_OUT + (CMRT_M100raw_OUT.^2).*CMRT_M001raw_OUT)
    CMRT_M120raw_OUT = CMRT_M120central_OUT + (CMRT_M020central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M010raw_OUT + CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2))
    CMRT_M102raw_OUT = CMRT_M102central_OUT + (CMRT_M002central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M101central_OUT.*CMRT_M001raw_OUT + CMRT_M100raw_OUT.*(CMRT_M001raw_OUT.^2))
    CMRT_M021raw_OUT = CMRT_M021central_OUT + (CMRT_M020central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M011central_OUT.*CMRT_M010raw_OUT + (CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT)
    CMRT_M012raw_OUT = CMRT_M012central_OUT + (CMRT_M002central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M011central_OUT.*CMRT_M001raw_OUT + CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2))
    CMRT_M211raw_OUT = CMRT_M211central_OUT + (CMRT_M210central_OUT.*CMRT_M001raw_OUT + CMRT_M201central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M111central_OUT.*CMRT_M100raw_OUT + CMRT_M200central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M101central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M011central_OUT.*(CMRT_M100raw_OUT.^2) + (CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT.*CMRT_M001raw_OUT)
    CMRT_M121raw_OUT = CMRT_M121central_OUT + (CMRT_M120central_OUT.*CMRT_M001raw_OUT + CMRT_M021central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M111central_OUT.*CMRT_M010raw_OUT + CMRT_M020central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M011central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M101central_OUT.*(CMRT_M010raw_OUT.^2) + CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT)
    CMRT_M112raw_OUT = CMRT_M112central_OUT + (CMRT_M102central_OUT.*CMRT_M010raw_OUT + CMRT_M012central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M111central_OUT.*CMRT_M001raw_OUT + CMRT_M002central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M101central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M011central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + CMRT_M110central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2))
    CMRT_M220raw_OUT = CMRT_M220central_OUT + (2.*CMRT_M210central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M120central_OUT.*CMRT_M100raw_OUT + 4.*CMRT_M110central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M200central_OUT.*(CMRT_M010raw_OUT.^2) + CMRT_M020central_OUT.*(CMRT_M100raw_OUT.^2) + (CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2))
    CMRT_M202raw_OUT = CMRT_M202central_OUT + (2.*CMRT_M201central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M102central_OUT.*CMRT_M100raw_OUT + 4.*CMRT_M101central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + CMRT_M200central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M002central_OUT.*(CMRT_M100raw_OUT.^2) + (CMRT_M100raw_OUT.^2).*(CMRT_M001raw_OUT.^2))
    CMRT_M022raw_OUT = CMRT_M022central_OUT + (2.*CMRT_M021central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M012central_OUT.*CMRT_M010raw_OUT + 4.*CMRT_M011central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + CMRT_M020central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M002central_OUT.*(CMRT_M010raw_OUT.^2) + (CMRT_M010raw_OUT.^2).*(CMRT_M001raw_OUT.^2))
    CMRT_M221raw_OUT = CMRT_M221central_OUT + (CMRT_M220central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M211central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M121central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M210central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M120central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + CMRT_M201central_OUT.*(CMRT_M010raw_OUT.^2) + CMRT_M021central_OUT.*(CMRT_M100raw_OUT.^2) + 4.*CMRT_M111central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M200central_OUT.*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT + CMRT_M020central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M001raw_OUT + 4.*CMRT_M110central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M101central_OUT.*CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2) + 2.*CMRT_M011central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT + (CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT)
    CMRT_M212raw_OUT = CMRT_M212central_OUT + (CMRT_M202central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M211central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M112central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M201central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M102central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M210central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M012central_OUT.*(CMRT_M100raw_OUT.^2) + 4.*CMRT_M111central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + CMRT_M200central_OUT.*CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M002central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT + 4.*CMRT_M101central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M100raw_OUT.*(CMRT_M001raw_OUT.^2) + 2.*CMRT_M011central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M001raw_OUT + (CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2).*CMRT_M010raw_OUT)
    CMRT_M122raw_OUT = CMRT_M122central_OUT + (CMRT_M022central_OUT.*CMRT_M100raw_OUT + 2.*CMRT_M121central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M112central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M021central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M012central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + CMRT_M120central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M102central_OUT.*(CMRT_M010raw_OUT.^2) + 4.*CMRT_M111central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + CMRT_M020central_OUT.*CMRT_M100raw_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M002central_OUT.*CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2) + 4.*CMRT_M011central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M110central_OUT.*CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2) + 2.*CMRT_M101central_OUT.*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT + (CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2).*CMRT_M100raw_OUT)
    CMRT_M222raw_OUT = CMRT_M222central_OUT + (2.*CMRT_M221central_OUT.*CMRT_M001raw_OUT + 2.*CMRT_M212central_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M122central_OUT.*CMRT_M100raw_OUT + CMRT_M220central_OUT.*(CMRT_M001raw_OUT.^2) + CMRT_M202central_OUT.*(CMRT_M010raw_OUT.^2) + CMRT_M022central_OUT.*(CMRT_M100raw_OUT.^2) + 4.*CMRT_M211central_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + 4.*CMRT_M121central_OUT.*CMRT_M100raw_OUT.*CMRT_M001raw_OUT + 4.*CMRT_M112central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT + 2.*CMRT_M210central_OUT.*CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2) + 2.*CMRT_M201central_OUT.*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT + 2.*CMRT_M120central_OUT.*CMRT_M100raw_OUT.*(CMRT_M001raw_OUT.^2) + 2.*CMRT_M102central_OUT.*CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2) + 2.*CMRT_M021central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M001raw_OUT + 2.*CMRT_M012central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT + 8.*CMRT_M111central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + CMRT_M200central_OUT.*(CMRT_M010raw_OUT.^2).*(CMRT_M001raw_OUT.^2) + CMRT_M020central_OUT.*(CMRT_M100raw_OUT.^2).*(CMRT_M001raw_OUT.^2) + CMRT_M002central_OUT.*(CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2) + 4.*CMRT_M110central_OUT.*CMRT_M100raw_OUT.*CMRT_M010raw_OUT.*(CMRT_M001raw_OUT.^2) + 4.*CMRT_M101central_OUT.*CMRT_M100raw_OUT.*(CMRT_M010raw_OUT.^2).*CMRT_M001raw_OUT + 4.*CMRT_M011central_OUT.*(CMRT_M100raw_OUT.^2).*CMRT_M010raw_OUT.*CMRT_M001raw_OUT + (CMRT_M100raw_OUT.^2).*(CMRT_M010raw_OUT.^2).*(CMRT_M001raw_OUT.^2))
    # Output block - from raw moment space to velocity space
    f01_OUT = Rho.*(CMRT_M000raw_OUT - CMRT_M200raw_OUT - CMRT_M020raw_OUT - CMRT_M002raw_OUT + CMRT_M220raw_OUT + CMRT_M202raw_OUT + CMRT_M022raw_OUT - CMRT_M222raw_OUT)
    f02_OUT = 1./2.*Rho.*(CMRT_M100raw_OUT + CMRT_M200raw_OUT - CMRT_M120raw_OUT - CMRT_M102raw_OUT - CMRT_M220raw_OUT - CMRT_M202raw_OUT + CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f03_OUT = 1./2.*Rho.*( - CMRT_M100raw_OUT + CMRT_M200raw_OUT + CMRT_M120raw_OUT + CMRT_M102raw_OUT - CMRT_M220raw_OUT - CMRT_M202raw_OUT - CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f04_OUT = 1./2.*Rho.*(CMRT_M010raw_OUT + CMRT_M020raw_OUT - CMRT_M210raw_OUT - CMRT_M012raw_OUT - CMRT_M220raw_OUT - CMRT_M022raw_OUT + CMRT_M212raw_OUT + CMRT_M222raw_OUT)
    f05_OUT = 1./2.*Rho.*( - CMRT_M010raw_OUT + CMRT_M020raw_OUT + CMRT_M210raw_OUT + CMRT_M012raw_OUT - CMRT_M220raw_OUT - CMRT_M022raw_OUT - CMRT_M212raw_OUT + CMRT_M222raw_OUT)
    f06_OUT = 1./2.*Rho.*(CMRT_M001raw_OUT + CMRT_M002raw_OUT - CMRT_M201raw_OUT - CMRT_M021raw_OUT - CMRT_M202raw_OUT - CMRT_M022raw_OUT + CMRT_M221raw_OUT + CMRT_M222raw_OUT)
    f07_OUT = 1./2.*Rho.*( - CMRT_M001raw_OUT + CMRT_M002raw_OUT + CMRT_M201raw_OUT + CMRT_M021raw_OUT - CMRT_M202raw_OUT - CMRT_M022raw_OUT - CMRT_M221raw_OUT + CMRT_M222raw_OUT)
    f08_OUT = 1./4.*Rho.*(CMRT_M110raw_OUT + CMRT_M210raw_OUT + CMRT_M120raw_OUT - CMRT_M112raw_OUT + CMRT_M220raw_OUT - CMRT_M212raw_OUT - CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f09_OUT = 1./4.*Rho.*(CMRT_M110raw_OUT - CMRT_M210raw_OUT - CMRT_M120raw_OUT - CMRT_M112raw_OUT + CMRT_M220raw_OUT + CMRT_M212raw_OUT + CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f10_OUT = 1./4.*Rho.*( - CMRT_M110raw_OUT - CMRT_M210raw_OUT + CMRT_M120raw_OUT + CMRT_M112raw_OUT + CMRT_M220raw_OUT + CMRT_M212raw_OUT - CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f11_OUT = 1./4.*Rho.*( - CMRT_M110raw_OUT + CMRT_M210raw_OUT - CMRT_M120raw_OUT + CMRT_M112raw_OUT + CMRT_M220raw_OUT - CMRT_M212raw_OUT + CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f12_OUT = 1./4.*Rho.*(CMRT_M101raw_OUT + CMRT_M201raw_OUT + CMRT_M102raw_OUT - CMRT_M121raw_OUT + CMRT_M202raw_OUT - CMRT_M221raw_OUT - CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f13_OUT = 1./4.*Rho.*(CMRT_M101raw_OUT - CMRT_M201raw_OUT - CMRT_M102raw_OUT - CMRT_M121raw_OUT + CMRT_M202raw_OUT + CMRT_M221raw_OUT + CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f14_OUT = 1./4.*Rho.*( - CMRT_M101raw_OUT - CMRT_M201raw_OUT + CMRT_M102raw_OUT + CMRT_M121raw_OUT + CMRT_M202raw_OUT + CMRT_M221raw_OUT - CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f15_OUT = 1./4.*Rho.*( - CMRT_M101raw_OUT + CMRT_M201raw_OUT - CMRT_M102raw_OUT + CMRT_M121raw_OUT + CMRT_M202raw_OUT - CMRT_M221raw_OUT + CMRT_M122raw_OUT - CMRT_M222raw_OUT)
    f16_OUT = 1./4.*Rho.*(CMRT_M011raw_OUT + CMRT_M021raw_OUT + CMRT_M012raw_OUT - CMRT_M211raw_OUT + CMRT_M022raw_OUT - CMRT_M221raw_OUT - CMRT_M212raw_OUT - CMRT_M222raw_OUT)
    f17_OUT = 1./4.*Rho.*(CMRT_M011raw_OUT - CMRT_M021raw_OUT - CMRT_M012raw_OUT - CMRT_M211raw_OUT + CMRT_M022raw_OUT + CMRT_M221raw_OUT + CMRT_M212raw_OUT - CMRT_M222raw_OUT)
    f18_OUT = 1./4.*Rho.*( - CMRT_M011raw_OUT - CMRT_M021raw_OUT + CMRT_M012raw_OUT + CMRT_M211raw_OUT + CMRT_M022raw_OUT + CMRT_M221raw_OUT - CMRT_M212raw_OUT - CMRT_M222raw_OUT)
    f19_OUT = 1./4.*Rho.*( - CMRT_M011raw_OUT + CMRT_M021raw_OUT - CMRT_M012raw_OUT + CMRT_M211raw_OUT + CMRT_M022raw_OUT - CMRT_M221raw_OUT + CMRT_M212raw_OUT - CMRT_M222raw_OUT)
    f20_OUT = 1./8.*Rho.*(CMRT_M111raw_OUT + CMRT_M211raw_OUT + CMRT_M121raw_OUT + CMRT_M112raw_OUT + CMRT_M221raw_OUT + CMRT_M212raw_OUT + CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f21_OUT = 1./8.*Rho.*( - CMRT_M111raw_OUT + CMRT_M211raw_OUT + CMRT_M121raw_OUT + CMRT_M112raw_OUT - CMRT_M221raw_OUT - CMRT_M212raw_OUT - CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f22_OUT = 1./8.*Rho.*( - CMRT_M111raw_OUT - CMRT_M211raw_OUT - CMRT_M121raw_OUT + CMRT_M112raw_OUT - CMRT_M221raw_OUT + CMRT_M212raw_OUT + CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f23_OUT = 1./8.*Rho.*(CMRT_M111raw_OUT - CMRT_M211raw_OUT - CMRT_M121raw_OUT + CMRT_M112raw_OUT + CMRT_M221raw_OUT - CMRT_M212raw_OUT - CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f24_OUT = 1./8.*Rho.*( - CMRT_M111raw_OUT - CMRT_M211raw_OUT + CMRT_M121raw_OUT - CMRT_M112raw_OUT + CMRT_M221raw_OUT - CMRT_M212raw_OUT + CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f25_OUT = 1./8.*Rho.*(CMRT_M111raw_OUT - CMRT_M211raw_OUT + CMRT_M121raw_OUT - CMRT_M112raw_OUT - CMRT_M221raw_OUT + CMRT_M212raw_OUT - CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f26_OUT = 1./8.*Rho.*(CMRT_M111raw_OUT + CMRT_M211raw_OUT - CMRT_M121raw_OUT - CMRT_M112raw_OUT - CMRT_M221raw_OUT - CMRT_M212raw_OUT + CMRT_M122raw_OUT + CMRT_M222raw_OUT)
    f27_OUT = 1./8.*Rho.*( - CMRT_M111raw_OUT + CMRT_M211raw_OUT - CMRT_M121raw_OUT - CMRT_M112raw_OUT + CMRT_M221raw_OUT + CMRT_M212raw_OUT - CMRT_M122raw_OUT + CMRT_M222raw_OUT)
  end
  # CUMULANT LBM COLLISION MODEL
  if Collision_Model == "Cumulant_LBM"
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
    # Input block - from velocity space to raw moment space
    Cumulant_M000raw_IN = ones(Nx, Ny, Nz)
    Cumulant_M100raw_IN = Ux
    Cumulant_M010raw_IN = Uy
    Cumulant_M001raw_IN = Uz
    Cumulant_M110raw_IN = 1./Rho.*(f08_IN + f09_IN + f20_IN + f21_IN + f22_IN + f23_IN - f10_IN - f11_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    Cumulant_M101raw_IN = 1./Rho.*(f12_IN + f13_IN + f20_IN + f21_IN + f24_IN + f25_IN - f14_IN - f15_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    Cumulant_M011raw_IN = 1./Rho.*(f16_IN + f17_IN + f20_IN + f21_IN + f26_IN + f27_IN - f18_IN - f19_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    Cumulant_M200raw_IN = 1./Rho.*(f02_IN + f03_IN + f08_IN + f09_IN + f10_IN + f11_IN + f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M020raw_IN = 1./Rho.*(f04_IN + f05_IN + f08_IN + f09_IN + f10_IN + f11_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M002raw_IN = 1./Rho.*(f06_IN + f07_IN + f12_IN + f13_IN + f14_IN + f15_IN + f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M111raw_IN = 1./Rho.*(f20_IN + f23_IN + f25_IN + f26_IN - f21_IN - f22_IN - f24_IN - f27_IN)
    Cumulant_M210raw_IN = 1./Rho.*(f08_IN + f11_IN + f20_IN + f22_IN + f25_IN + f27_IN - f09_IN - f10_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    Cumulant_M201raw_IN = 1./Rho.*(f12_IN + f15_IN + f20_IN + f23_IN + f24_IN + f27_IN - f13_IN - f14_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    Cumulant_M120raw_IN = 1./Rho.*(f08_IN + f10_IN + f20_IN + f22_IN + f24_IN + f26_IN - f09_IN - f11_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    Cumulant_M102raw_IN = 1./Rho.*(f12_IN + f14_IN + f20_IN + f22_IN + f24_IN + f26_IN - f13_IN - f15_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    Cumulant_M021raw_IN = 1./Rho.*(f16_IN + f19_IN + f20_IN + f23_IN + f24_IN + f27_IN - f17_IN - f18_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    Cumulant_M012raw_IN = 1./Rho.*(f16_IN + f18_IN + f20_IN + f22_IN + f25_IN + f27_IN - f17_IN - f19_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    Cumulant_M211raw_IN = 1./Rho.*(f20_IN + f21_IN + f26_IN + f27_IN - f22_IN - f23_IN - f24_IN - f25_IN)
    Cumulant_M121raw_IN = 1./Rho.*(f20_IN + f21_IN + f24_IN + f25_IN - f22_IN - f23_IN - f26_IN - f27_IN)
    Cumulant_M112raw_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN - f24_IN - f25_IN - f26_IN - f27_IN)
    Cumulant_M220raw_IN = 1./Rho.*(f08_IN + f09_IN + f10_IN + f11_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M202raw_IN = 1./Rho.*(f12_IN + f13_IN + f14_IN + f15_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M022raw_IN = 1./Rho.*(f16_IN + f17_IN + f18_IN + f19_IN + f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    Cumulant_M221raw_IN = 1./Rho.*(f20_IN + f23_IN + f24_IN + f27_IN - f21_IN - f22_IN - f25_IN - f26_IN)
    Cumulant_M212raw_IN = 1./Rho.*(f20_IN + f22_IN + f25_IN + f27_IN - f21_IN - f23_IN - f24_IN - f26_IN)
    Cumulant_M122raw_IN = 1./Rho.*(f20_IN + f22_IN + f24_IN + f26_IN - f21_IN - f23_IN - f25_IN - f27_IN)
    Cumulant_M222raw_IN = 1./Rho.*(f20_IN + f21_IN + f22_IN + f23_IN + f24_IN + f25_IN + f26_IN + f27_IN)
    # Construct input block -  from raw moment space to central moment space
    Cumulant_M000central_IN = Cumulant_M000raw_IN.*1
    Cumulant_M100central_IN = zeros(Nx, Ny, Nz)
    Cumulant_M010central_IN = zeros(Nx, Ny, Nz)
    Cumulant_M001central_IN = zeros(Nx, Ny, Nz)
    Cumulant_M110central_IN = Cumulant_M110raw_IN - Cumulant_M100raw_IN.*Cumulant_M010raw_IN
    Cumulant_M101central_IN = Cumulant_M101raw_IN - Cumulant_M100raw_IN.*Cumulant_M001raw_IN
    Cumulant_M011central_IN = Cumulant_M011raw_IN - Cumulant_M010raw_IN.*Cumulant_M001raw_IN
    Cumulant_M200central_IN = Cumulant_M200raw_IN - (Cumulant_M100raw_IN.^2)
    Cumulant_M020central_IN = Cumulant_M020raw_IN - (Cumulant_M010raw_IN.^2)
    Cumulant_M002central_IN = Cumulant_M002raw_IN - (Cumulant_M001raw_IN.^2)
    Cumulant_M111central_IN = Cumulant_M111raw_IN - (Cumulant_M011central_IN.*Cumulant_M100raw_IN + Cumulant_M101central_IN.*Cumulant_M010raw_IN + Cumulant_M110central_IN.*Cumulant_M001raw_IN + Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN)
    Cumulant_M210central_IN = Cumulant_M210raw_IN - (Cumulant_M200central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M100raw_IN + (Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN)
    Cumulant_M201central_IN = Cumulant_M201raw_IN - (Cumulant_M200central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M101central_IN.*Cumulant_M100raw_IN + (Cumulant_M100raw_IN.^2).*Cumulant_M001raw_IN)
    Cumulant_M120central_IN = Cumulant_M120raw_IN - (Cumulant_M020central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M010raw_IN + Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2))
    Cumulant_M102central_IN = Cumulant_M102raw_IN - (Cumulant_M002central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M101central_IN.*Cumulant_M001raw_IN + Cumulant_M100raw_IN.*(Cumulant_M001raw_IN.^2))
    Cumulant_M021central_IN = Cumulant_M021raw_IN - (Cumulant_M020central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M011central_IN.*Cumulant_M010raw_IN + (Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN)
    Cumulant_M012central_IN = Cumulant_M012raw_IN - (Cumulant_M002central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M011central_IN.*Cumulant_M001raw_IN + Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2))
    Cumulant_M211central_IN = Cumulant_M211raw_IN - (Cumulant_M210central_IN.*Cumulant_M001raw_IN + Cumulant_M201central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M111central_IN.*Cumulant_M100raw_IN + Cumulant_M200central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M101central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M011central_IN.*(Cumulant_M100raw_IN.^2) + (Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN.*Cumulant_M001raw_IN)
    Cumulant_M121central_IN = Cumulant_M121raw_IN - (Cumulant_M120central_IN.*Cumulant_M001raw_IN + Cumulant_M021central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M111central_IN.*Cumulant_M010raw_IN + Cumulant_M020central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M011central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M101central_IN.*(Cumulant_M010raw_IN.^2) + Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN)
    Cumulant_M112central_IN = Cumulant_M112raw_IN - (Cumulant_M102central_IN.*Cumulant_M010raw_IN + Cumulant_M012central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M111central_IN.*Cumulant_M001raw_IN + Cumulant_M002central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M101central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M011central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + Cumulant_M110central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2))
    Cumulant_M220central_IN = Cumulant_M220raw_IN - (2.*Cumulant_M210central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M120central_IN.*Cumulant_M100raw_IN + 4.*Cumulant_M110central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M200central_IN.*(Cumulant_M010raw_IN.^2) + Cumulant_M020central_IN.*(Cumulant_M100raw_IN.^2) + (Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2))
    Cumulant_M202central_IN = Cumulant_M202raw_IN - (2.*Cumulant_M201central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M102central_IN.*Cumulant_M100raw_IN + 4.*Cumulant_M101central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + Cumulant_M200central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M002central_IN.*(Cumulant_M100raw_IN.^2) + (Cumulant_M100raw_IN.^2).*(Cumulant_M001raw_IN.^2))
    Cumulant_M022central_IN = Cumulant_M022raw_IN - (2.*Cumulant_M021central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M012central_IN.*Cumulant_M010raw_IN + 4.*Cumulant_M011central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + Cumulant_M020central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M002central_IN.*(Cumulant_M010raw_IN.^2) + (Cumulant_M010raw_IN.^2).*(Cumulant_M001raw_IN.^2))
    Cumulant_M221central_IN = Cumulant_M221raw_IN - (Cumulant_M220central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M211central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M121central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M210central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M120central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + Cumulant_M201central_IN.*(Cumulant_M010raw_IN.^2) + Cumulant_M021central_IN.*(Cumulant_M100raw_IN.^2) + 4.*Cumulant_M111central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M200central_IN.*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN + Cumulant_M020central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M001raw_IN + 4.*Cumulant_M110central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M101central_IN.*Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2) + 2.*Cumulant_M011central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN + (Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN)
    Cumulant_M212central_IN = Cumulant_M212raw_IN - (Cumulant_M202central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M211central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M112central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M201central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M102central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M210central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M012central_IN.*(Cumulant_M100raw_IN.^2) + 4.*Cumulant_M111central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + Cumulant_M200central_IN.*Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M002central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN + 4.*Cumulant_M101central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M100raw_IN.*(Cumulant_M001raw_IN.^2) + 2.*Cumulant_M011central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M001raw_IN + (Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2).*Cumulant_M010raw_IN)
    Cumulant_M122central_IN = Cumulant_M122raw_IN - (Cumulant_M022central_IN.*Cumulant_M100raw_IN + 2.*Cumulant_M121central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M112central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M021central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M012central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + Cumulant_M120central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M102central_IN.*(Cumulant_M010raw_IN.^2) + 4.*Cumulant_M111central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + Cumulant_M020central_IN.*Cumulant_M100raw_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M002central_IN.*Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2) + 4.*Cumulant_M011central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M110central_IN.*Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2) + 2.*Cumulant_M101central_IN.*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN + (Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2).*Cumulant_M100raw_IN)
    Cumulant_M222central_IN = Cumulant_M222raw_IN - (2.*Cumulant_M221central_IN.*Cumulant_M001raw_IN + 2.*Cumulant_M212central_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M122central_IN.*Cumulant_M100raw_IN + Cumulant_M220central_IN.*(Cumulant_M001raw_IN.^2) + Cumulant_M202central_IN.*(Cumulant_M010raw_IN.^2) + Cumulant_M022central_IN.*(Cumulant_M100raw_IN.^2) + 4.*Cumulant_M211central_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + 4.*Cumulant_M121central_IN.*Cumulant_M100raw_IN.*Cumulant_M001raw_IN + 4.*Cumulant_M112central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN + 2.*Cumulant_M210central_IN.*Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2) + 2.*Cumulant_M201central_IN.*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN + 2.*Cumulant_M120central_IN.*Cumulant_M100raw_IN.*(Cumulant_M001raw_IN.^2) + 2.*Cumulant_M102central_IN.*Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2) + 2.*Cumulant_M021central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M001raw_IN + 2.*Cumulant_M012central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN + 8.*Cumulant_M111central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + Cumulant_M200central_IN.*(Cumulant_M010raw_IN.^2).*(Cumulant_M001raw_IN.^2) + Cumulant_M020central_IN.*(Cumulant_M100raw_IN.^2).*(Cumulant_M001raw_IN.^2) + Cumulant_M002central_IN.*(Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2) + 4.*Cumulant_M110central_IN.*Cumulant_M100raw_IN.*Cumulant_M010raw_IN.*(Cumulant_M001raw_IN.^2) + 4.*Cumulant_M101central_IN.*Cumulant_M100raw_IN.*(Cumulant_M010raw_IN.^2).*Cumulant_M001raw_IN + 4.*Cumulant_M011central_IN.*(Cumulant_M100raw_IN.^2).*Cumulant_M010raw_IN.*Cumulant_M001raw_IN + (Cumulant_M100raw_IN.^2).*(Cumulant_M010raw_IN.^2).*(Cumulant_M001raw_IN.^2))
    # Construct input block - from central moment space to cumulant space
    Cumulant_M000_IN = Cumulant_M000central_IN.*1
    Cumulant_M100_IN = Cumulant_M100central_IN.*1
    Cumulant_M010_IN = Cumulant_M010central_IN.*1
    Cumulant_M001_IN = Cumulant_M001central_IN.*1
    Cumulant_M110_IN = Cumulant_M110central_IN.*1
    Cumulant_M101_IN = Cumulant_M101central_IN.*1
    Cumulant_M011_IN = Cumulant_M011central_IN.*1
    Cumulant_M200_IN = Cumulant_M200central_IN.*1
    Cumulant_M020_IN = Cumulant_M020central_IN.*1
    Cumulant_M002_IN = Cumulant_M002central_IN.*1
    Cumulant_M111_IN = Cumulant_M111central_IN.*1
    Cumulant_M210_IN = Cumulant_M210central_IN.*1
    Cumulant_M201_IN = Cumulant_M201central_IN.*1
    Cumulant_M120_IN = Cumulant_M120central_IN.*1
    Cumulant_M102_IN = Cumulant_M102central_IN.*1
    Cumulant_M021_IN = Cumulant_M021central_IN.*1
    Cumulant_M012_IN = Cumulant_M012central_IN.*1
    Cumulant_M211_IN = Cumulant_M211central_IN - Cumulant_M200central_IN.*Cumulant_M011central_IN - 2.*Cumulant_M110central_IN.*Cumulant_M101central_IN
    Cumulant_M121_IN = Cumulant_M121central_IN - Cumulant_M020central_IN.*Cumulant_M101central_IN - 2.*Cumulant_M110central_IN.*Cumulant_M011central_IN
    Cumulant_M112_IN = Cumulant_M112central_IN - Cumulant_M002central_IN.*Cumulant_M110central_IN - 2.*Cumulant_M101central_IN.*Cumulant_M011central_IN
    Cumulant_M220_IN = Cumulant_M220central_IN - Cumulant_M200central_IN.*Cumulant_M020central_IN - 2.*(Cumulant_M110central_IN.^2)
    Cumulant_M202_IN = Cumulant_M202central_IN - Cumulant_M200central_IN.*Cumulant_M002central_IN - 2.*(Cumulant_M101central_IN.^2)
    Cumulant_M022_IN = Cumulant_M022central_IN - Cumulant_M020central_IN.*Cumulant_M002central_IN - 2.*(Cumulant_M011central_IN.^2)
    Cumulant_M221_IN = Cumulant_M221central_IN - Cumulant_M200central_IN.*Cumulant_M021central_IN - Cumulant_M020central_IN.*Cumulant_M201central_IN - 4.*Cumulant_M110central_IN.*Cumulant_M111central_IN - 2.*(Cumulant_M120central_IN.*Cumulant_M101central_IN + Cumulant_M210central_IN.*Cumulant_M011central_IN)
    Cumulant_M212_IN = Cumulant_M212central_IN - Cumulant_M200central_IN.*Cumulant_M012central_IN - Cumulant_M002central_IN.*Cumulant_M210central_IN - 4.*Cumulant_M101central_IN.*Cumulant_M111central_IN - 2.*(Cumulant_M102central_IN.*Cumulant_M110central_IN + Cumulant_M201central_IN.*Cumulant_M011central_IN)
    Cumulant_M122_IN = Cumulant_M122central_IN - Cumulant_M020central_IN.*Cumulant_M102central_IN - Cumulant_M002central_IN.*Cumulant_M120central_IN - 4.*Cumulant_M011central_IN.*Cumulant_M111central_IN - 2.*(Cumulant_M012central_IN.*Cumulant_M110central_IN + Cumulant_M021central_IN.*Cumulant_M101central_IN)
    Cumulant_M222_IN = Cumulant_M222central_IN - 4.*(Cumulant_M111central_IN.^2) - Cumulant_M200central_IN.*Cumulant_M022central_IN - Cumulant_M020central_IN.*Cumulant_M202central_IN - Cumulant_M002central_IN.*Cumulant_M220central_IN - 4.*(Cumulant_M211central_IN.*Cumulant_M011central_IN + Cumulant_M121central_IN.*Cumulant_M101central_IN + Cumulant_M112central_IN.*Cumulant_M110central_IN) - 2.*(Cumulant_M210central_IN.*Cumulant_M012central_IN + Cumulant_M201central_IN.*Cumulant_M021central_IN + Cumulant_M120central_IN.*Cumulant_M102central_IN) + 16.*Cumulant_M110central_IN.*Cumulant_M101central_IN.*Cumulant_M011central_IN + 4.*((Cumulant_M110central_IN.^2).*Cumulant_M002central_IN + (Cumulant_M101central_IN.^2).*Cumulant_M020central_IN + (Cumulant_M011central_IN.^2).*Cumulant_M200central_IN) + 2.*Cumulant_M200central_IN.*Cumulant_M020central_IN.*Cumulant_M002central_IN
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
    if Cumulant_First_Order_Velocity_Derivatives == 1
      Dx_Ux = - Cumulant_Omega[1]./(2.*Rho).*(2.*Cumulant_M200_IN - Cumulant_M020_IN - Cumulant_M002_IN) - Cumulant_Omega[2]./(2.*Rho).*(Cumulant_Esecondorder_IN - Cumulant_M000_IN)
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
      Dxx_Ux = zeros(Nx, Ny, Nz)
      Dyy_Uy = zeros(Nx, Ny, Nz)
      Dzz_Uz = zeros(Nx, Ny, Nz)
      for i = 2:(Nx - 1)
        for j = 2:(Ny - 1)
          for k = 2:(Nz - 1)
            Dxx_Ux[i, j, k] = (Dx_Ux[i + 1, j, k] - Dx_Ux[i - 1, j, k])./2
            Dyy_Uy[i, j, k] = (Dy_Uy[i, j + 1, k] - Dy_Uy[i, j - 1, k])./2
            Dzz_Uz[i, j, k] = (Dz_Uz[i, j, k + 1] - Dz_Uz[i, j, k - 1])./2
          end
        end
      end
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
    Cumulant_M000_OUT = Cumulant_M000_IN.*1
    Cumulant_M100_OUT = Cumulant_M100_IN.*1
    Cumulant_M010_OUT = Cumulant_M010_IN.*1
    Cumulant_M001_OUT = Cumulant_M001_IN.*1
    Cumulant_M110_OUT = (1 - Cumulant_Omega[1]).*Cumulant_M110_IN
    Cumulant_M101_OUT = (1 - Cumulant_Omega[1]).*Cumulant_M101_IN
    Cumulant_M011_OUT = (1 - Cumulant_Omega[1]).*Cumulant_M011_IN
    Cumulant_Nsecondorder_xy_OUT = (1 - Cumulant_Omega[1]).*Cumulant_Nsecondorder_xy_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[1]).*Combined_Cumulant_FirstDerivatives_xy.*Cumulant_First_Order_Velocity_Derivatives + 2.*Rho.*Cumulant_Omega[1].*((((1./Cumulant_Omega[1]) - 1/2).^2) - 1/12).*Combined_Cumulant_SecondDerivatives_xy.*Cumulant_Second_Order_Velocity_Derivatives
    Cumulant_Nsecondorder_xz_OUT = (1 - Cumulant_Omega[1]).*Cumulant_Nsecondorder_xz_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[1]).*Combined_Cumulant_FirstDerivatives_xz.*Cumulant_First_Order_Velocity_Derivatives + 2.*Rho.*Cumulant_Omega[1].*((((1./Cumulant_Omega[1]) - 1/2).^2) - 1/12).*Combined_Cumulant_SecondDerivatives_xz.*Cumulant_Second_Order_Velocity_Derivatives
    Cumulant_Esecondorder_OUT = Cumulant_M000_IN.*Cumulant_Omega[2] + (1 - Cumulant_Omega[2]).*Cumulant_Esecondorder_IN - 3.*Rho.*(1 - 1/2.*Cumulant_Omega[2]).*Combined_Cumulant_FirstDerivatives_xyz1.*Cumulant_First_Order_Velocity_Derivatives + (1./(3.*Cumulant_Omega[1])).*(6 - 3.*(Cumulant_Omega[1] + Cumulant_Omega[2]) + Cumulant_Omega[1].*Cumulant_Omega[2]).*Combined_Cumulant_SecondDerivatives_xyz.*Cumulant_Second_Order_Velocity_Derivatives
    Cumulant_Qthirdorder1_OUT = (1 - Cumulant_Omega[3]).*Cumulant_Qthirdorder1_IN
    Cumulant_Qthirdorder2_OUT = (1 - Cumulant_Omega[3]).*Cumulant_Qthirdorder2_IN
    Cumulant_Qthirdorder3_OUT = (1 - Cumulant_Omega[3]).*Cumulant_Qthirdorder3_IN
    Cumulant_Qthirdorder4_OUT = (1 - Cumulant_Omega[4]).*Cumulant_Qthirdorder4_IN
    Cumulant_Qthirdorder5_OUT = (1 - Cumulant_Omega[4]).*Cumulant_Qthirdorder5_IN
    Cumulant_Qthirdorder6_OUT = (1 - Cumulant_Omega[4]).*Cumulant_Qthirdorder6_IN
    Cumulant_M111_OUT = (1 - Cumulant_Omega[5]).*Cumulant_M111_IN
    Cumulant_Afourthorder1_OUT = (1 - Cumulant_Omega[6]).*Cumulant_Afourthorder1_IN + 2./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[6].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz2
    Cumulant_Afourthorder2_OUT = (1 - Cumulant_Omega[6]).*Cumulant_Afourthorder2_IN + 2./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[6].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz3
    Cumulant_Afourthorder3_OUT = (1 - Cumulant_Omega[7]).*Cumulant_Afourthorder3_IN - 4./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[7].*Cumulant_Parameter_A.*Rho.*Combined_Cumulant_FirstDerivatives_xyz4
    Cumulant_M211_OUT = (1 - Cumulant_Omega[8]).*Cumulant_M221_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dy_Uz_Dz_Uy
    Cumulant_M121_OUT = (1 - Cumulant_Omega[8]).*Cumulant_M121_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dx_Uz_Dz_Ux
    Cumulant_M112_OUT = (1 - Cumulant_Omega[8]).*Cumulant_M112_IN - 1./3.*((1./Cumulant_Omega[1]) - 1/2).*Cumulant_Omega[8].*Cumulant_Parameter_B.*Dx_Uy_Dy_Ux
    Cumulant_M221_OUT = (1 - Cumulant_Omega[9]).*Cumulant_M221_IN
    Cumulant_M212_OUT = (1 - Cumulant_Omega[9]).*Cumulant_M212_IN
    Cumulant_M122_OUT = (1 - Cumulant_Omega[9]).*Cumulant_M122_IN
    Cumulant_M222_OUT = (1 - Cumulant_Omega[10]).*Cumulant_M222_IN
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
    Cumulant_M000central_OUT = Cumulant_M000_OUT.*1
    Cumulant_M100central_OUT = Cumulant_M100_OUT.*1
    Cumulant_M010central_OUT = Cumulant_M010_OUT.*1
    Cumulant_M001central_OUT = Cumulant_M001_OUT.*1
    Cumulant_M110central_OUT = Cumulant_M110_OUT.*1
    Cumulant_M101central_OUT = Cumulant_M101_OUT.*1
    Cumulant_M011central_OUT = Cumulant_M011_OUT.*1
    Cumulant_M200central_OUT = Cumulant_M200_OUT.*1
    Cumulant_M020central_OUT = Cumulant_M020_OUT.*1
    Cumulant_M002central_OUT = Cumulant_M002_OUT.*1
    Cumulant_M111central_OUT = Cumulant_M111_OUT.*1
    Cumulant_M210central_OUT = Cumulant_M210_OUT.*1
    Cumulant_M201central_OUT = Cumulant_M201_OUT.*1
    Cumulant_M120central_OUT = Cumulant_M120_OUT.*1
    Cumulant_M102central_OUT = Cumulant_M102_OUT.*1
    Cumulant_M021central_OUT = Cumulant_M021_OUT.*1
    Cumulant_M012central_OUT = Cumulant_M012_OUT.*1
    Cumulant_M211central_OUT = Cumulant_M211_OUT + Cumulant_M200central_OUT.*Cumulant_M011central_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M101central_OUT
    Cumulant_M121central_OUT = Cumulant_M121_OUT + Cumulant_M020central_OUT.*Cumulant_M101central_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M011central_OUT
    Cumulant_M112central_OUT = Cumulant_M112_OUT + Cumulant_M002central_OUT.*Cumulant_M110central_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M011central_OUT
    Cumulant_M220central_OUT = Cumulant_M220_OUT + Cumulant_M200central_OUT.*Cumulant_M020central_OUT + 2.*(Cumulant_M110central_OUT.^2)
    Cumulant_M202central_OUT = Cumulant_M202_OUT + Cumulant_M200central_OUT.*Cumulant_M002central_OUT + 2.*(Cumulant_M101central_OUT.^2)
    Cumulant_M022central_OUT = Cumulant_M022_OUT + Cumulant_M020central_OUT.*Cumulant_M002central_OUT + 2.*(Cumulant_M011central_OUT.^2)
    Cumulant_M221central_OUT = Cumulant_M221_OUT + Cumulant_M200central_OUT.*Cumulant_M021central_OUT + Cumulant_M020central_OUT.*Cumulant_M201central_OUT + 4.*Cumulant_M110central_OUT.*Cumulant_M111central_OUT + 2.*(Cumulant_M120central_OUT.*Cumulant_M101central_OUT + Cumulant_M210central_OUT.*Cumulant_M011central_OUT)
    Cumulant_M212central_OUT = Cumulant_M212_OUT + Cumulant_M200central_OUT.*Cumulant_M012central_OUT + Cumulant_M002central_OUT.*Cumulant_M210central_OUT + 4.*Cumulant_M101central_OUT.*Cumulant_M111central_OUT + 2.*(Cumulant_M102central_OUT.*Cumulant_M110central_OUT + Cumulant_M201central_OUT.*Cumulant_M011central_OUT)
    Cumulant_M122central_OUT = Cumulant_M122_OUT + Cumulant_M020central_OUT.*Cumulant_M102central_OUT + Cumulant_M002central_OUT.*Cumulant_M120central_OUT + 4.*Cumulant_M011central_OUT.*Cumulant_M111central_OUT + 2.*(Cumulant_M012central_OUT.*Cumulant_M110central_OUT + Cumulant_M021central_OUT.*Cumulant_M101central_OUT)
    Cumulant_M222central_OUT = Cumulant_M222_OUT + (4.*(Cumulant_M111central_OUT.^2) + Cumulant_M200central_OUT.*Cumulant_M022central_OUT + Cumulant_M020central_OUT.*Cumulant_M202central_OUT + Cumulant_M002central_OUT.*Cumulant_M220central_OUT + 4.*(Cumulant_M211central_OUT.*Cumulant_M011central_OUT + Cumulant_M121central_OUT.*Cumulant_M101central_OUT + Cumulant_M112central_OUT.*Cumulant_M110central_OUT) + 2.*(Cumulant_M210central_OUT.*Cumulant_M012central_OUT + Cumulant_M201central_OUT.*Cumulant_M021central_OUT + Cumulant_M120central_OUT.*Cumulant_M102central_OUT)) - 16.*Cumulant_M110central_OUT.*Cumulant_M101central_OUT.*Cumulant_M011central_OUT - 4.*((Cumulant_M110central_OUT.^2).*Cumulant_M002central_OUT + (Cumulant_M101central_OUT.^2).*Cumulant_M020central_OUT + (Cumulant_M011central_OUT.^2).*Cumulant_M200central_OUT) -  2.*Cumulant_M200central_OUT.*Cumulant_M020central_OUT.*Cumulant_M002central_OUT
    # Construct output block - from central moment space to raw moment space
    Cumulant_M000raw_OUT = ones(Nx, Ny, Nz)
    Cumulant_M100raw_OUT = Ux.*1
    Cumulant_M010raw_OUT = Uy.*1
    Cumulant_M001raw_OUT = Uz.*1
    Cumulant_M110raw_OUT = Cumulant_M110central_OUT + Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT
    Cumulant_M101raw_OUT = Cumulant_M101central_OUT + Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT
    Cumulant_M011raw_OUT = Cumulant_M011central_OUT + Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT
    Cumulant_M200raw_OUT = Cumulant_M200central_OUT + (Cumulant_M100raw_OUT.^2)
    Cumulant_M020raw_OUT = Cumulant_M020central_OUT + (Cumulant_M010raw_OUT.^2)
    Cumulant_M002raw_OUT = Cumulant_M002central_OUT + (Cumulant_M001raw_OUT.^2)
    Cumulant_M111raw_OUT = Cumulant_M111central_OUT + (Cumulant_M011central_OUT.*Cumulant_M100raw_OUT + Cumulant_M101central_OUT.*Cumulant_M010raw_OUT + Cumulant_M110central_OUT.*Cumulant_M001raw_OUT + Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT)
    Cumulant_M210raw_OUT = Cumulant_M210central_OUT + (Cumulant_M200central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT + (Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT)
    Cumulant_M201raw_OUT = Cumulant_M201central_OUT + (Cumulant_M200central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT + (Cumulant_M100raw_OUT.^2).*Cumulant_M001raw_OUT)
    Cumulant_M120raw_OUT = Cumulant_M120central_OUT + (Cumulant_M020central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M010raw_OUT + Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2))
    Cumulant_M102raw_OUT = Cumulant_M102central_OUT + (Cumulant_M002central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M001raw_OUT + Cumulant_M100raw_OUT.*(Cumulant_M001raw_OUT.^2))
    Cumulant_M021raw_OUT = Cumulant_M021central_OUT + (Cumulant_M020central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M011central_OUT.*Cumulant_M010raw_OUT + (Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT)
    Cumulant_M012raw_OUT = Cumulant_M012central_OUT + (Cumulant_M002central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M011central_OUT.*Cumulant_M001raw_OUT + Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2))
    Cumulant_M211raw_OUT = Cumulant_M211central_OUT + (Cumulant_M210central_OUT.*Cumulant_M001raw_OUT + Cumulant_M201central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M111central_OUT.*Cumulant_M100raw_OUT + Cumulant_M200central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M011central_OUT.*(Cumulant_M100raw_OUT.^2) + (Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT)
    Cumulant_M121raw_OUT = Cumulant_M121central_OUT + (Cumulant_M120central_OUT.*Cumulant_M001raw_OUT + Cumulant_M021central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M111central_OUT.*Cumulant_M010raw_OUT + Cumulant_M020central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M011central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M101central_OUT.*(Cumulant_M010raw_OUT.^2) + Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT)
    Cumulant_M112raw_OUT = Cumulant_M112central_OUT + (Cumulant_M102central_OUT.*Cumulant_M010raw_OUT + Cumulant_M012central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M111central_OUT.*Cumulant_M001raw_OUT + Cumulant_M002central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M011central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M110central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2))
    Cumulant_M220raw_OUT = Cumulant_M220central_OUT + (2.*Cumulant_M210central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M120central_OUT.*Cumulant_M100raw_OUT + 4.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M200central_OUT.*(Cumulant_M010raw_OUT.^2) + Cumulant_M020central_OUT.*(Cumulant_M100raw_OUT.^2) + (Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2))
    Cumulant_M202raw_OUT = Cumulant_M202central_OUT + (2.*Cumulant_M201central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M102central_OUT.*Cumulant_M100raw_OUT + 4.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M200central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M002central_OUT.*(Cumulant_M100raw_OUT.^2) + (Cumulant_M100raw_OUT.^2).*(Cumulant_M001raw_OUT.^2))
    Cumulant_M022raw_OUT = Cumulant_M022central_OUT + (2.*Cumulant_M021central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M012central_OUT.*Cumulant_M010raw_OUT + 4.*Cumulant_M011central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M020central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M002central_OUT.*(Cumulant_M010raw_OUT.^2) + (Cumulant_M010raw_OUT.^2).*(Cumulant_M001raw_OUT.^2))
    Cumulant_M221raw_OUT = Cumulant_M221central_OUT + (Cumulant_M220central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M211central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M121central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M210central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M120central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M201central_OUT.*(Cumulant_M010raw_OUT.^2) + Cumulant_M021central_OUT.*(Cumulant_M100raw_OUT.^2) + 4.*Cumulant_M111central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M200central_OUT.*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT + Cumulant_M020central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M001raw_OUT + 4.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2) + 2.*Cumulant_M011central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT + (Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT)
    Cumulant_M212raw_OUT = Cumulant_M212central_OUT + (Cumulant_M202central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M211central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M112central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M201central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M102central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M210central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M012central_OUT.*(Cumulant_M100raw_OUT.^2) + 4.*Cumulant_M111central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M200central_OUT.*Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M002central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT + 4.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M001raw_OUT.^2) + 2.*Cumulant_M011central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M001raw_OUT + (Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2).*Cumulant_M010raw_OUT)
    Cumulant_M122raw_OUT = Cumulant_M122central_OUT + (Cumulant_M022central_OUT.*Cumulant_M100raw_OUT + 2.*Cumulant_M121central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M112central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M021central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M012central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + Cumulant_M120central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M102central_OUT.*(Cumulant_M010raw_OUT.^2) + 4.*Cumulant_M111central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M020central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M002central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2) + 4.*Cumulant_M011central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M110central_OUT.*Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2) + 2.*Cumulant_M101central_OUT.*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT + (Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2).*Cumulant_M100raw_OUT)
    Cumulant_M222raw_OUT = Cumulant_M222central_OUT + (2.*Cumulant_M221central_OUT.*Cumulant_M001raw_OUT + 2.*Cumulant_M212central_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M122central_OUT.*Cumulant_M100raw_OUT + Cumulant_M220central_OUT.*(Cumulant_M001raw_OUT.^2) + Cumulant_M202central_OUT.*(Cumulant_M010raw_OUT.^2) + Cumulant_M022central_OUT.*(Cumulant_M100raw_OUT.^2) + 4.*Cumulant_M211central_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + 4.*Cumulant_M121central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M001raw_OUT + 4.*Cumulant_M112central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT + 2.*Cumulant_M210central_OUT.*Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2) + 2.*Cumulant_M201central_OUT.*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT + 2.*Cumulant_M120central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M001raw_OUT.^2) + 2.*Cumulant_M102central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2) + 2.*Cumulant_M021central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M001raw_OUT + 2.*Cumulant_M012central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT + 8.*Cumulant_M111central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + Cumulant_M200central_OUT.*(Cumulant_M010raw_OUT.^2).*(Cumulant_M001raw_OUT.^2) + Cumulant_M020central_OUT.*(Cumulant_M100raw_OUT.^2).*(Cumulant_M001raw_OUT.^2) + Cumulant_M002central_OUT.*(Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2) + 4.*Cumulant_M110central_OUT.*Cumulant_M100raw_OUT.*Cumulant_M010raw_OUT.*(Cumulant_M001raw_OUT.^2) + 4.*Cumulant_M101central_OUT.*Cumulant_M100raw_OUT.*(Cumulant_M010raw_OUT.^2).*Cumulant_M001raw_OUT + 4.*Cumulant_M011central_OUT.*(Cumulant_M100raw_OUT.^2).*Cumulant_M010raw_OUT.*Cumulant_M001raw_OUT + (Cumulant_M100raw_OUT.^2).*(Cumulant_M010raw_OUT.^2).*(Cumulant_M001raw_OUT.^2))
    # Output block - from raw moment space to velocity space
    f01_OUT = Rho.*(Cumulant_M000raw_OUT - Cumulant_M200raw_OUT - Cumulant_M020raw_OUT - Cumulant_M002raw_OUT + Cumulant_M220raw_OUT + Cumulant_M202raw_OUT + Cumulant_M022raw_OUT - Cumulant_M222raw_OUT)
    f02_OUT = 1./2.*Rho.*(Cumulant_M100raw_OUT + Cumulant_M200raw_OUT - Cumulant_M120raw_OUT - Cumulant_M102raw_OUT - Cumulant_M220raw_OUT - Cumulant_M202raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f03_OUT = 1./2.*Rho.*( - Cumulant_M100raw_OUT + Cumulant_M200raw_OUT + Cumulant_M120raw_OUT + Cumulant_M102raw_OUT - Cumulant_M220raw_OUT - Cumulant_M202raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f04_OUT = 1./2.*Rho.*(Cumulant_M010raw_OUT + Cumulant_M020raw_OUT - Cumulant_M210raw_OUT - Cumulant_M012raw_OUT - Cumulant_M220raw_OUT - Cumulant_M022raw_OUT + Cumulant_M212raw_OUT + Cumulant_M222raw_OUT)
    f05_OUT = 1./2.*Rho.*( - Cumulant_M010raw_OUT + Cumulant_M020raw_OUT + Cumulant_M210raw_OUT + Cumulant_M012raw_OUT - Cumulant_M220raw_OUT - Cumulant_M022raw_OUT - Cumulant_M212raw_OUT + Cumulant_M222raw_OUT)
    f06_OUT = 1./2.*Rho.*(Cumulant_M001raw_OUT + Cumulant_M002raw_OUT - Cumulant_M201raw_OUT - Cumulant_M021raw_OUT - Cumulant_M202raw_OUT - Cumulant_M022raw_OUT + Cumulant_M221raw_OUT + Cumulant_M222raw_OUT)
    f07_OUT = 1./2.*Rho.*( - Cumulant_M001raw_OUT + Cumulant_M002raw_OUT + Cumulant_M201raw_OUT + Cumulant_M021raw_OUT - Cumulant_M202raw_OUT - Cumulant_M022raw_OUT - Cumulant_M221raw_OUT + Cumulant_M222raw_OUT)
    f08_OUT = 1./4.*Rho.*(Cumulant_M110raw_OUT + Cumulant_M210raw_OUT + Cumulant_M120raw_OUT - Cumulant_M112raw_OUT + Cumulant_M220raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f09_OUT = 1./4.*Rho.*(Cumulant_M110raw_OUT - Cumulant_M210raw_OUT - Cumulant_M120raw_OUT - Cumulant_M112raw_OUT + Cumulant_M220raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f10_OUT = 1./4.*Rho.*( - Cumulant_M110raw_OUT - Cumulant_M210raw_OUT + Cumulant_M120raw_OUT + Cumulant_M112raw_OUT + Cumulant_M220raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f11_OUT = 1./4.*Rho.*( - Cumulant_M110raw_OUT + Cumulant_M210raw_OUT - Cumulant_M120raw_OUT + Cumulant_M112raw_OUT + Cumulant_M220raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f12_OUT = 1./4.*Rho.*(Cumulant_M101raw_OUT + Cumulant_M201raw_OUT + Cumulant_M102raw_OUT - Cumulant_M121raw_OUT + Cumulant_M202raw_OUT - Cumulant_M221raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f13_OUT = 1./4.*Rho.*(Cumulant_M101raw_OUT - Cumulant_M201raw_OUT - Cumulant_M102raw_OUT - Cumulant_M121raw_OUT + Cumulant_M202raw_OUT + Cumulant_M221raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f14_OUT = 1./4.*Rho.*( - Cumulant_M101raw_OUT - Cumulant_M201raw_OUT + Cumulant_M102raw_OUT + Cumulant_M121raw_OUT + Cumulant_M202raw_OUT + Cumulant_M221raw_OUT - Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f15_OUT = 1./4.*Rho.*( - Cumulant_M101raw_OUT + Cumulant_M201raw_OUT - Cumulant_M102raw_OUT + Cumulant_M121raw_OUT + Cumulant_M202raw_OUT - Cumulant_M221raw_OUT + Cumulant_M122raw_OUT - Cumulant_M222raw_OUT)
    f16_OUT = 1./4.*Rho.*(Cumulant_M011raw_OUT + Cumulant_M021raw_OUT + Cumulant_M012raw_OUT - Cumulant_M211raw_OUT + Cumulant_M022raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f17_OUT = 1./4.*Rho.*(Cumulant_M011raw_OUT - Cumulant_M021raw_OUT - Cumulant_M012raw_OUT - Cumulant_M211raw_OUT + Cumulant_M022raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f18_OUT = 1./4.*Rho.*( - Cumulant_M011raw_OUT - Cumulant_M021raw_OUT + Cumulant_M012raw_OUT + Cumulant_M211raw_OUT + Cumulant_M022raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f19_OUT = 1./4.*Rho.*( - Cumulant_M011raw_OUT + Cumulant_M021raw_OUT - Cumulant_M012raw_OUT + Cumulant_M211raw_OUT + Cumulant_M022raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M222raw_OUT)
    f20_OUT = 1./8.*Rho.*(Cumulant_M111raw_OUT + Cumulant_M211raw_OUT + Cumulant_M121raw_OUT + Cumulant_M112raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f21_OUT = 1./8.*Rho.*( - Cumulant_M111raw_OUT + Cumulant_M211raw_OUT + Cumulant_M121raw_OUT + Cumulant_M112raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f22_OUT = 1./8.*Rho.*( - Cumulant_M111raw_OUT - Cumulant_M211raw_OUT - Cumulant_M121raw_OUT + Cumulant_M112raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f23_OUT = 1./8.*Rho.*(Cumulant_M111raw_OUT - Cumulant_M211raw_OUT - Cumulant_M121raw_OUT + Cumulant_M112raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f24_OUT = 1./8.*Rho.*( - Cumulant_M111raw_OUT - Cumulant_M211raw_OUT + Cumulant_M121raw_OUT - Cumulant_M112raw_OUT + Cumulant_M221raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f25_OUT = 1./8.*Rho.*(Cumulant_M111raw_OUT - Cumulant_M211raw_OUT + Cumulant_M121raw_OUT - Cumulant_M112raw_OUT - Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f26_OUT = 1./8.*Rho.*(Cumulant_M111raw_OUT + Cumulant_M211raw_OUT - Cumulant_M121raw_OUT - Cumulant_M112raw_OUT - Cumulant_M221raw_OUT - Cumulant_M212raw_OUT + Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
    f27_OUT = 1./8.*Rho.*( - Cumulant_M111raw_OUT + Cumulant_M211raw_OUT - Cumulant_M121raw_OUT - Cumulant_M112raw_OUT + Cumulant_M221raw_OUT + Cumulant_M212raw_OUT - Cumulant_M122raw_OUT + Cumulant_M222raw_OUT)
  end
  if (Collision_Model != "SRT_LBM") && (Collision_Model != "TRT_LBM") && (Collision_Model != "MRT_LBM") && (Collision_Model != "CMRT_LBM") && (Collision_Model != "Cumulant_LBM")
    Cycle = Maximum_Iterations - 1
    println("NOT A VALID INPUT FOR TO COLLISION MODEL")
  end

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # BOUNCE BACK ROUTINE (first order accuracy)
  for i = Gx
    for j = Gy
      for k = Gz
        if (Obstacle[i, j, k] == 1) || (Wall[i, j, k] == 1)
          f02_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f03_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f03_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f02_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f04_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f05_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f05_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f04_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f06_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f07_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f07_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f06_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f08_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f09_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f09_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f08_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f10_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f11_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f11_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f10_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f12_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f13_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f13_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f12_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f14_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f15_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f15_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f14_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f16_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f17_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f17_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f16_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f18_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f19_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f19_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f18_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f20_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f21_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f21_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f20_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f22_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f23_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f23_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f22_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f24_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f25_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f25_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f24_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f26_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f27_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
          f27_OUT[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])] = f26_IN[Int64(BBR_Indices_i[i, j, k]), Int64(BBR_Indices_j[i, j, k]), Int64(BBR_Indices_k[i, j, k])]
        end
      end
    end
  end

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # FORCE ESTIMATION STEP
  if (mod(Cycle + 1, Force_Plot) == 1) || (Cycle == 1)
    println(" ")
    println("Force Computation Plot (Momentum Exchange Method) = ", Cycle)
    println(" ")
    for i = 2:(Nx - 1)
      for j = 2:(Ny - 1)
        for k = 2:(Nz - 1)
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f02_OUT[i, j, k] + f03_OUT[i + 1, j, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f03_OUT[i, j, k] - f02_OUT[i - 1, j, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + 1, k] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f04_OUT[i, j, k] + f05_OUT[i, j + 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - 1, k] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f05_OUT[i, j, k] - f04_OUT[i, j - 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j, k + 1] == 1)
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f06_OUT[i, j, k] + f07_OUT[i, j, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j, k - 1] == 1)
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f07_OUT[i, j, k] - f06_OUT[i, j, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j + 1, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f08_OUT[i, j, k] + f09_OUT[i + 1, j + 1, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f08_OUT[i, j, k] + f09_OUT[i + 1, j + 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j - 1, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f09_OUT[i, j, k] - f08_OUT[i - 1, j - 1, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f09_OUT[i, j, k] - f08_OUT[i - 1, j - 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j - 1, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f10_OUT[i, j, k] + f11_OUT[i + 1, j - 1, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f10_OUT[i, j, k] - f11_OUT[i + 1, j - 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j + 1, k] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f11_OUT[i, j, k] - f10_OUT[i - 1, j + 1, k]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f11_OUT[i, j, k] + f10_OUT[i - 1, j + 1, k]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f12_OUT[i, j, k] + f13_OUT[i + 1, j, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f12_OUT[i, j, k] + f13_OUT[i + 1, j, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f13_OUT[i, j, k] - f12_OUT[i - 1, j, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f13_OUT[i, j, k] - f12_OUT[i - 1, j, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f14_OUT[i, j, k] + f15_OUT[i + 1, j, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f14_OUT[i, j, k] - f15_OUT[i + 1, j, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f15_OUT[i, j, k] - f14_OUT[i - 1, j, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f15_OUT[i, j, k] + f14_OUT[i - 1, j, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + 1, k + 1] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f16_OUT[i, j, k] + f17_OUT[i, j + 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f16_OUT[i, j, k] + f17_OUT[i, j + 1, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - 1, k - 1] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f17_OUT[i, j, k] - f16_OUT[i, j - 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f17_OUT[i, j, k] - f16_OUT[i, j - 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j + 1, k - 1] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f18_OUT[i, j, k] + f19_OUT[i, j + 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f18_OUT[i, j, k] - f19_OUT[i, j + 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i, j - 1, k + 1] == 1)
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f19_OUT[i, j, k] - f18_OUT[i, j - 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f19_OUT[i, j, k] + f18_OUT[i, j - 1, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j + 1, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f20_OUT[i, j, k] + f21_OUT[i + 1, j + 1, k + 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f20_OUT[i, j, k] + f21_OUT[i + 1, j + 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f20_OUT[i, j, k] + f21_OUT[i + 1, j + 1, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j - 1, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f21_OUT[i, j, k] - f20_OUT[i - 1, j - 1, k - 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f21_OUT[i, j, k] - f20_OUT[i - 1, j - 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f21_OUT[i, j, k] - f20_OUT[i - 1, j - 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j + 1, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f22_OUT[i, j, k] + f23_OUT[i + 1, j + 1, k - 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f22_OUT[i, j, k] + f23_OUT[i + 1, j + 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f22_OUT[i, j, k] - f23_OUT[i + 1, j + 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j - 1, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f23_OUT[i, j, k] - f22_OUT[i - 1, j - 1, k + 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f23_OUT[i, j, k] - f22_OUT[i - 1, j - 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f23_OUT[i, j, k] + f22_OUT[i - 1, j - 1, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j - 1, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f24_OUT[i, j, k] + f25_OUT[i + 1, j - 1, k + 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f24_OUT[i, j, k] - f25_OUT[i + 1, j - 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f24_OUT[i, j, k] + f25_OUT[i + 1, j - 1, k + 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j + 1, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f25_OUT[i, j, k] - f24_OUT[i - 1, j + 1, k - 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f25_OUT[i, j, k] + f24_OUT[i - 1, j + 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f25_OUT[i, j, k] - f24_OUT[i - 1, j + 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i + 1, j - 1, k - 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] + f26_OUT[i, j, k] + f27_OUT[i + 1, j - 1, k - 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] - f26_OUT[i, j, k] - f27_OUT[i + 1, j - 1, k - 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] - f26_OUT[i, j, k] - f27_OUT[i + 1, j - 1, k - 1]
          end
          if (Obstacle[i, j, k] == 0) && (Obstacle[i - 1, j + 1, k + 1] == 1)
            Fx_Obstacle[Current_Timestep] = Fx_Obstacle[Current_Timestep] - f27_OUT[i, j, k] - f26_OUT[i - 1, j + 1, k + 1]
            Fy_Obstacle[Current_Timestep] = Fy_Obstacle[Current_Timestep] + f27_OUT[i, j, k] + f26_OUT[i - 1, j + 1, k + 1]
            Fz_Obstacle[Current_Timestep] = Fz_Obstacle[Current_Timestep] + f27_OUT[i, j, k] + f26_OUT[i - 1, j + 1, k + 1]
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
  CrossSection_Area = sum(Obstacle[Obstacle_Center_x, 2:(Ny - 1), 2:(Nz - 1)])
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

  # STREAMING STEP
  f01_IN = circshift(f01_OUT, [Cx[1], Cy[1], Cz[1]])
  f02_IN = circshift(f02_OUT, [Cx[2], Cy[2], Cz[2]])
  f03_IN = circshift(f03_OUT, [Cx[3], Cy[3], Cz[3]])
  f04_IN = circshift(f04_OUT, [Cx[4], Cy[4], Cz[4]])
  f05_IN = circshift(f05_OUT, [Cx[5], Cy[5], Cz[5]])
  f06_IN = circshift(f06_OUT, [Cx[6], Cy[6], Cz[6]])
  f07_IN = circshift(f07_OUT, [Cx[7], Cy[7], Cz[7]])
  f08_IN = circshift(f08_OUT, [Cx[8], Cy[8], Cz[8]])
  f09_IN = circshift(f09_OUT, [Cx[9], Cy[9], Cz[9]])
  f10_IN = circshift(f10_OUT, [Cx[10], Cy[10], Cz[10]])
  f11_IN = circshift(f11_OUT, [Cx[11], Cy[11], Cz[11]])
  f12_IN = circshift(f12_OUT, [Cx[12], Cy[12], Cz[12]])
  f13_IN = circshift(f13_OUT, [Cx[13], Cy[13], Cz[13]])
  f14_IN = circshift(f14_OUT, [Cx[14], Cy[14], Cz[14]])
  f15_IN = circshift(f15_OUT, [Cx[15], Cy[15], Cz[15]])
  f16_IN = circshift(f16_OUT, [Cx[16], Cy[16], Cz[16]])
  f17_IN = circshift(f17_OUT, [Cx[17], Cy[17], Cz[17]])
  f18_IN = circshift(f18_OUT, [Cx[18], Cy[18], Cz[18]])
  f19_IN = circshift(f19_OUT, [Cx[19], Cy[19], Cz[19]])
  f20_IN = circshift(f20_OUT, [Cx[20], Cy[20], Cz[20]])
  f21_IN = circshift(f21_OUT, [Cx[21], Cy[21], Cz[21]])
  f22_IN = circshift(f22_OUT, [Cx[22], Cy[22], Cz[22]])
  f23_IN = circshift(f23_OUT, [Cx[23], Cy[23], Cz[23]])
  f24_IN = circshift(f24_OUT, [Cx[24], Cy[24], Cz[24]])
  f25_IN = circshift(f25_OUT, [Cx[25], Cy[25], Cz[25]])
  f26_IN = circshift(f26_OUT, [Cx[26], Cy[26], Cz[26]])
  f27_IN = circshift(f27_OUT, [Cx[27], Cy[27], Cz[27]])

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # RAMP UP FUNCTION
  if Ramp_Up_Test == "Yes"
    if Cycle > Ramp_Up_Initial
      Re = Re + Ramp_Up_Increment # Reynolds Number of the flow
      Nu = Inflow_Velocity*2*Obstacle_Radius/Re # Kinematic Viscosity
      Omega = 1/(3*Nu + 1/2) # Relaxation Parameter
      Omega_Positive = Omega
      Omega_Negative = ((1/Omega) - 1/2)/(TRT_Magic_Number + 1/2*((1/Omega) - 1/2))
      MRT_Omega[1] = Omega
      CMRT_Omega[1] = Omega
      Cumulant_Omega[1] = Omega
      println(" ")
      println("Reynolds Number = ", Re)
      println("Omega = ", Omega, " (Relaxation Parameter (Stable if much less than 2))")
    end
    # INSTABILITY DETECTION
    if (Drag_Coefficient[Current_Timestep] > 100) || (YLift_Coefficient[Current_Timestep] > 100) || (ZLift_Coefficient[Current_Timestep] > 100) || isnan(Drag_Coefficient[Current_Timestep]) || isnan(YLift_Coefficient[Current_Timestep]) || isnan(ZLift_Coefficient[Current_Timestep]) || isinf(Drag_Coefficient[Current_Timestep]) || isinf(YLift_Coefficient[Current_Timestep]) || isinf(ZLift_Coefficient[Current_Timestep])
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

  # NEXT CYCLE COUNT
  println("Cycle = ", Cycle, " out of ", Maximum_Iterations)
  toc()
  println(" ")
  Cycle = Cycle + 1
  Current_Timestep = Cycle + Previous_Current_Timestep

  ##################################################################################################
  ##################################################################################################
  ##################################################################################################

  # VISUALISATION STEP
  if mod(Cycle + 1, Cycle_Plot) == 1
    println(" ")
    println("Cycle Plot = ", Cycle)
    println(" ")

    Ut_Plot = sqrt(Ux.^2 + Uy.^2 + Uz.^2)./Inflow_Velocity
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
    for i = 2:(Nx - 1)
      for j = 2:(Ny - 1)
        for k = 2:(Nz - 1)
          DelUx_Delx[i, j, k] = (Ux[i + 1, j, k] - Ux[i - 1, j, k])./2
          DelUx_Dely[i, j, k] = (Ux[i, j + 1, k] - Ux[i, j - 1, k])./2
          DelUx_Delz[i, j, k] = (Ux[i, j, k + 1] - Ux[i, j, k - 1])./2
          DelUy_Delx[i, j, k] = (Uy[i + 1, j, k] - Uy[i - 1, j, k])./2
          DelUy_Dely[i, j, k] = (Uy[i, j + 1, k] - Uy[i, j - 1, k])./2
          DelUy_Delz[i, j, k] = (Uy[i, j, k + 1] - Uy[i, j, k - 1])./2
          DelUz_Delx[i, j, k] = (Uz[i + 1, j, k] - Uz[i - 1, j, k])./2
          DelUz_Dely[i, j, k] = (Uz[i, j + 1, k] - Uz[i, j - 1, k])./2
          DelUz_Delz[i, j, k] = (Uz[i, j, k + 1] - Uz[i, j, k - 1])./2
        end
      end
    end
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
          Lambda2EigenMatrix[isnan(Lambda2EigenMatrix)] = 0
          Lambda2EigenMatrix[isinf(Lambda2EigenMatrix)] = 0
          Lambda2EigenValues = eigvals(Lambda2EigenMatrix)
          Lambda2EigenValues[isnan(Lambda2EigenValues)] = 0
          Lambda2EigenValues[isinf(Lambda2EigenValues)] = 0
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
          if (Wall[i, j, k] == 1) || (Obstacle[i, j, k] == 1)
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
          if (Obstacle[i, j, k] == 1) || (Wall[i, j, k] == 1)
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

      Printer_f01_IN = f01_IN[:, :, k]
      Printer_f02_IN = f02_IN[:, :, k]
      Printer_f03_IN = f03_IN[:, :, k]
      Printer_f04_IN = f04_IN[:, :, k]
      Printer_f05_IN = f05_IN[:, :, k]
      Printer_f06_IN = f06_IN[:, :, k]
      Printer_f07_IN = f07_IN[:, :, k]
      Printer_f08_IN = f08_IN[:, :, k]
      Printer_f09_IN = f09_IN[:, :, k]
      Printer_f10_IN = f10_IN[:, :, k]
      Printer_f11_IN = f11_IN[:, :, k]
      Printer_f12_IN = f12_IN[:, :, k]
      Printer_f13_IN = f13_IN[:, :, k]
      Printer_f14_IN = f14_IN[:, :, k]
      Printer_f15_IN = f15_IN[:, :, k]
      Printer_f16_IN = f16_IN[:, :, k]
      Printer_f17_IN = f17_IN[:, :, k]
      Printer_f18_IN = f18_IN[:, :, k]
      Printer_f19_IN = f19_IN[:, :, k]
      Printer_f20_IN = f20_IN[:, :, k]
      Printer_f21_IN = f21_IN[:, :, k]
      Printer_f22_IN = f22_IN[:, :, k]
      Printer_f23_IN = f23_IN[:, :, k]
      Printer_f24_IN = f24_IN[:, :, k]
      Printer_f25_IN = f25_IN[:, :, k]
      Printer_f26_IN = f26_IN[:, :, k]
      Printer_f27_IN = f27_IN[:, :, k]
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

      Printer_f01_IN = reshape(Printer_f01_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f02_IN = reshape(Printer_f02_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f03_IN = reshape(Printer_f03_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f04_IN = reshape(Printer_f04_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f05_IN = reshape(Printer_f05_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f06_IN = reshape(Printer_f06_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f07_IN = reshape(Printer_f07_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f08_IN = reshape(Printer_f08_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f09_IN = reshape(Printer_f09_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f10_IN = reshape(Printer_f10_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f11_IN = reshape(Printer_f11_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f12_IN = reshape(Printer_f12_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f13_IN = reshape(Printer_f13_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f14_IN = reshape(Printer_f14_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f15_IN = reshape(Printer_f15_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f16_IN = reshape(Printer_f16_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f17_IN = reshape(Printer_f17_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f18_IN = reshape(Printer_f18_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f19_IN = reshape(Printer_f19_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f20_IN = reshape(Printer_f20_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f21_IN = reshape(Printer_f21_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f22_IN = reshape(Printer_f22_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f23_IN = reshape(Printer_f23_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f24_IN = reshape(Printer_f24_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f25_IN = reshape(Printer_f25_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f26_IN = reshape(Printer_f26_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
      Printer_f27_IN = reshape(Printer_f27_IN, (Printer_Nx + 2).*(Printer_Ny + 2))
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

      Outfile_LBM_D3Q27_8 = "LBM D3Q27 $Autosave_Title - #8 (Part $k of $Printer_Nz_Mod) f01_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_8 = open(Outfile_LBM_D3Q27_8, "w")
      show(Outfile_Opener_LBM_D3Q27_8, "$Printer_f01_IN")
      close(Outfile_Opener_LBM_D3Q27_8)

      Outfile_LBM_D3Q27_9 = "LBM D3Q27 $Autosave_Title - #9 (Part $k of $Printer_Nz_Mod) f02_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_9 = open(Outfile_LBM_D3Q27_9, "w")
      show(Outfile_Opener_LBM_D3Q27_9, "$Printer_f02_IN")
      close(Outfile_Opener_LBM_D3Q27_9)

      Outfile_LBM_D3Q27_10 = "LBM D3Q27 $Autosave_Title - #10 (Part $k of $Printer_Nz_Mod) f03_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_10 = open(Outfile_LBM_D3Q27_10, "w")
      show(Outfile_Opener_LBM_D3Q27_10, "$Printer_f03_IN")
      close(Outfile_Opener_LBM_D3Q27_10)

      Outfile_LBM_D3Q27_11 = "LBM D3Q27 $Autosave_Title - #11 (Part $k of $Printer_Nz_Mod) f04_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_11 = open(Outfile_LBM_D3Q27_11, "w")
      show(Outfile_Opener_LBM_D3Q27_11, "$Printer_f04_IN")
      close(Outfile_Opener_LBM_D3Q27_11)

      Outfile_LBM_D3Q27_12 = "LBM D3Q27 $Autosave_Title - #12 (Part $k of $Printer_Nz_Mod) f05_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_12 = open(Outfile_LBM_D3Q27_12, "w")
      show(Outfile_Opener_LBM_D3Q27_12, "$Printer_f05_IN")
      close(Outfile_Opener_LBM_D3Q27_12)

      Outfile_LBM_D3Q27_13 = "LBM D3Q27 $Autosave_Title - #13 (Part $k of $Printer_Nz_Mod) f06_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_13 = open(Outfile_LBM_D3Q27_13, "w")
      show(Outfile_Opener_LBM_D3Q27_13, "$Printer_f06_IN")
      close(Outfile_Opener_LBM_D3Q27_13)

      Outfile_LBM_D3Q27_14 = "LBM D3Q27 $Autosave_Title - #14 (Part $k of $Printer_Nz_Mod) f07_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_14 = open(Outfile_LBM_D3Q27_14, "w")
      show(Outfile_Opener_LBM_D3Q27_14, "$Printer_f07_IN")
      close(Outfile_Opener_LBM_D3Q27_14)

      Outfile_LBM_D3Q27_15 = "LBM D3Q27 $Autosave_Title - #15 (Part $k of $Printer_Nz_Mod) f08_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_15 = open(Outfile_LBM_D3Q27_15, "w")
      show(Outfile_Opener_LBM_D3Q27_15, "$Printer_f08_IN")
      close(Outfile_Opener_LBM_D3Q27_15)

      Outfile_LBM_D3Q27_16 = "LBM D3Q27 $Autosave_Title - #16 (Part $k of $Printer_Nz_Mod) f09_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_16 = open(Outfile_LBM_D3Q27_16, "w")
      show(Outfile_Opener_LBM_D3Q27_16, "$Printer_f09_IN")
      close(Outfile_Opener_LBM_D3Q27_16)

      Outfile_LBM_D3Q27_17 = "LBM D3Q27 $Autosave_Title - #17 (Part $k of $Printer_Nz_Mod) f10_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_17 = open(Outfile_LBM_D3Q27_17, "w")
      show(Outfile_Opener_LBM_D3Q27_17, "$Printer_f10_IN")
      close(Outfile_Opener_LBM_D3Q27_17)

      Outfile_LBM_D3Q27_18 = "LBM D3Q27 $Autosave_Title - #18 (Part $k of $Printer_Nz_Mod) f11_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_18 = open(Outfile_LBM_D3Q27_18, "w")
      show(Outfile_Opener_LBM_D3Q27_18, "$Printer_f11_IN")
      close(Outfile_Opener_LBM_D3Q27_18)

      Outfile_LBM_D3Q27_19 = "LBM D3Q27 $Autosave_Title - #19 (Part $k of $Printer_Nz_Mod) f12_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_19 = open(Outfile_LBM_D3Q27_19, "w")
      show(Outfile_Opener_LBM_D3Q27_19, "$Printer_f12_IN")
      close(Outfile_Opener_LBM_D3Q27_19)

      Outfile_LBM_D3Q27_20 = "LBM D3Q27 $Autosave_Title - #20 (Part $k of $Printer_Nz_Mod) f13_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_20 = open(Outfile_LBM_D3Q27_20, "w")
      show(Outfile_Opener_LBM_D3Q27_20, "$Printer_f13_IN")
      close(Outfile_Opener_LBM_D3Q27_20)

      Outfile_LBM_D3Q27_21 = "LBM D3Q27 $Autosave_Title - #21 (Part $k of $Printer_Nz_Mod) f14_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_21 = open(Outfile_LBM_D3Q27_21, "w")
      show(Outfile_Opener_LBM_D3Q27_21, "$Printer_f14_IN")
      close(Outfile_Opener_LBM_D3Q27_21)

      Outfile_LBM_D3Q27_22 = "LBM D3Q27 $Autosave_Title - #22 (Part $k of $Printer_Nz_Mod) f15_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_22 = open(Outfile_LBM_D3Q27_22, "w")
      show(Outfile_Opener_LBM_D3Q27_22, "$Printer_f15_IN")
      close(Outfile_Opener_LBM_D3Q27_22)

      Outfile_LBM_D3Q27_23 = "LBM D3Q27 $Autosave_Title - #23 (Part $k of $Printer_Nz_Mod) f16_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_23 = open(Outfile_LBM_D3Q27_23, "w")
      show(Outfile_Opener_LBM_D3Q27_23, "$Printer_f16_IN")
      close(Outfile_Opener_LBM_D3Q27_23)

      Outfile_LBM_D3Q27_24 = "LBM D3Q27 $Autosave_Title - #24 (Part $k of $Printer_Nz_Mod) f17_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_24 = open(Outfile_LBM_D3Q27_24, "w")
      show(Outfile_Opener_LBM_D3Q27_24, "$Printer_f17_IN")
      close(Outfile_Opener_LBM_D3Q27_24)

      Outfile_LBM_D3Q27_25 = "LBM D3Q27 $Autosave_Title - #25 (Part $k of $Printer_Nz_Mod) f18_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_25 = open(Outfile_LBM_D3Q27_25, "w")
      show(Outfile_Opener_LBM_D3Q27_25, "$Printer_f18_IN")
      close(Outfile_Opener_LBM_D3Q27_25)

      Outfile_LBM_D3Q27_26 = "LBM D3Q27 $Autosave_Title - #26 (Part $k of $Printer_Nz_Mod) f19_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_26 = open(Outfile_LBM_D3Q27_26, "w")
      show(Outfile_Opener_LBM_D3Q27_26, "$Printer_f19_IN")
      close(Outfile_Opener_LBM_D3Q27_26)

      Outfile_LBM_D3Q27_27 = "LBM D3Q27 $Autosave_Title - #27 (Part $k of $Printer_Nz_Mod) f20_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_27 = open(Outfile_LBM_D3Q27_27, "w")
      show(Outfile_Opener_LBM_D3Q27_27, "$Printer_f20_IN")
      close(Outfile_Opener_LBM_D3Q27_27)

      Outfile_LBM_D3Q27_28 = "LBM D3Q27 $Autosave_Title - #28 (Part $k of $Printer_Nz_Mod) f21_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_28 = open(Outfile_LBM_D3Q27_28, "w")
      show(Outfile_Opener_LBM_D3Q27_28, "$Printer_f21_IN")
      close(Outfile_Opener_LBM_D3Q27_28)

      Outfile_LBM_D3Q27_29 = "LBM D3Q27 $Autosave_Title - #29 (Part $k of $Printer_Nz_Mod) f22_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_29 = open(Outfile_LBM_D3Q27_29, "w")
      show(Outfile_Opener_LBM_D3Q27_29, "$Printer_f22_IN")
      close(Outfile_Opener_LBM_D3Q27_29)

      Outfile_LBM_D3Q27_30 = "LBM D3Q27 $Autosave_Title - #30 (Part $k of $Printer_Nz_Mod) f23_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_30 = open(Outfile_LBM_D3Q27_30, "w")
      show(Outfile_Opener_LBM_D3Q27_30, "$Printer_f23_IN")
      close(Outfile_Opener_LBM_D3Q27_30)

      Outfile_LBM_D3Q27_31 = "LBM D3Q27 $Autosave_Title - #31 (Part $k of $Printer_Nz_Mod) f24_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_31 = open(Outfile_LBM_D3Q27_31, "w")
      show(Outfile_Opener_LBM_D3Q27_31, "$Printer_f24_IN")
      close(Outfile_Opener_LBM_D3Q27_31)

      Outfile_LBM_D3Q27_32 = "LBM D3Q27 $Autosave_Title - #32 (Part $k of $Printer_Nz_Mod) f25_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_32 = open(Outfile_LBM_D3Q27_32, "w")
      show(Outfile_Opener_LBM_D3Q27_32, "$Printer_f25_IN")
      close(Outfile_Opener_LBM_D3Q27_32)

      Outfile_LBM_D3Q27_33 = "LBM D3Q27 $Autosave_Title - #33 (Part $k of $Printer_Nz_Mod) f26_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_33 = open(Outfile_LBM_D3Q27_33, "w")
      show(Outfile_Opener_LBM_D3Q27_33, "$Printer_f26_IN")
      close(Outfile_Opener_LBM_D3Q27_33)

      Outfile_LBM_D3Q27_34 = "LBM D3Q27 $Autosave_Title - #34 (Part $k of $Printer_Nz_Mod) f27_IN - Cycle $Printer_Current_Timestep - Grid $Printer_Nx x $Printer_Ny x $Printer_Nz - Re $Printer_Re - Ma $Printer_Ma.dat"
      Outfile_Opener_LBM_D3Q27_34 = open(Outfile_LBM_D3Q27_34, "w")
      show(Outfile_Opener_LBM_D3Q27_34, "$Printer_f27_IN")
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
println("Knudsen Number = ", sqrt(pi/2)/(2*Omega*Obstacle_Radius))
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
