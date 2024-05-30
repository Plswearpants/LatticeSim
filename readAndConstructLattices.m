function [Pt_lattice, Sn_lattice] = readAndConstructLattices(filename, a, b, c)
    % Read the fractional coordinates from the file
    [Pt_coords, Sn_coords] = readFractionalLatticeFile(filename);

    % Construct the 3D lattice for Pt atoms
    Pt_lattice = construct3DLattice(Pt_coords, a, b, c);

    % Construct the 3D lattice for Sn atoms
    Sn_lattice = construct3DLattice(Sn_coords, a, b, c);
end
