# LSPIS

<html>  
<body>  
  <table>  
    <tr>  
      <td width="700">The Lunar Supply Pod Impact Simulation (LSPIS) is a computer model meant to simulate collisions from a supply pod onto the lunar (or Martian) surface without fuel or pre-existing structures. We hope to discover if this method of delivery is a practical possibility to deliver supplies to residents on the moon. It calculates in-air trajectories, changes in velocity, changing environment, changes in spin, deformation, elasticity, and both elastic and inelastic collisions from different initial conditions and demonstrates the forces and survivability of the pod (and its contents) when dropped onto the surface.

\
General presentations and information can be seen [here](https://sites.google.com/view/lunar-supply-pods).</td>  
      <td><img src="https://i.imgur.com/b68WLn6.png" alt="LSPIS"></td>  
    </tr>  
  </table>  
</body>  
</html>  

## Example Usage

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. As of current experimental development, the project requires a MATLAB and Simulink license to run.

1. Download latest release (v1.3.0)
2. Clear *Test Output* document
3. Open *start.m* and input the initial conditions

    (*start.m* for the initial conditions of [1.2.5 (8/10/20) Comparison Data](https://docs.google.com/document/d/1UaSsgVu8Rk4wNMqUWcixTLCLEq9EOTmeIq7yFU6eM3U/edit?usp=sharing)):

    ```matlab
    clear
    clc
    close all

    % Variables iit and jit iterate for in-air trajectories and 
    % on-ground time segments respectively.  The following variables 
    % set the maximum limits of their for loops.  If jitMax is too 
    % low (meaning it registers as still continuing along the 
    % ground), the result will be an error.
    iitMax = 25;
    jitMax = 60;
    % Acceptable range of velocity to be considered 0
    stopRange = 0.01;
    % Limits of surface mesh minimum, maximum, and interval
    domainMin = -10;
    domainMax = 10;
    domainInt = 0.33;
    % Limits (time) of trajectory display
    trajectoryMin = -1;
    trajectoryMax = 10;

    % Terrain (Surface Topology)
    L = @(x,y) 0*x + 0*y + 0;
    % Terrain (Spring Constant)
    K = @(x,y) 0*x + 0*y + 15;
    % Terrain (Proportion of Friction)
    F = @(x,y) 0*x + 0*y + 0.1;
    % Terrain (Proportion of Rolling Friction)
    R = @(x,y) 0*x + 0*y + 0;
    % Terrain (Young's Modulus)
    Y = @(x,y) 0*x + 0*y + 4180836470;
    % Terrain (Modulus of Rigidity)
    G = @(x,y) 0*x + 0*y + 2141404040;

    % General
    mass = 0.14;
    gravity = 9.81;
    airDensity = 1.2;
    surfaceArea = 0.012;
    dragCoefficient = 0.5;
    T = 0.008;
    diameter = 0.0627;
    podYoungsMod = 265126210;
    podModRigidity = 219238980;

    % Initial Conditions
    velocityStart = [0 0 1; 2.7 0.0001 0];

    run('control.m')
    ```

4. Click *run*
5. Open *Test Output* for important variable outputs or look at *s* and *b* cell arrays for all outputs

    (*Test Output* for the initial conditions of [1.2.5 (8/10/20) Comparison Data](https://docs.google.com/document/d/1UaSsgVu8Rk4wNMqUWcixTLCLEq9EOTmeIq7yFU6eM3U/edit?usp=sharing)):

    ```
    i = 1
    "j (Air) = 1, Velocity: 4.142"
    i = 2
    "j (Ground) = 1, Velocity: 3.7507"
    "j (Air) = 2, Velocity: 3.3953"
    i = 3
    "j (Ground) = 1, Velocity: 3.1036"
    "j (Air) = 2, Velocity: 2.8314"
    i = 4
    "j (Ground) = 1, Velocity: 2.6066"
    "j (Air) = 2, Velocity: 2.3918"
    i = 5
    "j (Ground) = 1, Velocity: 2.2135"
    "j (Air) = 2, Velocity: 2.0399"
    i = 6
    "j (Ground) = 1, Velocity: 1.8951"
    "j (Air) = 2, Velocity: 1.7521"
    i = 7
    "j (Ground) = 1, Velocity: 1.6323"
    "j (Air) = 2, Velocity: 1.5127"
    i = 8
    "j (Ground) = 1, Velocity: 1.4121"
    "j (Air) = 2, Velocity: 1.3109"
    i = 9
    "j (Ground) = 1, Velocity: 1.2255"
    "j (Air) = 2, Velocity: 1.1392"
    i = 10
    "j (Ground) = 1, Velocity: 1.0661"
    "j (Air) = 2, Velocity: 0.99199"
    i = 11
    "j (Ground) = 1, Velocity: 0.92904"
    "j (Air) = 2, Velocity: 0.86507"
    i = 12
    "j (Ground) = 1, Velocity: 0.81059"
    "j (Air) = 2, Velocity: 0.7552"
    i = 13
    "j (Ground) = 1, Velocity: 0.70789"
    "j (Air) = 2, Velocity: 0.6598"
    i = 14
    "j (Ground) = 1, Velocity: 0.61862"
    "j (Air) = 2, Velocity: 0.57678"
    i = 15
    "j (Ground) = 1, Velocity: 0.54086"
    "j (Air) = 2, Velocity: 0.50441"
    i = 16
    "j (Ground) = 1, Velocity: 0.47305"
    "j (Air) = 2, Velocity: 0.44126"
    i = 17
    "j (Ground) = 1, Velocity: 0.41385"
    "j (Air) = 2, Velocity: 0.38611"
    i = 18
    "j (Ground) = 1, Velocity: 0.36213"
    "j (Air) = 2, Velocity: 0.3379"
    i = 19
    "j (Ground) = 1, Velocity: 0.31692"
    "j (Air) = 2, Velocity: 0.29576"
    i = 20
    "j (Ground) = 1, Velocity: 0.27739"
    "j (Air) = 2, Velocity: 0.2589"
    i = 21
    "j (Ground) = 1, Velocity: 0.24282"
    "j (Air) = 2, Velocity: 0.22665"
    i = 22
    "j (Ground) = 1, Velocity: 0.21257"
    "j (Air) = 2, Velocity: 0.19844"
    i = 23
    "j (Ground) = 1, Velocity: 0.1861"
    "j (Ground) = 2, Velocity: 0.17375"
    "j (Ground) = 3, Velocity: 0.16295"
    "j (Ground) = 4, Velocity: 0.15215"
    "j (Ground) = 5, Velocity: 0.14269"
    "j (Ground) = 6, Velocity: 0.13325"
    "j (Ground) = 7, Velocity: 0.12497"
    "j (Ground) = 8, Velocity: 0.11671"
    "j (Ground) = 9, Velocity: 0.10946"
    "j (Ground) = 10, Velocity: 0.10224"
    "j (Ground) = 11, Velocity: 0.095895"
    "j (Ground) = 12, Velocity: 0.089589"
    "j (Ground) = 13, Velocity: 0.084031"
    "j (Ground) = 14, Velocity: 0.078521"
    "j (Ground) = 15, Velocity: 0.073657"
    "j (Ground) = 16, Velocity: 0.068844"
    "j (Ground) = 17, Velocity: 0.06459"
    "j (Ground) = 18, Velocity: 0.060387"
    "j (Ground) = 19, Velocity: 0.056668"
    "j (Ground) = 20, Velocity: 0.053"
    "j (Ground) = 21, Velocity: 0.04975"
    "j (Ground) = 22, Velocity: 0.046551"
    "j (Ground) = 23, Velocity: 0.043714"
    "j (Ground) = 24, Velocity: 0.040926"
    "j (Ground) = 25, Velocity: 0.038452"
    "j (Ground) = 26, Velocity: 0.036025"
    "j (Ground) = 27, Velocity: 0.03387"
    "j (Ground) = 28, Velocity: 0.031761"
    "j (Ground) = 29, Velocity: 0.029887"
    "j (Ground) = 30, Velocity: 0.028058"
    "j (Ground) = 31, Velocity: 0.026432"
    "j (Ground) = 32, Velocity: 0.024848"
    "j (Ground) = 33, Velocity: 0.023441"
    "j (Ground) = 34, Velocity: 0.022074"
    "j (Ground) = 35, Velocity: 0.02086"
    "j (Ground) = 36, Velocity: 0.019685"
    "j (Ground) = 37, Velocity: 0.018642"
    "j (Ground) = 38, Velocity: 0.017636"
    "j (Ground) = 39, Velocity: 0.016743"
    "j (Ground) = 40, Velocity: 0.015886"
    "j (Ground) = 41, Velocity: 0.015127"
    "j (Ground) = 42, Velocity: 0.014401"
    "j (Ground) = 43, Velocity: 0.013759"
    "j (Ground) = 44, Velocity: 0.013148"
    "j (Ground) = 45, Velocity: 0.012609"
    "j (Ground) = 46, Velocity: 0.012098"
    "j (Ground) = 47, Velocity: 0.011648"
    "j (Ground) = 48, Velocity: 0.011225"
    "j (Ground) = 49, Velocity: 0.010853"
    "j (Ground) = 50, Velocity: 0.010504"
    "j (Ground) = 51, Velocity: 0.010198"
    "j (N) = 52, Velocity: 0.0099121"
    END
    ```

## Built With

- [MATLAB](https://www.mathworks.com/products/matlab.html)
- [Simulink](https://www.mathworks.com/products/simulink.html)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

1. MAJOR version: *Feature-complete* 
2. MINOR version: S*pecific large-scale goal*
3. PATCH version: S*pecific small-scale goal*

See versions [here](https://sites.google.com/view/lunar-supply-pods/work).

## Authors

- **Joshua Ange** - *Math Modeling and Simulation, Overall Program Structure*
- **Jonathan Andrews** - *User Interface Development, Pod CAD Design*
- **Amber Glory** - *Publication Management, Pod Design and Integration*

## Acknowledgments

- **Joseph Abboud** - [PodSim](https://github.com/SpamSPez/PodSim)
- **Reilly Moore** - [PodSim](https://github.com/SpamSPez/PodSim)
- **Michael Hayes** - [iSchool of Lewisville (CAPSTONE / Engineering)](https://sites.google.com/responsiveed.com/capstoneengineering)
- **Glenn Johnson** - [NASA Hunch Mentor](glenn.f.johnson@nasa.gov)
- **Ally Westover** - [NASA Hunch Mentor](allison.r.westover@nasa.gov)
