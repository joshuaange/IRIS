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

This software follows a nested iterative looping structure.  The `iit` loop iterates from 1 to `i_max`, with each iteration defining a continuous path of motion of the center of mass of the spherical supply pod above the surface. Within each `iit` loop will be an undefined number of `jit` loops, which each define a vector of motion of the supply pod along the surface following the `iit` loop.

The majority of inputs can be entered as simple variables or vectors (which, in this case, is treated as `[<X position of tail>, <Y position of tail>, <Z position of tail>; <X magnitude>, <Y magnitude>, <Z magnitude>]`). The characteristics of the terrain are entered as black-and-white images with variables defining their width and maximum and minimum values. For instance, the general surface is defined in-script with arrays `L_x`, `L_y`, and `L_z`, which are defined _terrain.m_ with the image _surface.png_ alongside variables `Domain`, `L_max`, and `L_min`.