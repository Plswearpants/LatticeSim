# LatticeSim
LatticeSim simulates lattice Bragg peaks associated with different projection planes. 
This repository contains MATLAB scripts and functions for simulating and visualizing 3D atomic lattices, particularly focusing on Pt and Sn sublattices. The main script processes lattice data performs Gaussian smoothing and generates advanced visualizations, including Fourier Transform analysis.

## Objectives

- **Lattice Simulation**: Read fractional coordinates from input files and construct 3D lattice models for Pt and Sn atoms, representing the atomic arrangement in a crystal structure based on specified lattice parameters.
- **Lattice Projection and Processing**: Project 3D lattice models onto 2D planes specified by a direction (a, b, or c), with functionality to filter and keep only the topmost non-empty layers during projection.
- **Data Manipulation**: Repeat projected 2D lattices to create larger lattices, apply Gaussian filters for smoothing, and crop to desired dimensions.
- **Advanced Visualization**: Visualize processed lattice data and their Fourier Transforms (FFT), exploring the effects of varying Gaussian smoothing parameters (sigma) and the number of layers retained in the projection.
- **FFT Analysis**: Use FFT to analyze the periodicity and spatial frequency characteristics of the processed lattice data and visualize the results alongside the original data.
- **Automated Plotting and Saving**: Generate and save visualizations to specified directories, facilitating organized and automated data analysis workflows.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/plswearpants/LatticeSim.git

## Functions 
- **readAndConstructLattices**: Reads fractional coordinates from a file and constructs 3D lattice models for Pt and Sn atoms.
- **projectLattices**: Projects 3D lattices onto specified 2D planes with optional layer filtering.
- **projectLatticeToPlane**: Filters topmost non-empty layers of a 3D lattice along a specified direction and projects the lattice onto a plane.
- **readFractionalLatticeFile**: Reads fractional coordinates and lattice parameters from an input file.
- **construct3DLattice**: Constructs a 3D lattice from coordinates and lattice parameters.
- **createAndSmoothLattices**: Creates repeated unit cells and applies Gaussian smoothing.
- **cropLattices**: Crops the lattice to desired dimensions.
- **displayProjections**: Displays the projected lattice.
- **updateTickLabels**: Updates tick labels to show physical units in the spatial domain.
- **performAndDisplayFFT**: Performs FFT on cropped lattices and displays the results.
- **centerCropLattice**: Crops the lattice to the desired dimension.
- **updateTickLabelsFFT**: Updates tick labels to show physical units in the frequency domain.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
