function [Pt_projection_lattice, Sn_projection_lattice] = createAndSmoothLattices(Pt_projection, Sn_projection, rep, sigma)
    % Create repetition of the unit cell to get a lattice
    Pt_projection_lattice = repmat(Pt_projection, rep);
    Sn_projection_lattice = repmat(Sn_projection, rep);

    % Gaussian smooth the whole lattice
    Pt_projection_lattice = imgaussfilt(Pt_projection_lattice, sigma);
    Sn_projection_lattice = imgaussfilt(Sn_projection_lattice, sigma);
end
