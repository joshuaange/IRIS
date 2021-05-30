# IRIS
<img src="https://i.imgur.com/b68WLn6.png" alt="IRIS" img align="right" width="275"> The Interactive Resource Impact Simulation (IRIS) is a computer simulation that mathematically models the physical collisions of spherical supply pods onto planetary surfaces. Its purpose is to discover if this dambusting bomb-esque method of landing a payload on the moon or Mars without excess fuel or engines is a practical, survivable possibility. 

 **[Project Description](https://sites.google.com/view/lunariris/home)** |
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

### Overall Program Structure

This software follows a nested iterative looping structure.  The `iit` loop iterates from 1 to `i_max`, with each iteration defining a continuous path of motion of the center of mass of the spherical supply pod above the surface. Within each `iit` loop will be an undefined number of `jit` loops, which each define a vector of motion of the supply pod along the surface following the `iit` loop. Over the course of each scenario, necessary values are recorded in cell arrays `b(iit)` and `s(iit,jit)` appropriately.

The majority of inputs can be entered as simple variables or vectors (which, in this case, is treated as `[<X position of tail>, <Y position of tail>, <Z position of tail>; <X magnitude>, <Y magnitude>, <Z magnitude>]`). The characteristics of the terrain are entered as grayscale images with variables defining their width and maximum and minimum values. For instance, the general surface is defined in-script with arrays `L_x`, `L_y`, and `L_z`, which are defined in _terrain.m_ with the image _Surface.png_ alongside variables `domain` (which refers to the horizontal width of considered terrain (m)) and `L_max` and `L_min` (which refer to the maximum and minimum values represented in the heightmap image). For _Surface.png_, which defines the surface terrain, we use `L_max` and `L_min`. For _Friction.png_, which defines the coefficient of friction between the pod and surface, we use `F_max` and `F_min`. For _RollingFriction.png_, which defines the coefficient of rolling friction between the pod and surface, we use `F_r_max` and `F_r_min`. For _Restitution.png_, which defines the coefficient of restitution between the pod and surface, we use `K_max` and `K_min`. For _Conductivity.png_, which defines the thermal conductivity between the pod and surface (W/mK), we use `T_c_max` and `T_c_min`. For _ModulusOfRigidity.png_, which defines the modulus of rigidity of the surface (gf/mm^2), we use `G_l_max` and `G_l_min`. For _Temperature.png_, which defines the temperature of the surface (K), we use `T_g_max` and `T_g_min`. For _YoungsModulus.png_, which defines Young's Modulus of the surface (gf/mm^2), we use `Y_l_max` and `Y_l_min`. We interpolate the values of these heightmaps with the functions `L`, `F`, `F_r`, `K`, `T_c`, `G_l`, `T_g`, and `Y_l` at interpolation interval `Bi_Int`.

### Initial Conditions

All input variables can be found in _Variables.xlsx_. _start.m_ begins the simulation with a clear of prior variables and opened windows. Assuming the input _.m_ and landscape-definining images for scenario "Example" are placed within folder `\data\inputs\Example\`, simply set `file = 'Example'` to ensure the proper input variables are used.

For the sake of simplicity, the drag coefficient of the pod (`C_d`) is assumed to be 0.5, as is true for all spherical objects. The percentage of lost kinetic energy that is transferred into thermal kinetic energy (`h_R`) must be determined experimentally, but as there is no atmosphere on the lunar surface for the release of energy through vibrations, this value is assumed as a liberal 90%. The cross-sectional area of the pod (`A_s`) is similarly calculated with `(pi*(d/2)^2)`, where `d` refers to the diameter of the pod (m).

As the effect of gravity and atmospheric density must be dynamic as the pod falls through different altitudes, we can define those values according to Newton's Law of Universal Gravitation and _https://www.grc.nasa.gov/www/k-12/airplane/termv.html_. As such, we set `g(x) = (6.67430*10^-11)*((m*m_p)/((x)^2))` and `Q(x) = sqrt((2*m*g(x))/(rho*A_s*C_d))`, where `m_p` refers to the the mass of the planet (kg), `m` refers to the mass of the pod (kg), and `rho` refers to the atmospheric density (kg/m^3). These values solve for the gravitational acceleration and terminal velocity from the distance to center of planet, respectively.

For the sake of finding deformation between the pod and surface, we use formulas from _https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf_, which defines the elastic compression between a pod and flat plane. We define `sigma_p`, Poisson's ratio of the pod shell, with `(Y_p/(2*G_p))-1`, where `Y_p` defines Young’s Modulus of the pod shell (gf/mm^2) and `G_p` defines the modulus of rigidity of the pod shell (gf/mm^2). Similarly, we define `M_p`, another material property of the pod shell (mm^2/gf), with `(1-sigma_p^2)/(pi*Y_p)`.

One possibility allowed is that of a parachute becoming engaged prior to the pod collides with the surface as is denoted when `parachute = 1`. This would be most beneficial elsewhere than the lunar environment and assumes a ideal conditions: the parachute is engaged immediately and perfectly, the parachute becomes detached after the pod's collision with the terrain, the pod engages in no spin prior to collision with the terrain. As the ideal drag coefficient of parachutes is 1.75, we assume the combined drag coefficient between the pod and parachute (`C_d_o`) would be 1.5. We then define `Q_o(x)`, the terminal velocity (with parachute) from the distance to center of planet, as `sqrt((2*(m+m_o)*g(x))/(rho*A_o*C_d_o))`, where `m_o` refers to the mass of the parachute (kg) and `A_o` refers to the area of the parachute (m^2). We set `t_o` to the time after initial launch that this parachute is instantaneously opened.

Lastly, we define a sphere with `p_num`-by-`p_num` faces with matrices `X_sphere`, `Y_sphere`, and `Z_sphere` and its dimensional sizes with `A_limit` and `B_limit`.
