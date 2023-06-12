# Introduction to the problem and some resources

We're interested in simulating optically thin, radiatively inefficient accretion discs around supermassive black holes. These are the sorts of flows you see around Sagittarius A* at the centre of teh Milky Way and M87 at the centre of the Virgo cluster of galaxies. There are now famous pictures of these are radio wavelengths taken by the Event Horizon Telescope.

- [Julia and VSCode](#julia-and-vscode)
- [Gradus](#gradus)
- [GitHub](#github)
- [The problem](#the-problem)

## Julia and VSCode

If you have a Mac you might want to use the [Homebrew](https://brew.sh/) package manager.

The software is being developed in the [Julia](https://julialang.org/) programming language. This has all sorts of benefits including, 1) it is easy to read and develop, 2) there are fantastic packages that can be used for various numerical methods, 3) it has a good implementation of automatic differentiation, 4) it compiles code just ahead of time and does so very efficiently so large codes can run very quickly (comparable to C or Fortran). There are many other benefits I've not included here, such as multiple dispatch.

I have found that [Microsoft Visual Studio Code](https://code.visualstudio.com/) to be an excellent development environment which includes a Julia extension. You can run code line-by-line using the REPL (`Shift+Command+P` then `Julia: Start REPL`). Graphical output will also appear in VSCode.

## Gradus

The project is going to make extensive use of the [Gradus](https://github.com/astro-group-bristol/Gradus.jl) general relativisitc ray tracing software developed by [Fergus Baker](https://research-information.bris.ac.uk/en/persons/fergus-baker).

It would be good to install Julia, VSCode, and Gradus. Julia has an excellent package manager which you can use to install Gradus (see the [Usage](https://astro-group-bristol.github.io/Gradus.jl/dev/#Usage) section of the documentation). Here are the relevant commands. Note that `]` enters the package manager mode and `backspace` exits it.

```julia
julia>] registry add https://github.com/astro-group-bristol/AstroRegistry
julia>] add Gradus
julia> using Gradus
```

and then try to run the [Gradus examples](https://astro-group-bristol.github.io/Gradus.jl/dev/examples/examples/).

## GitHub

Fergus has a really nice [workflow example (PDF)](workflow-example.pdf) for using GitHub. For contributing to the project you can create a "fork" of this repository and then make changes to your fork. You can then make a "pull request" to merge your changes into the main repository. This is a good way to keep track of changes and to make sure that the code is always working. All the details are in Fergus' workflow example.

## The problem

### Papers

Here are some interesting papers and review articles to read.

- [Measuring Black Hole Spin Using X-Ray Reflection Spectroscopy](https://ui.adsabs.harvard.edu/abs/2014SSRv..183..277R/abstract) by Reynolds (2014).
- [First M87 Event Horizon Telescope Results. I. The Shadow of the Supermassive Black Hole](https://iopscience.iop.org/article/10.3847/2041-8213/ab0ec7) by the EHT Collaboration et al. (2019).
- [Black Hole Images as Tests of General Relativity: Effects of Spacetime Geometry](https://ui.adsabs.harvard.edu/abs/2023ApJ...942...47Y/abstract) by Younsi et al. (2023).
- [Rapid X-ray flaring from the direction of the supermassive black hole at the Galactic Centre](https://ui.adsabs.harvard.edu/abs/2001Natur.413...45B/abstract) by Baganoff et al. (2001).
- [Chandra X-Ray Spectroscopic Imaging of Sagittarius A* and the Central Parsec of the Galaxy](https://ui.adsabs.harvard.edu/abs/2003ApJ...591..891B/abstract) by Baganoff et al. (2003).

### What we (might) want to do

This is obviously a work in progress and will need some discussion! However, I think we might start by trying to create some nice images of photon rings assuming some simple background emissivity model for an optically think accretion flow. We can then look at the lensing and timing properties of "flares" within this flow at different radial and angular positions. It might also be interesting to look at special orbits in various metrics, e.g., photon spheres.
