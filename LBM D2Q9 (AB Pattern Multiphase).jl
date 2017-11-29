####################################################################################################
####################################################################################################
####################################################################################################

# 2D Lattice Boltzmann (BGK) Model
# D2Q9 Quadrature

####################################################################################################
####################################################################################################
####################################################################################################

# INPUT PARAMETERS {NEEDS TO BE CONGRUENT WITH EXISTING RUN IF A CALCULATION IS RESTARTED}
Nx = 100 # Number of cells in the x-direction in units of 100
Ny = 100 # Number of cells in the y-direction in units of 100
Re = 20.0 # Reynolds Number of the flow
We = 50.0 # Weber Number of the flow
#Density_Ratio = 10
Maximum_Iterations = 10000 # Total number of iterations (TIME STEP)
Cycle_Plot = 200 # Cycle evaluated for plotting at this increment of cycles

# ADDITIONAL REQUIREMENTS {REQUIRED FOR NEW OR EXISTING RUNS BUT DO NOT NEED TO BE CONGRUENT WITH EXISITING RUNS (FOR EXAMPLE A DIFFERENT COLLISION MODEL MAY BE USED)}
Collision_Model = "SRT_LBM" # Valid inputs are "SRT_LBM", "TRT_LBM", "MRT_LBM". Ensure the following relaxat times are adjusted accordingly as these may be changed upon starting a new run or using an existing run (Note this only applies for models using more than one relaxation time)
# TRT LBM input variable
TRT_Magic_Number_Fluid1 = 1/4 # Set to 1/4 for best stability and solution for the steady-state case dependant only on the equilibrium function, 1/12 for no third order error (best advection), 1/6 for no fourth order error (best diffusion), or 3/16 for exact location of bounce-back walls for the Poiseuille flow
TRT_Magic_Number_Fluid2 = 1/4 # Set to 1/4 for best stability and solution for the steady-state case dependant only on the equilibrium function, 1/12 for no third order error (best advection), 1/6 for no fourth order error (best diffusion), or 3/16 for exact location of bounce-back walls for the Poiseuille flow

# Multiphase
G1_Multiphase = - 4 # [Nearest neighbour] Amplitude of the molecular interaction force (Needs to be greater than approximately - 7 to be unconditionally stable, needs to be greater than - 4 to be immiscible)
G2_Multiphase = - 0.2 # [Next nearest neighbour] Amplitude of the molecular interaction force (Needs to be greater than approximately - 7 to be unconditionally stable, needs to be greater than - 4 to be immiscible)
Rho0 = 1 # Used to tune the interface thickness in the pseudopotential model (Note that small increases to the interface thickness cause large increases in numerical stability)
Density_Ratio = 10
Viscosity_Ratio = 1 ############################## NEED TO LINK THIS TO NU CALCULATIONS##########################################
Fluid_1_Density = 1/2.*(1 + 1./Density_Ratio) # ??? how can this be right when the larger the density ratio, the closer the fluid densities become
Fluid_2_Density = 1/2.*(1 - 1./Density_Ratio) # ??? how can this be right when the larger the density ratio, the closer the fluid densities become
Density_Difference = Density_Ratio - 1 # ??? only correct when density of the lighter fluid is 1 and the heavier fluid is scaled off that

# NEED TO MAKE GRAVITY A FUNCTION OF GRID SIZE ETC SO IT DOESNT NEED TUNING
Gravitational_Constant = - 0.00001

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
Liquid_Surface_Position = 0.25
Droplet_Center_x = Nx/2
Droplet_Center_y = 3*Ny/4
Droplet_Radius = Nx/8

# Initial Calculations
Fall_Distance = Droplet_Center_y - Liquid_Surface_Position*Ny - Droplet_Radius
Final_Velocity = 0.1#sqrt(- 2*Gravitational_Constant*Fall_Distance)
# Average_Velocity = 1/2.*sqrt(- 2*Gravitational_Constant*Fall_Distance)
Nu_Fluid1 = Final_Velocity*2*Droplet_Radius/Re # Kinematic Viscosity
Nu_Fluid2 = Final_Velocity*2*Droplet_Radius/Re # Kinematic Viscosity
Omega_Fluid1 = 1/(3*Nu_Fluid1 + 1/2) # Relaxation Parameter
Omega_Fluid2 = 1/(3*Nu_Fluid2 + 1/2) # Relaxation Parameter
Omega_Positive_Fluid1 = Omega_Fluid1
Omega_Positive_Fluid2 = Omega_Fluid2
Omega_Negative_Fluid1 = ((1/Omega_Fluid1) - 1/2)/(TRT_Magic_Number_Fluid1 + 1/2*((1/Omega_Fluid1) - 1/2))
Omega_Negative_Fluid2 = ((1/Omega_Fluid2) - 1/2)/(TRT_Magic_Number_Fluid2 + 1/2*((1/Omega_Fluid2) - 1/2))

# D2Q9 Lattice constants
Wi = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36]
Cx = [0, 1, 0, -1, 0, 1, -1, -1, 1]
Cy = [0, 0, 1, 0, -1, 1, 1, -1, -1]
Opp = [1, 4, 5, 2, 3, 8, 9, 6, 7]
Gx = 1:Nx # Grid x-locations
Gy = 1:Ny # Grid y-locations
Wall = zeros(Nx, Ny)
#Wall[1, :] = 1
#Wall[Nx, :] = 1
Wall[:, 1] = 1
Wall[:, Ny] = 1

# Bounce Back Region
BBR_Indices_i = zeros(Nx, Ny)
BBR_Indices_j = zeros(Nx, Ny)
for i = Gx
  for j = Gy
  BBR_Indices_i[i, j] = i
  BBR_Indices_j[i, j] = j
  end
end
BBR_Indices_i = BBR_Indices_i.*(Wall)
BBR_Indices_j = BBR_Indices_j.*(Wall)
BBR_Indices = find(Wall)

f_IN = zeros(Nx, Ny, 9)
f_EQ = zeros(Nx, Ny, 9)
f_OUT = zeros(Nx, Ny, 9)
g_IN = zeros(Nx, Ny, 9)
g_EQ = zeros(Nx, Ny, 9)
g_OUT = zeros(Nx, Ny, 9)
Rho_Fluid1 = zeros(Nx, Ny)
Rho_Fluid2 = zeros(Nx, Ny)
Rho_Total = zeros(Nx, Ny)
Ux_Fluid1 = zeros(Nx, Ny)
Uy_Fluid1 = zeros(Nx, Ny)
Ux_Fluid2 = zeros(Nx, Ny)
Uy_Fluid2 = zeros(Nx, Ny)
Jx_Fluid1 = zeros(Nx, Ny)
Jy_Fluid1 = zeros(Nx, Ny)
Jx_Fluid2 = zeros(Nx, Ny)
Jy_Fluid2 = zeros(Nx, Ny)
X_Plot = ones(Nx, Ny).*(1:Nx).'.'
Y_Plot = ones(Nx, Ny).*(1:Ny).'
Jt_Plot_Fluid1 = zeros(Nx, Ny)
Jt_Plot_Fluid2 = zeros(Nx, Ny)
Rho_Plot_Fluid1 = zeros(Nx, Ny)
Rho_Plot_Fluid2 = zeros(Nx, Ny)
DelUy_Delx_Fluid1 = zeros(Nx, Ny)
DelUy_Delx_Fluid2 = zeros(Nx, Ny)
DelUx_Dely_Fluid1 = zeros(Nx, Ny)
DelUx_Dely_Fluid2 = zeros(Nx, Ny)

# Additional variables for alternate collision models
# TRT LBM collision setup
f_IN_Positive = zeros(Nx, Ny, 9)
f_IN_Negative = zeros(Nx, Ny, 9)
f_EQ_Positive = zeros(Nx, Ny, 9)
f_EQ_Negative = zeros(Nx, Ny, 9)
g_IN_Positive = zeros(Nx, Ny, 9)
g_IN_Negative = zeros(Nx, Ny, 9)
g_EQ_Positive = zeros(Nx, Ny, 9)
g_EQ_Negative = zeros(Nx, Ny, 9)

# INITIAL CONDITIONS
# Determination of droplet positioning
Droplet = zeros(Nx, Ny)
for i = Gx
  for j = Gy
    Droplet[i, j] = (Gx[i] - Droplet_Center_x).^2 + (Gy[j] - Droplet_Center_y).^2 <= Droplet_Radius.^2
  end
end
# Constructing multiphase domain
dRho = Fluid_1_Density./Fluid_2_Density
Compressibility_OOM = Final_Velocity*sqrt(3)
for i = Gx
  for j = Gy
    for k = 1:9
      if Droplet[i, j] == 1
        f_IN[i, j, k] = Wi[k].*Fluid_1_Density
        g_IN[i, j, k] = Wi[k]./1000000
      end
      if Droplet[i, j] == 0
        f_IN[i, j, k] = Wi[k]./1000000
        g_IN[i, j, k] = Wi[k].*Fluid_2_Density
      end
      if j <= Ny*Liquid_Surface_Position
        f_IN[i, j, k] = Wi[k].*Fluid_1_Density
        g_IN[i, j, k] = Wi[k]./1000000
      end
    end
  end
end
for k = 1:9
  Rho_Fluid1 = Rho_Fluid1 + f_IN[:, :, k]
  Rho_Fluid2 = Rho_Fluid2 + g_IN[:, :, k]
end

# Surface tension
Surface_Tension = (Final_Velocity^2)*2*Droplet_Radius*dRho/We
println(Surface_Tension)
println(Compressibility_OOM)
# NEED TO USE THIS BLOCK TO CALCULATE THE G CONSTANTS INSTEAD OF MANUAL TUNING

println(" ")
println("Reynolds Number = ???")
println("Weber Number = ???")
println("Mach Number = ???")
println("Knudsen Number = ???")
println(" ")
println("Nu Fluid 1 = ", Nu_Fluid1, " (Kinematic Viscosity)")
println("Nu Fluid 2 = ", Nu_Fluid2, " (Kinematic Viscosity)")
println("Omega Fluid 1 = ", Omega_Fluid1, " (Relaxation Parameter (Stable if much less than 2))")
println("Omega Fluid 2 = ", Omega_Fluid2, " (Relaxation Parameter (Stable if much less than 2))")
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
Current_Timestep = Cycle
while Cycle < Maximum_Iterations + 1
  println("Cycle = ", Cycle, " out of ", Maximum_Iterations)

  # MACROSCOPIC Variables
  Rho_Fluid1 = Rho_Fluid1.*0
  Rho_Fluid2 = Rho_Fluid2.*0
  for k = 1:9
    Rho_Fluid1 = Rho_Fluid1 + f_IN[:, :, k]
    Rho_Fluid2 = Rho_Fluid2 + g_IN[:, :, k]
  end
  if Collision_Model == "SRT_LBM"
    Rho_Total = Omega_Fluid1*Rho_Fluid1 + Omega_Fluid2*Rho_Fluid2
  end
  if Collision_Model == "TRT_LBM"
    Rho_Total = Omega_Positive_Fluid1*Rho_Fluid1 + Omega_Positive_Fluid2*Rho_Fluid2
  end
  Jx_Fluid1 = Jx_Fluid1.*0
  Jy_Fluid1 = Jy_Fluid1.*0
  Jx_Fluid2 = Jx_Fluid2.*0
  Jy_Fluid2 = Jy_Fluid2.*0
  for k = 1:9
    Jx_Fluid1 = Jx_Fluid1 + f_IN[:, :, k].*Cx[k]
    Jy_Fluid1 = Jy_Fluid1 + f_IN[:, :, k].*Cy[k]
    Jx_Fluid2 = Jx_Fluid2 + g_IN[:, :, k].*Cx[k]
    Jy_Fluid2 = Jy_Fluid2 + g_IN[:, :, k].*Cy[k]
  end
  if Collision_Model == "SRT_LBM"
    Ux_Total = (Omega_Fluid1*Jx_Fluid1 + Omega_Fluid2*Jx_Fluid2)./Rho_Total
    Uy_Total = (Omega_Fluid1*Jy_Fluid1 + Omega_Fluid2*Jy_Fluid2)./Rho_Total
  end
  if Collision_Model == "TRT_LBM"
    Ux_Total = (Omega_Positive_Fluid1*Jx_Fluid1 + Omega_Positive_Fluid2*Jx_Fluid2)./Rho_Total
    Uy_Total = (Omega_Positive_Fluid1*Jy_Fluid1 + Omega_Positive_Fluid2*Jy_Fluid2)./Rho_Total
  end

  # MULTIPHASE CONTRIBUTIONS (first order accuracy)
  Psi1_Contribution_Fluid1x = 0
  Psi1_Contribution_Fluid1y = 0
  Psi1_Contribution_Fluid2x = 0
  Psi1_Contribution_Fluid2y = 0
  Psi2_Contribution_Fluid1x = 0
  Psi2_Contribution_Fluid1y = 0
  Psi2_Contribution_Fluid2x = 0
  Psi2_Contribution_Fluid2y = 0
  Psi_Fluid1 = Rho0.*(1 - exp(- Rho_Fluid1./Rho0))
  Psi_Fluid2 = Rho0.*(1 - exp(- Rho_Fluid2./Rho0))
  for k = 2:9
    Psi1_Contribution_Fluid1x = Psi1_Contribution_Fluid1x + Cx[k]*circshift(Wi[k]*Psi_Fluid1, [Cx[k], Cy[k]])
    Psi1_Contribution_Fluid1y = Psi1_Contribution_Fluid1y + Cy[k]*circshift(Wi[k]*Psi_Fluid1, [Cx[k], Cy[k]])
    Psi1_Contribution_Fluid2x = Psi1_Contribution_Fluid2x + Cx[k]*circshift(Wi[k]*Psi_Fluid2, [Cx[k], Cy[k]])
    Psi1_Contribution_Fluid2y = Psi1_Contribution_Fluid2y + Cy[k]*circshift(Wi[k]*Psi_Fluid2, [Cx[k], Cy[k]])
    Psi2_Contribution_Fluid1x = Psi2_Contribution_Fluid1x + Cx[k]*circshift(Wi[k]*Psi_Fluid1, [2*Cx[k], 2*Cy[k]])
    Psi2_Contribution_Fluid1y = Psi2_Contribution_Fluid1y + Cy[k]*circshift(Wi[k]*Psi_Fluid1, [2*Cx[k], 2*Cy[k]])
    Psi2_Contribution_Fluid2x = Psi2_Contribution_Fluid2x + Cx[k]*circshift(Wi[k]*Psi_Fluid2, [2*Cx[k], 2*Cy[k]])
    Psi2_Contribution_Fluid2y = Psi2_Contribution_Fluid2y + Cy[k]*circshift(Wi[k]*Psi_Fluid2, [2*Cx[k], 2*Cy[k]])
  end
  # Calculate fluid interaction forces from nearest neighbour and next nearest neighbour
  Interaction_Force_Fluid1x = - Psi_Fluid1.*(G1_Multiphase.*Psi1_Contribution_Fluid2x + G2_Multiphase.*Psi2_Contribution_Fluid2x)
  Interaction_Force_Fluid1y = - Psi_Fluid1.*(G1_Multiphase.*Psi1_Contribution_Fluid2y + G2_Multiphase.*Psi2_Contribution_Fluid2y)
  Interaction_Force_Fluid2x = - Psi_Fluid2.*(G1_Multiphase.*Psi1_Contribution_Fluid1x + G2_Multiphase.*Psi2_Contribution_Fluid1x)
  Interaction_Force_Fluid2y = - Psi_Fluid2.*(G1_Multiphase.*Psi1_Contribution_Fluid1y + G2_Multiphase.*Psi2_Contribution_Fluid1y)

  # FORCE CONTRIBUTIONS
  Gravity_Force_Fluid1 = Gravitational_Constant.*Rho_Fluid1*Density_Difference
  Gravity_Force_Fluid2 = Gravitational_Constant.*Rho_Fluid2
  if Collision_Model == "SRT_LBM"
    Ux_Fluid1 = Ux_Total + Omega_Fluid1.*Interaction_Force_Fluid1x./Rho_Fluid1
    Uy_Fluid1 = Uy_Total + Omega_Fluid1.*(Interaction_Force_Fluid1y + Gravity_Force_Fluid1)./Rho_Fluid1
    Ux_Fluid2 = Ux_Total + Omega_Fluid2.*Interaction_Force_Fluid2x./Rho_Fluid2
    Uy_Fluid2 = Uy_Total + Omega_Fluid2.*(Interaction_Force_Fluid2y + Gravity_Force_Fluid2)./Rho_Fluid2
  end
  if Collision_Model == "TRT_LBM"
    Ux_Fluid1 = Ux_Total + Omega_Positive_Fluid1.*Interaction_Force_Fluid1x./Rho_Fluid1
    Uy_Fluid1 = Uy_Total + Omega_Positive_Fluid1.*(Interaction_Force_Fluid1y + Gravity_Force_Fluid1)./Rho_Fluid1
    Ux_Fluid2 = Ux_Total + Omega_Positive_Fluid2.*Interaction_Force_Fluid2x./Rho_Fluid2
    Uy_Fluid2 = Uy_Total + Omega_Positive_Fluid2.*(Interaction_Force_Fluid2y + Gravity_Force_Fluid2)./Rho_Fluid2
  end

  # COLLISION STEP
  # SRT LBM COLLISION MODEL
  if Collision_Model == "SRT_LBM"
    for k = 1:9
      CUxy_Fluid1 = 3.*(Cx[k]*Ux_Fluid1 + Cy[k]*Uy_Fluid1)
      CUxy_Fluid2 = 3.*(Cx[k]*Ux_Fluid2 + Cy[k]*Uy_Fluid2)
      f_EQ[:, :, k] = Rho_Fluid1.*Wi[k].*(1 + CUxy_Fluid1 + 1/2.*(CUxy_Fluid1.^2) - 3/2.*(Ux_Fluid1.^2 + Uy_Fluid1.^2))
      g_EQ[:, :, k] = Rho_Fluid2.*Wi[k].*(1 + CUxy_Fluid2 + 1/2.*(CUxy_Fluid2.^2) - 3/2.*(Ux_Fluid2.^2 + Uy_Fluid2.^2))
      f_OUT[:, :, k] = f_IN[:, :, k] - Omega_Fluid1.*(f_IN[:, :, k] - f_EQ[:, :, k])
      g_OUT[:, :, k] = g_IN[:, :, k] - Omega_Fluid2.*(g_IN[:, :, k] - g_EQ[:, :, k])
    end
  end
  # TRT LBM COLLISION MODEL
  if Collision_Model == "TRT_LBM"
    for k = 1:9
      CUxy_Fluid1 = 3.*(Cx[k]*Ux_Fluid1 + Cy[k]*Uy_Fluid1)
      CUxy_Fluid2 = 3.*(Cx[k]*Ux_Fluid2 + Cy[k]*Uy_Fluid2)
      f_EQ[:, :, k] = Rho_Fluid1.*Wi[k].*(1 + CUxy_Fluid1 + 1/2.*(CUxy_Fluid1.^2) - 3/2.*(Ux_Fluid1.^2 + Uy_Fluid1.^2))
      g_EQ[:, :, k] = Rho_Fluid2.*Wi[k].*(1 + CUxy_Fluid2 + 1/2.*(CUxy_Fluid2.^2) - 3/2.*(Ux_Fluid2.^2 + Uy_Fluid2.^2))
    end
    for k = 1:9
      f_EQ_Positive[:, :, k] = (f_EQ[:, :, k] + f_EQ[:, :, Opp[k]])/2
      f_EQ_Negative[:, :, k] = (f_EQ[:, :, k] - f_EQ[:, :, Opp[k]])/2
      f_IN_Positive[:, :, k] = (f_IN[:, :, k] + f_IN[:, :, Opp[k]])/2
      f_IN_Negative[:, :, k] = (f_IN[:, :, k] - f_IN[:, :, Opp[k]])/2
      g_EQ_Positive[:, :, k] = (g_EQ[:, :, k] + g_EQ[:, :, Opp[k]])/2
      g_EQ_Negative[:, :, k] = (g_EQ[:, :, k] - g_EQ[:, :, Opp[k]])/2
      g_IN_Positive[:, :, k] = (g_IN[:, :, k] + g_IN[:, :, Opp[k]])/2
      g_IN_Negative[:, :, k] = (g_IN[:, :, k] - g_IN[:, :, Opp[k]])/2
    end
    for k = 1:9
      f_OUT[:, :, k] = f_IN[:, :, k] - Omega_Positive_Fluid1.*(f_IN_Positive[:, :, k] - f_EQ_Positive[:, :, k]) - Omega_Negative_Fluid1.*(f_IN_Negative[:, :, k] - f_EQ_Negative[:, :, k])
      g_OUT[:, :, k] = g_IN[:, :, k] - Omega_Positive_Fluid2.*(g_IN_Positive[:, :, k] - g_EQ_Positive[:, :, k]) - Omega_Negative_Fluid2.*(g_IN_Negative[:, :, k] - g_EQ_Negative[:, :, k])
    end
  end

  # BOUNCE BACK ROUTINE (first order accuracy)
  for i = Gx
    for j = Gy
      for k = 2:9
        if (BBR_Indices_i[i, j] > 0) && (BBR_Indices_j[i, j] > 0)
          f_OUT[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), k] = f_IN[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), Opp[k]]
          g_OUT[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), k] = g_IN[Int64(BBR_Indices_i[i, j]), Int64(BBR_Indices_j[i, j]), Opp[k]]
        end
      end
    end
  end

  # STREAMING STEP
  for k = 1:9
    f_IN[:, :, k] = circshift(f_OUT[:, :, k], [Cx[k], Cy[k]])
    g_IN[:, :, k] = circshift(g_OUT[:, :, k], [Cx[k], Cy[k]])
  end

  # NEXT CYCLE COUNT
  Cycle = Cycle + 1
  Current_Timestep = Cycle

  # VISUALISATION STEP
  if mod(Cycle + 1, Cycle_Plot) == 1
    println(" ")
    println("Cycle Plot = ", Cycle)
    println(" ")

    Jt_Plot_Fluid1 = sqrt(Ux_Fluid1.^2 + Uy_Fluid1.^2).*Rho_Fluid1
    Jt_Plot_Fluid2 = sqrt(Ux_Fluid2.^2 + Uy_Fluid2.^2).*Rho_Fluid2
    Rho_Plot_Fluid1 = Rho_Fluid1*1 # UNSURE WHY THIS *1 IS REQUIRED BUT WITHOUT IT THE FOLLOWING NAN CREEP INTO THE RHO FLUID AFTER PLOTTING AND AFFECT THE CALCULATION LOOP
    Rho_Plot_Fluid2 = Rho_Fluid2*1 # UNSURE WHY THIS *1 IS REQUIRED BUT WITHOUT IT THE FOLLOWING NAN CREEP INTO THE RHO FLUID AFTER PLOTTING AND AFFECT THE CALCULATION LOOP

    Jt_Plot_Fluid1[1, :] = NaN
    Jt_Plot_Fluid1[Nx, :] = NaN
    Jt_Plot_Fluid1[:, 1] = NaN
    Jt_Plot_Fluid1[:, Ny] = NaN
    Jt_Plot_Fluid2[1, :] = NaN
    Jt_Plot_Fluid2[Nx, :] = NaN
    Jt_Plot_Fluid2[:, 1] = NaN
    Jt_Plot_Fluid2[:, Ny] = NaN
    Rho_Plot_Fluid1[1, :] = NaN
    Rho_Plot_Fluid1[Nx, :] = NaN
    Rho_Plot_Fluid1[:, 1] = NaN
    Rho_Plot_Fluid1[:, Ny] = NaN
    Rho_Plot_Fluid2[1, :] = NaN
    Rho_Plot_Fluid2[Nx, :] = NaN
    Rho_Plot_Fluid2[:, 1] = NaN
    Rho_Plot_Fluid2[:, Ny] = NaN

    using Plots
    plotly()
    L_Plot = grid(2, 2, heights = [1/2, 1/2])
    P_Plot = plot(st = [:heatmap], layout = L_Plot, link = :x, colorbar = :none, legend = :none)
    heatmap!(P_Plot[1], X_Plot[:, 1], Y_Plot[1, :], Jt_Plot_Fluid1.', title =       "                                                Total Momentum (Fluid 1) at Time Step = $Current_Timestep", title_location = :left, titlefont = font(6), xtickfont = font(4), xticks = 0:50:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[3], X_Plot[:, 1], Y_Plot[1, :], Rho_Plot_Fluid1.', title =      "                                                Density (Fluid 1) at Time Step = $Current_Timestep       ", title_location = :left, titlefont = font(6), xtickfont = font(4), xticks = 0:50:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[2], X_Plot[:, 1], Y_Plot[1, :], Jt_Plot_Fluid2.', title =       "Total Momentum (Fluid 2) at Time Step = $Current_Timestep                                                      ", title_location = :right, titlefont = font(6), xtickfont = font(4), xticks = 0:50:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    heatmap!(P_Plot[4], X_Plot[:, 1], Y_Plot[1, :], Rho_Plot_Fluid2.', title =      "       Density (Fluid 2) at Time Step = $Current_Timestep                                                      ", title_location = :right, titlefont = font(6), xtickfont = font(4), xticks = 0:50:Nx - 2, ytickfont = font(4), yticks = 0:50:Ny - 2, linewidth = 1, levels = 100, aspectratio = 3/4, colorbar = :none, legend = :none, color = :plasma)
    xlims!(1, Nx)
    ylims!(1, Ny)
    gui()

    # Note that to plot pressure, the Equation of State (EOS) has been altered by the multiphase model.
    # Pressure = 1/3.*Rho + 1/6.*G_Multiphase.*(Psi.^2)

  end
end
toc()
Current_Timestep = Current_Timestep - 1
println(" ")
println("Reynolds Number = ???")
println("Mach Number = ???")
println("Knudsen Number = ???")
println(" ")
println("Nu Fluid 1 = ", Nu_Fluid1, " (Kinematic Viscosity)")
println("Nu Fluid 2 = ", Nu_Fluid2, " (Kinematic Viscosity)")
println("Omega Fluid 1 = ", Omega_Fluid1, " (Relaxation Parameter (Stable if much less than 2))")
println("Omega Fluid 2 = ", Omega_Fluid2, " (Relaxation Parameter (Stable if much less than 2))")
println(" ")
println("Total Nodes = ", Nx*Ny)
println("Total Active Nodes = ", Nx*Ny - Int64(length(BBR_Indices)))
println(" ")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
println("CALCULATION COMMENCING")
println(" ")

NodeCounter_Fluid1 = 0
NodeCounter_Fluid2 = 0
for i = Gx
  for j = Gy
    if (Rho_Fluid1[i, j] >= Rho_Fluid2[i, j]) && Wall[i, j] ==0
      NodeCounter_Fluid1 = NodeCounter_Fluid1 + 1
    end
    if (Rho_Fluid2[i, j] > Rho_Fluid1[i, j]) && Wall[i, j] ==0
      NodeCounter_Fluid2 = NodeCounter_Fluid2 + 1
    end
  end
end
println(" ")
println("Fluid 1 total mass = ", (sum(sum(f_OUT, 3))./(Nx*Ny)))
println("Fluid 2 total mass = ", (sum(sum(g_OUT, 3))./(Nx*Ny)))
println("WAS FLUID MASS CONSERVED? Fluid 1 + Fluid 2 mass = ", (sum(sum(f_OUT, 3))./(Nx*Ny)) + (sum(sum(g_OUT, 3))./(Nx*Ny)), " out of 1.0")
println(" ")
println("Number of nodes (Fluid 1) = ", NodeCounter_Fluid1)
println("Number of nodes (Fluid 2) = ", NodeCounter_Fluid2)
println(" ")
println("Ratio of total nodes (Fluid 1) = ", NodeCounter_Fluid1./(Nx*Ny - Int64(length(BBR_Indices))))
println("Ratio of total nodes (Fluid 2) = ", NodeCounter_Fluid2./(Nx*Ny - Int64(length(BBR_Indices))))
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
