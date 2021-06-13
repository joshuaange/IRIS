# IRIS
<img src="https://i.imgur.com/b68WLn6.png" alt="IRIS" img align="right" width="275"> The Interactive Resource Impact Simulation (IRIS) is a computer simulation that mathematically models the physical collisions of spherical supply pods onto planetary surfaces. Its purpose is to discover if this dambusting bomb-esque method of landing a payload on the moon or Mars without excess fuel or engines is a practical, survivable possibility. 

 **[Home](https://sites.google.com/view/lunariris/home)** |
 **[Research](https://sites.google.com/view/lunariris/research)** |
 **[Development](https://sites.google.com/view/lunariris/development)** |
 **[Pod Design](https://sites.google.com/view/lunariris/pod-design)** |
 **[Misc.](https://sites.google.com/view/lunariris/misc)** |
 **[About Us](https://sites.google.com/view/lunariris/about-us)**

### Author

 - **Joshua Ange** 

### Built With

<img src="https://www.mathworks.com/company/newsletters/articles/the-mathworks-logo-is-an-eigenfunction-of-the-wave-equation/_jcr_content/mainParsys/image_2.adapt.480.high.gif/1469941373397.gif" alt="IRIS" width="20"> **[MATLAB R2020a](https://www.mathworks.com/products/matlab.html)**
 
### Versioning

We use [SemVer](http://semver.org/) for versioning. 
 - **Pure Math Model** : v0.0.1 - v1.2.5
 - **Computer Model** : [v1.3.0 - v2.0.0](https://github.com/joshuaange/IRIS/tags)

### Acknowledgments

- **Amber Glory** : [NASA Hunch Teammate](https://sites.google.com/view/lunariris/)
- **Jonathan Andrews** : [NASA Hunch Teammate](https://sites.google.com/view/lunariris/)
- **Joseph Abboud** : [PodSim](https://github.com/SpamSPez/PodSim)
- **Reilly Moore** : [PodSim](https://github.com/SpamSPez/PodSim)
- **Michael Hayes** : [iSchool of Lewisville (CAPSTONE / Engineering)](https://sites.google.com/responsiveed.com/capstoneengineering)
- **Glenn Johnson** : [NASA Hunch Mentor](glenn.f.johnson@nasa.gov)
- **Ally Westover** : [NASA Hunch Mentor](allison.r.westover@nasa.gov)

## Documentation

### 1 Program Structure

This software follows a nested iterative looping structure.  The `iit` loop iterates from 1 to `i_max`, with each iteration defining a continuous path of motion of the center of mass of the spherical supply pod above the surface. Within each `iit` loop will be an undefined number of `jit` loops, which each define a vector of motion of the supply pod along the surface following the `iit` loop. Over the course of each scenario, necessary values are recorded in cell arrays `b(iit)` and `s(iit,jit)` appropriately.

The majority of inputs can be entered as simple variables or vectors (which, in this case, is treated as `[<X position of tail>, <Y position of tail>, <Z position of tail>; <X magnitude>, <Y magnitude>, <Z magnitude>]`). The characteristics of the terrain are entered as grayscale images with variables defining their width and maximum and minimum values. For instance, the general surface is defined in-script with arrays `L_x`, `L_y`, and `L_z`, which are defined in _terrain.m_ with the image _Surface.png_ alongside variables `domain` (which refers to the horizontal width of considered terrain (m)) and `L_max` and `L_min` (which refer to the maximum and minimum values represented in the heightmap image). For _Surface.png_, which defines the surface terrain, we use `L_max` and `L_min`. For _Friction.png_, which defines the coefficient of friction between the pod and surface, we use `F_max` and `F_min`. For _RollingFriction.png_, which defines the coefficient of rolling friction between the pod and surface, we use `F_r_max` and `F_r_min`. For _Restitution.png_, which defines the coefficient of restitution between the pod and surface, we use `K_max` and `K_min`. For _Conductivity.png_, which defines the thermal conductivity between the pod and surface (W/mK), we use `T_c_max` and `T_c_min`. For _ModulusOfRigidity.png_, which defines the modulus of rigidity of the surface (gf/mm^2), we use `G_l_max` and `G_l_min`. For _Temperature.png_, which defines the temperature of the surface (K), we use `T_g_max` and `T_g_min`. For _YoungsModulus.png_, which defines Young's Modulus of the surface (gf/mm^2), we use `Y_l_max` and `Y_l_min`. We interpolate the values of these heightmaps with the functions `L`, `F`, `F_r`, `K`, `T_c`, `G_l`, `T_g`, and `Y_l` at interpolation interval `Bi_Int`.

### 2 Initial Conditions

All input variables can be found in _Variables.xlsx_. _start.m_ begins the simulation with a clear of prior variables and opened windows. Assuming the input _.m_ and landscape-definining images for scenario "Example" are placed within folder `\data\inputs\Example\`, simply set `file = 'Example'` to ensure the proper input variables are used.

For the sake of simplicity, the drag coefficient of the pod (`C_d`) is assumed to be 0.5, as is true for all spherical objects. The percentage of lost kinetic energy that is transferred into thermal kinetic energy (`h_R`) must be determined experimentally, but as there is no atmosphere on the lunar surface for the release of energy through vibrations, this value is assumed as a liberal 90%. The cross-sectional area of the pod (`A_s`) is similarly calculated with `(pi*(d/2)^2)`, where `d` refers to the diameter of the pod (m).

As the effect of gravity and atmospheric density must be dynamic as the pod falls through different altitudes, we can define those values according to Newton's Law of Universal Gravitation and _https://www.grc.nasa.gov/www/k-12/airplane/termv.html_. As such, we set `g(x) = (6.67430*10^-11)*((m*m_p)/((x)^2))` and `Q(x) = sqrt((2*m*g(x))/(rho*A_s*C_d))`, where `m_p` refers to the the mass of the planet (kg), `m` refers to the mass of the pod (kg), and `rho` refers to the atmospheric density (kg/m^3). These values solve for the gravitational acceleration and terminal velocity from the distance to center of planet, respectively.

For the sake of finding deformation between the pod and surface, we use formulas from _https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf_, which defines the elastic compression between a pod and flat plane. We define `sigma_p`, Poisson's ratio of the pod shell, with `(Y_p/(2*G_p))-1`, where `Y_p` defines Young’s Modulus of the pod shell (gf/mm^2) and `G_p` defines the modulus of rigidity of the pod shell (gf/mm^2). Similarly, we define `M_p`, another material property of the pod shell (mm^2/gf), with `(1-sigma_p^2)/(pi*Y_p)`.

One possibility allowed is that of a parachute becoming engaged prior to the pod collides with the surface as is denoted when `parachute = 1`. This would be most beneficial elsewhere than the lunar environment and assumes a ideal conditions: the parachute is engaged immediately and perfectly, the parachute becomes detached after the pod's collision with the terrain, the pod engages in no spin prior to collision with the terrain. As the ideal drag coefficient of parachutes is 1.75, we assume the combined drag coefficient between the pod and parachute (`C_d_o`) would be 1.5. We then define `Q_o(x)`, the terminal velocity (with parachute) from the distance to center of planet, as `sqrt((2*(m+m_o)*g(x))/(rho*A_o*C_d_o))`, where `m_o` refers to the mass of the parachute (kg) and `A_o` refers to the area of the parachute (m^2). We set `t_o` to the time after initial launch that this parachute is instantaneously opened.

Lastly, we define a sphere with `p_num`-by-`p_num` faces with matrices `X_sphere`, `Y_sphere`, and `Z_sphere` and its dimensional sizes with `A_limit` and `B_limit`.

### 3 Trajectory

#### 3.1 Parametric Equations of Motion

The trajectory of the pod is defined, first of all, with the simple parametric equations of motion. As gravity and terminal velocity becomes dynamic over the course of changing altitude, we use _trajectory.m_ to construct _construct.m_, which defines the trajectory. As `u_i` defines the initial velocity for this trajectory, we define `t_A_last = -0.0000000000001`, `t_A_vel = u_i(2,3)`, and `t_A_pos = u_i(1,3)+L_min`, which act as the last "time", "velocity", and "altitude" for a looping dynamic function. We take the position functions including atmospheric resistance from _http://farside.ph.utexas.edu/teaching/336k/Newtonhtml/node29.html_. For the horizontal directions `x_i(t)` and `y_i(t)`, we assume the gravity and terminal velocity to be constant between an average of the minimum value of the terrain and the trajectory's initial altitude for simplicity and define them as `(u_i(2,1)*Q((t_A_pos+L_min)/2))/g((t_A_pos+L_min)/2)*(1-exp((-g((t_A_pos+L_min)/2)*t)/Q((t_A_pos+L_min)/2)))+u_i(1,1)` and `(u_i(2,2)*Q((t_A_pos+L_min)/2))/g((t_A_pos+L_min)/2)*(1-exp((-g((t_A_pos+L_min)/2)*t)/Q((t_A_pos+L_min)/2)))+u_i(1,2)`, respectively.

For `z_i(t)`, we define a piecewise function, where `(Q(t_A_pos)/g(t_A_pos)) * ((t_A_vel)+Q(t_A_pos)) * (1-exp((-g(t_A_pos)*(t-t_A_last))/Q(t_A_pos))) - (Q(t_A_pos)*(t-t_A_last)) + t_A_pos` (where values of variables are printed rather than kept as variables) is true for `t_A_last<=t<t_A_last+t_A_int`, where `t_A_int` is the interval of time used where gravity and terminal velocity are constant (s). Subsequently, we define `t_A_pos = double(z_i(t_A_int))`, `t_A_diff = diff(z_i)`, and `t_A_vel = double(t_A_diff(t_A_int))` for the subsequent position and beginning velocity. `t_A_last` is stepped forward by `t_A_int`. If `t_A_pos <= L_min`, meaning the trajectory has reached a point below the minimum altitude of the surface, we close the loop and the position function derivatives are defined as `dx_idt = diff(x_i)`, `dy_idt = diff(y_i)`, and `dz_idt = diff(z_i)`. If `parachute = 1`, a similar process as above is engaged once more, where the above equations for `x_i(t)`, `y_i(t)`, and `z_i(t)` are transformed into similar piecewise functions after `t_o`, where terminal velocity becomes defined by `Q_o(x)` rather than `Q(x)`.

#### 3.2 Finding Collision Along Trajectory

In _pod.m_, we find the collision point along the trajectory with the terrain. This begins with the intersection point between the position function and `L(x)`. We define `GAP = abs(L(x_i((t_A_last + t_A_int - t_step)),y_i((t_A_last + t_A_int - t_step)))-z_i((t_A_last + t_A_int - t_step)))`, where `t_step` is the smallest interval used to step along the trajectory (s), `t_int_step` is the interval used to find the intersection of the trajectory (s), and `GAP` is the distance between the altitude of the trajectory function and the terrain at the same horizontal coordinates (m). The variable `t_p` is stepped by `-t_int_step` from `(t_A_last + t_A_int - t_step)` (the time of the trajectory below `L_min`) to `0`. If `abs(L(x_i(t_p),y_i(t_p))-z_i(t_p)) < GAP`, we know this point in the trajectory is closer to the surface than the previously recorded one, so its value becomes `GAP` and `t_f_i` (the point of intersection) becomes `t_p`. Once `z_i(t_p) > L_max`, we know the trajectory will not encounter any more terrain, so we set `t_p_min = t_p`. If no value of `t_p_min` is found, it is set to `0`. `t_inter` is set to `t_f_i`.

As it is probable for a "partial collision" prior to the intersection point, we can search for the collision of a three-dimensional pod shape in sections ranging from intervals of `t_stride` (the largest interval used to step along the trajectory (s)) to `t_step`. We define `t_move` first as `t_stride`. The variable `t_p` is stepped by `-t_move` from `min(t_inter,t_f_i+11*t_move)` to `max(t_p_min, t_f_i-11*t_move)` and we define the spherical pod shape for `t_p` with `X_moved = X_sphere*(d/2)+x_i(t_p)`, `Y_moved = Y_sphere*(d/2)+y_i(t_p)`, and `Z_moved = Z_sphere*(d/2)+z_i(t_p)`. We cycle through every discrete pod coordinate with `m_A` and `m_B` and if `abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B)) <= GAP` for any point, we consider `t_p` to be a closer collision (bearing in mind that `GAP` must be `>=d/2`). When this is true, we define `C_i = [x_i(t_p),y_i(t_p),z_i(t_p)]` (the center point for the pod), `X_i = X_moved`, `Y_i = Y_moved`, `Z_i = Z_moved` (the arrays dictating edge points of the pod), and `t_f_i = t_p`. Once every value of `t_p` is "looped through", we divide `t_move` by 10 and repeat the iterative process. This continues until `t_move <= t_step`, at which point the final collision time (`t_f_i`) and gap value (`GAP`) can be defined. The average impact point of the pod with the terrain (`S_i`) can then be defined by cycling through every discrete pod coordinate with`m_A` and `m_B` and forming the average of points that satisfy the conditions when `abs(L(X_i(m_A,m_B),Y_i(m_A,m_B))-Z_i(m_A,m_B)) < s_min`.

#### 3.3 Ending Values

Finally, the ending values of the trajectory can be determined. The ending velocity `v_i` is defined as `[S_i(1),S_i(2),S_i(3); dx_idt(t_f_i),dy_idt(t_f_i),dz_idt(t_f_i)]` and ending acceleration `a_i` is defined as `[S_i(1),S_i(2),S_i(3); dx2_idt(t_f_i),dy2_idt(t_f_i),dz2_idt(t_f_i)]`, where `dx2_idt`, `dy2_idt`, and `dz2_idt` refer to the second position function derivatives. The ending rotation `I_i` (from assumed constant angular velocity `q_i`) is defined as `[S_i(1),S_i(2),S_i(3); q_i(2,1) * t_f_i, q_i(2,2) * t_f_i, q_i(2,3) * t_f_i]`. If any value in `I_i(2,*)` is `>= 2*pi`, `2*pi` is subtracted. If any value in `I_i(2,*)` is `<= 2*pi`, `2*pi` is added. The initial kinetic energy of the trajectory (`KE_s_i`) can be defined as `0.5*m*mag(u_i)^2` and the final kinetic energy of the trajectory (`KE_f_i`) can be defined as `0.5*m*mag(v_i)^2`.

To prepare for the subsequent time segment, these values are translated into values for the jit loop, as in the initial kinetic energy (`KE_s_ij = KE_f_i`), angular velocity (`q_ij = q_i`), position along terrain (`S_ij = S_i`), velocity (`v_ij = v_i`), acceleration (`a_ij = a_i`), position of center of pod (`C_ij = C_i`), uniform temperature of pod shell (`T_s_ij = T_i`, where `T_i` defines the initial temperature of the pod shell for the trajectory), and rotation (`I_ij = I_i`).

It is at this point that values are saved to cell array `b(iit)`.

### 4 Segments

#### 4.1 directions.m

The time segment `iit, jit` of the pod is defined with a series of calculations of forces and reactions from the impact along the surface. _direction.m_ calculates helpful values (such as the tangent plane and normal vector of initial position) and the initial applied force and gravitational force. At position `S_i`, we find the tangent plane `NN_ij` with `@(x,y) dNNdx*(x-S_ij(1))+dNNdy*(y-S_ij(2))+S_ij(3)` and the normal vector `N_ij` with `[S_ij(1),S_ij(2),S_ij(3); -dNNdx,-dNNdy,1]`, where `dNNdx` and `dNNdy` refer to partial derivative values along the x and y axes at the impact position with minimum value `derivative_min` (with `double(dLdx(vpa(S_ij(1)),vpa(S_ij(2))))` and `double(dLdy(vpa(S_ij(1)),vpa(S_ij(2))))`, respectively, where `dLdx(x,y)` and `dLdy(x,y)` find said partial derivative values at interval `2*Bi_Int`).

We consider the force of initial impact (`F_v_ij`) to be equal to `[C_ij(1), C_ij(2), C_ij(3); m*a_ij(2,1), m*a_ij(2,2), m*a_ij(2,3)]`. We do not consider this value to be applicable to the motion of the pod, itself, only as a metric for the normal force. We consider the force of gravity (`F_g_ij`) to be equal to `[C_ij(1), C_ij(2), C_ij(3); 0, 0, -g(C_ij(3))]`.

Lastly, for the sake of the normal force and, at one point an estimation of the full number of time segments, we calculate the component aspects of `F_v_ij` as `P_ij` and `B_ij` for the projected parallel and perpendicular components to the tangent plane `NN_ij`. "Parallel Vector" `P_ij` is found with `PN_ij = F_v_ij(2,:)-((dot(F_v_ij(2,:),N_ij(2,:)))/((mag(N_ij))^2)).*N_ij(2,:)` as is derived from _http://sites.science.oregonstate.edu/math/home/programs/undergrad/CalculusQuestStudyGuides/vcalc/dotprod/dotprod.html_, and `P_ij = [C_ij(1),C_ij(2),C_ij(3); PN_ij(1), PN_ij(2), PN_ij(3)]`. "Perpendicular Vector" `B_ij` is found first by solving for its magnitude (`B_m_ij`) with `max(real(vpasolve((mag([C_ij(1)+P_ij(2,1),C_ij(2)+P_ij(2,2),C_ij(3)+P_ij(2,3); VAL*dNNdx,VAL*dNNdy,VAL*(-1)]))^2 + (mag(P_ij))^2 == (mag(F_v_ij))^2, VAL)))` at a minimum of `B_m_min`. `B_ij` is then found with `[C_ij(1)+P_ij(2,1),C_ij(2)+P_ij(2,2),C_ij(3)+P_ij(2,3); B_m_ij*dNNdx,B_m_ij*dNNdy,B_m_ij*(-1)]`.

Lastly, as is derived from _https://www.researchgate.net/publication/270681194_Estimation_of_the_Impact_Duration_for_Several_Types_of_Structures_, we estimate the proper number of time segments for an ideal elastic collision. `Kt_V`, the full downwards impact velocity, is found with `(mag(B_ij)/m)*T`, which is used to find the linear stiffness of the pod (`k_lin = (pi/3.21)^2 * (m*(k_H^4)*(Kt_V^2))^(1/5)`) and final impact duration (`T_HS = pi*sqrt(m/k_lin)`), which is, in turn, used to find the number of ideal time segments (`Kt_i = (T_HS)/T`, `Kt_i = round(Kt_i)`, and `if Kt_i < 1 \n Kt_i = 1 \n end`).

#### 4.2 reactions.m

Similar to the component aspects of initial velocity (`P_ij` and `B_ij`), we find the component aspects of the gravitational force, using `PGN_ij` rather than `PN_ij`, `PG_ij` rather than `P_ij`, and `BG_ij` rather than `B_ij`. From `BG_ij` and `B_ij`, we can find the normal force (`F_N_ij`), as is derived from _http://hyperphysics.phy-astr.gsu.edu/hbase/frict.html_. If `jit<=Kt_i`, we consider the normal force as having ongoing impact and define it as `[C_ij(1) C_ij(2) C_ij(3); -(B_ij(2,1)+BG_ij(2,1)), -(B_ij(2,2)+BG_ij(2,2)), -(B_ij(2,3)+BG_ij(2,3))]`. Otherwise, we assume the duration is complete and define `F_N_ij = [C_ij(1) C_ij(2) C_ij(3); 0 0 0]`.

The force of elasticity (`F_e_ij`) is simply calculated by multiplying the normal force by the Coefficient of Restitution (and dividing by `Kt_i` to ensure a complete ideal collision). We define `F_e_ij = [C_ij(1),C_ij(2),C_ij(3); 0, 0, 0]`. If `jit<=Kt_i`, we set `F_e_ij(2,1) = K(S_ij(1),S_ij(2))*(mag(s{iit,1}.F_N_ij)/Kt_i) * cos(falpha(F_N_ij))`, `F_e_ij(2,2) = K(S_ij(1),S_ij(2))*(mag(s{iit,1}.F_N_ij)/Kt_i) * cos(fbeta(F_N_ij))`, and `F_e_ij(2,3) = K(S_ij(1),S_ij(2))*(mag(s{iit,1}.F_N_ij)/Kt_i) * cos(fgamma(F_N_ij))`.

To calculate the force of friction, as derived from _http://hyperphysics.phy-astr.gsu.edu/hbase/frict.html_, it must be applied in the opposite direction of a segment vector. We calculate a tentative traced segment vector `O_ij` with `[C_ij(1),C_ij(2),C_ij(3); v_ij(2,1)*T + 0.5*(F_g_ij(2,1)+F_R_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T^2, v_ij(2,2)*T + 0.5*(F_g_ij(2,2)+F_R_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T^2, v_ij(2,3)*T + 0.5*(F_g_ij(2,3)+F_R_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3))/m * T^2]`. From this, we can define the force of friction (`F_f_ij`) with `[C_ij(1),C_ij(2),C_ij(3); -F(S_ij(1),S_ij(2))*mag(F_N_ij)*cos(falpha(O_ij)), -F(S_ij(1),S_ij(2))*mag(F_N_ij)*cos(fbeta(O_ij)), -F(S_ij(1),S_ij(2))*mag(F_N_ij)*cos(fgamma(O_ij))]`.

We additionally calculate the change in spin and its impact on linear velocity. We define the angular acceleration (`p_ij`) with `[S_ij(1),S_ij(2),S_ij(3);((d/2)*B_ij(2,1))/I, ((d/2)*B_ij(2,2))/I, ((d/2)*B_ij(2,3))/I]`, from the torque of the applied force `F_v_ij` and `I`, the moment of inertia of pod (kg m^2), which can be found at _http://hyperphysics.phy-astr.gsu.edu/hbase/isph.html_. This value can be used to find the new angular velocity after `T` seconds (`Q_ij`) with `[S_ij(1),S_ij(2),S_ij(3);q_ij(2,1)+p_ij(2,1)*T,q_ij(2,2)+p_ij(2,2)*T,q_ij(2,3)+p_ij(2,3)*T]`, where `q_ij` is the pre-existing angular velocity. To find how this impacts the linear velocity, we must know the "time to rolling without slipping" for each axis (`t_R_x`, `t_R_y`, and `t_R_z`), which is calculated with a tentative final linear velocity (as found from `V_ij = [C_ij(1),C_ij(2),C_ij(3); v_ij(2,1) + (F_g_ij(2,1)+F_f_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T, v_ij(2,2) + (F_g_ij(2,2)+F_f_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T, v_ij(2,3) + (F_g_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3)+F_f_ij(2,3))/m * T]`). `t_R_x`, `t_R_y`, and `t_R_z` are then found with `vpasolve((V_ij(2,1)-v_ij(2,1))/T * t + v_ij(2,1) == (d/2)*((Q_ij(2,1)-q_ij(2,1))/T * t + q_ij(2,1)))`, `vpasolve((V_ij(2,2)-v_ij(2,2))/T * t + v_ij(2,2) == (d/2)*((Q_ij(2,2)-q_ij(2,2))/T * t + q_ij(2,2)))`, and `vpasolve((V_ij(2,3)-v_ij(2,3))/T * t + v_ij(2,3) == (d/2)*((Q_ij(2,3)-q_ij(2,3))/T * t + q_ij(2,3)))`, respectively. We find the force applied to linear velocity with `F_R_ij = [S_ij(1),S_ij(2),S_ij(3);m*(q_ij(2,2)*(d/2)-V_ij(2,1))/t_R_x,m*(-q_ij(2,1)*(d/2)-V_ij(2,2))/t_R_y,m*(NN_ij(S_ij(1)+q_ij(2,2)*(d/2)-V_ij(2,1),S_ij(2)-q_ij(2,1)*(d/2)-V_ij(2,2))-S_ij(3)-V_ij(2,3))/t_R_z]` (if any of the coordinate times to rolling without slipping is 0, we set the force along that axis to 0, as well)) which calculates a clockwise orthogonal vector to `q_ij` (with the `z` component placed along the terrain) and find its difference with `V_ij`, which tells us the change in velocity across the "time to rolling without slipping" (and is subsequently multiplied by `m`for the force).

#### 4.3 pod.m

We then find the pod's ending movement for segment `iit,jit` with segment vector `O_ij`, which we define as `[C_ij(1),C_ij(2),C_ij(3); v_ij(2,1)*T + 0.5*(F_g_ij(2,1)+F_f_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T^2, v_ij(2,2)*T + 0.5*(F_g_ij(2,2)+F_f_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T^2, v_ij(2,3)*T + 0.5*(F_g_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3)+F_f_ij(2,3))/m * T^2`. This finds the movement of the pod following formula for displacement `s = u*t + 0.5*a*t^2`, which provides the end result of motion given the initial velocity and applied forces for `T` seconds if there was no terrain. We first find the new pod coordinates `Xn_ij`, `Yn_ij`, and `Zn_ij` and center point `Cn_ij` as a direct translation from the tail to the head of the `O_ij`. These values are calculated with `X_sphere*(d/2) + double(C_ij(1)+O_ij(2,1))`, `Y_sphere*(d/2) + double(C_ij(2)+O_ij(2,2))`, `Z_sphere*(d/2) + double(C_ij(3)+O_ij(2,3))`, and `C_ij + O_ij`, respectively.

We first calculate the new pod position if the center of the displaced pod is under the terrain (if `if Cn_ij(3) < L(Cn_ij(1),Cn_ij(2))`) We calculate `R_ij = [Cn_ij(1),Cn_ij(2),L(Cn_ij(1),Cn_ij(2))]` as the center position of the pod translated onto the terrain. This is inaccurate for long distances, as the position is only translated directly vertically, not tangentially to the terrain, but suits smaller values of `T` fine. We know the normal vector of this position will be `Nn_ij = [R_ij(1),R_ij(2),R_ij(3); -dRdx,-dRdy,1]`, where `dRdx` and `dRdy` refer to partial derivative values along the x and y axes at `R_ij` with minimum value `derivative_min` (with `double(dLdx(R_ij(1),R_ij(2)))` and `double(dLdy(R_ij(1),R_ij(2)))`, respectively). From this, we find the values of `Xn_ij`, `Yn_ij`, `Zn_ij` and `Cn_ij` with `X_sphere*(d/2)+R_ij(1)+(d/2)*cos(falpha(Nn_ij))`, `Y_sphere*(d/2)+R_ij(2)+(d/2)*cos(fbeta(Nn_ij))`, `Z_sphere*(d/2)+R_ij(3)+(d/2)*cos(fgamma(Nn_ij))`, and `[R_ij(1)+(d/2)*cos(falpha(Nn_ij)),R_ij(2)+(d/2)*cos(fbeta(Nn_ij)),R_ij(3)+(d/2)*cos(fgamma(Nn_ij))]`, respectively, which essentially sets the pod shape one `d/2` in the normal direction of `R_ij`.

There is additionally the possibility that the pod lies someone intersecting with the terrain, which allows us to act with more specificity than `R_ij = [Cn_ij(1),Cn_ij(2),L(Cn_ij(1),Cn_ij(2))]`. As such, we utilize a `try/catch/end` function in which we cycle through every discrete pod coordinate with `m_A` and `m_B` and if `abs(L(Xn_ij(m_A,m_B),Yn_ij(m_A,m_B))-Zn_ij(m_A,m_B)) < s_min` for any point, we add `c+1` to `c`, `X_total+Xn_ij(m_A,m_B)` to `X_total`, `Y_total+Yn_ij(m_A,m_B)` to `Y_total`, and `Z_total+Zn_ij(m_A,m_B)` to `Z_total`. `R_ij` can then be found with `[(X_total/c),(Y_total/c),(Z_total/c)];`. This averages every intersecting point of the pod with the terrain, to find the ideal center position. We know the normal vector of this position will be `Nn_ij = [R_ij(1),R_ij(2),R_ij(3); -dRdx,-dRdy,1]`, where `dRdx` and `dRdy` refer to partial derivative values along the x and y axes at `R_ij` with minimum value `derivative_min` (with `double(dLdx(R_ij(1),R_ij(2)))` and `double(dLdy(R_ij(1),R_ij(2)))`, respectively). From this, we find the values of `Xn_ij`, `Yn_ij`, `Zn_ij` and `Cn_ij` with `X_sphere*(d/2)+R_ij(1)+(d/2)*cos(falpha(Nn_ij))`, `Y_sphere*(d/2)+R_ij(2)+(d/2)*cos(fbeta(Nn_ij))`, `Z_sphere*(d/2)+R_ij(3)+(d/2)*cos(fgamma(Nn_ij))`, and `[R_ij(1)+(d/2)*cos(falpha(Nn_ij)),R_ij(2)+(d/2)*cos(fbeta(Nn_ij)),R_ij(3)+(d/2)*cos(fgamma(Nn_ij))]`, respectively, which essentially sets the pod shape one `d/2` in the normal direction of `R_ij`.

Lastly, the final segment vector displacement is found with these new positions with `O_ij = [C_ij(1),C_ij(2),C_ij(3); Cn_ij(1)-C_ij(1),Cn_ij(2)-C_ij(2),Cn_ij(3)-C_ij(3)]`.

#### 4.4 final.m

Finally, we're able to calculate the necessary values for the subsequent collision. We can find the ending velocity (`V_ij`) with `[C_ij(1),C_ij(2),C_ij(3); v_ij(2,1) + (F_g_ij(2,1)+F_R_ij(2,1)+F_f_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T, v_ij(2,2) + (F_g_ij(2,2)+F_R_ij(2,2)+F_f_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T, v_ij(2,3) + (F_g_ij(2,3)+F_R_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3)+F_f_ij(2,3))/m * T]` and acceleration (`A_ij`) with `[C_ij(1),C_ij(2),C_ij(3); (V_ij(2,1) - v_ij(2,1))/T, (V_ij(2,2) - v_ij(2,2))/T, (V_ij(2,3) - v_ij(2,3))/T]`.

To find the deformation of the pod, we calculate the elastic compression of a sphere and plane with formulas from _https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf_. The tangential impact force `FI_ij` is `-mag(F_N_ij)`. Similar to `sigma_p` and `M_p`, we can find `sigma_l_ij` and `M_l_ij` with `(Y_l(S_ij(1),S_ij(2))+Y_l(R_ij(1),R_ij(2)))/(2*(G_l(S_ij(1),S_ij(2))+G_l(R_ij(1),R_ij(2)))) - 1` and `(1-sigma_l_ij^2)/(pi*((Y_l(S_ij(1),S_ij(2))+Y_l(R_ij(1),R_ij(2)))/2))`, respectively. As such, the elastic compressibility `D_ij` (m) is found with derived formula `((((3*pi)/2)^(2/3))*((101.97*abs(FI_ij))^(2/3))*((M_l_ij+M_p)^(2/3))*((1/(1000*d))^(1/3)))/(1000)`.

The change in Kinetic Energy `deltaKE_ij` and final Kinetic Energy `KE_f_ij` for the time segment can be found with `0.5*m*(mag(V_ij) - mag(v_ij))^2 + 0.5*I*(mag(Q_ij) - mag(q_ij))^2` and `KE_f_ij = KE_s_ij + deltaKE_ij`, respectively.

Lastly, we calculate the change in temperature from `T_s_ij` to `T_f_ij`. To perform this, we utilize Newton's Law of Cooling (as provided by _https://www.omnicalculator.com/physics/newtons-law-of-cooling#:~:text=Newton's%20law%20of%20cooling%20formula,-The%20Newton's%20law&text=T%20%5BK%5D%20is%20the%20temperature,object%20at%20the%20time%20t%20%2C&text=T_initial%20%5BK%5D%20is%20the%20initial,the%20time%20of%20the%20cooling._) for conduction and Specific Heat Capacity (as provided by _https://www.omnicalculator.com/physics/specific-heat_) for lost kinetic energy. As such, the final temperature (from conduction) is calculated with `T_f_ij = (T_g(S_ij(1),S_ij(2))) + (T_s_ij - (T_g(S_ij(1),S_ij(2)))) * exp(- h_c_ij * T)`, where `h_c_ij`,the cooling coefficient (1/s), is calculated with `h_t_ij * (SA_g_ij / h_C)` (where `h_C` is the heat capacity of the pod's external material in J/K) and `SA_g_ij`, the area of heat transfer (and area of spherical cap `D_ij` in m^2), is calculated with `2*pi*(d/2)*D_ij`. In these formulas, we utilize the heat transfer coefficient `h_t_ij` (W/m^2K) as found with `(h_f_ij)/(T_s_ij-(T_g(S_ij(1),S_ij(2))))` (unless `T_s_ij=(T_g(S_ij(1),S_ij(2)))`, in which chase `h_t_ij=0`) and heat flux `h_f_ij` (W/m^2) as found with Fourier's Law in the form `(T_c(S_ij(1),S_ij(2)))*(T_s_ij-T_g(S_ij(1),S_ij(2)))/D_ij` (unless `D_ij=0`, in which chase `h_f_ij=0`). We additionally calculate the temperature change as arising from lost kinetic energy with `T_f_ij = T_f_ij + (m*((1/3 * pi * (D_ij)^2 * (3*(d/2) - D_ij))/(4/3 * pi * (d/2)^3)))*((h_R*deltaKE_ij)/(h_C*m))` if `deltaKE_ij<0`. In this case, the change in temperature is found by multiplying a  modified specific heat capacity value (in K/kg), where `h_R` refers to the ratio of lost kinetic energy that is converted into thermal energy, by the average mass of the spherical cap defined by `D_ij`.

#### 4.5 survivability.m

With the values we've calculated, we're able to find the likelihood of destruction for the pod and its contents.

For the pod, we calculate comparisons to the maximum service temperature (K) `T_max` between the initial and final temperatures (with `(T_s_ij)/(T_max)` and `(T_f_ij)/(T_max)`), to the maximum rate of temperature change (K/s) `deltaT` (with `(abs(T_f_ij-T_s_ij)/T)/deltaT`, to the yield strength of the pod shell (Pa) `E_l` (with `((abs(FI_ij))/(A_s))/E_l`), to the fracture toughness of the pod shell (MPa m^0.5) `K_c` (with `((((abs(FI_ij))/(A_s^2))/1000000)*(sqrt(SA_g_ij)))/K_c`), to the maximum force withstood by the pod shell (N/m^2) `FI_max` (with `((abs(FI_ij))/A_s)/FI_max`), to the tensile strength of the pod shell (Pa) `F_tu` (with `((abs(FI_ij))/(A_s))/F_tu`). We consider the maximum of these values to be the value of `S_pod_ij`, which is the "destruction metric" of the pod. A survivable scenario will have this value below `1`. We perform similar calculations for the pod contents with the deformation as compred to the pod's thickness (m) `d_shell` (with `(abs(D_ij))/d_shell`), the maximum angular acceleration of the contents (rad/s^2) `omega_max_c` (with `mag(p_ij)/omega_max_c`), and similar calculations to above, except with the equivalent `_c` variables, which refer to the variable of contents rather than pod shell (`((abs(FI_ij))/(A_s))/FI_max_c`, `(T_s_ij)/(T_max_c)`, `(T_f_ij)/(T_max_c)`, and `(abs(T_f_ij-T_s_ij)/T)/deltaT_c`).

It is at this point that values are saved to cell array `s(iit,jit)`.

#### 4.6 Return

We find return value `r` with `Cn_ij(3) - L(Cn_ij(1),Cn_ij(2))` to denote distance above the terrain. If `-v_min<double(mag(V_ij))<=v_min`, the pod has halted movement and we exit the loop.

If `r>(d/2+r_min) && jit>=Kt_i` or `r>(d/2+r_edge)`, a subsequent "in-air trajectory" is considered. The former condition describes the end of an "ideal" trajectory and pod position above the terrain, while the latter denotes a form of unpredictable movement (such as the pod rolling off a cliff). As such, we translate current values of velocity, rotational velocity, and temperature with `u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3)); double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))]`, `q_i = double(Q_ij)`, and `T_i = double(T_f_ij)`.

If none of the above conditions are satisfied, we follow a subsequent `jit` loop and time segment. Prior to this, we translate kinetic energy (`KE_s_ij = vpa(KE_f_ij)`), velocity (`v_ij = double(V_ij)`), acceleration (`a_ij = double(A_ij)`), rotational velocity (`q_ij = double(Q_ij)`), center point of pod (`C_ij = double(Cn_ij)`), pod shell temperature (`T_s_ij = double(T_f_ij)`), and impact position (`S_ij = double(R_ij)`) for the subsequent time segment.
