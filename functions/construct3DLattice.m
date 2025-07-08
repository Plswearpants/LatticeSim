function lattice = construct3DLattice(coords, a, b, c)
% This function create a 3D lattice. 
    % Determine grid size proportional to lattice parameters
    gridSizeX = ceil(a);
    gridSizeY = ceil(b);
    gridSizeZ = ceil(c);
    
    % Create a 3D grid of the proportional size
    lattice = zeros(gridSizeX, gridSizeY, gridSizeZ);
    
    % Convert fractional coordinates to grid indices
    for i = 1:size(coords, 1)
        x = round(coords(i, 1) * (gridSizeX))+1;
        y = round(coords(i, 2) * (gridSizeY))+1;
        z = round(coords(i, 3) * (gridSizeZ))+1;
        lattice(x, y, z) = 1;
    end
end
