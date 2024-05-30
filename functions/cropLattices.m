function [Pt_cropped, Sn_cropped] = cropLattices(Pt_projection_lattice, Sn_projection_lattice, targetSize)
    % Crop the lattice to the desired dimension
    r1 = centerCropWindow2d(size(Pt_projection_lattice), targetSize);
    Pt_cropped = imcrop(Pt_projection_lattice, r1);

    r2 = centerCropWindow2d(size(Sn_projection_lattice), targetSize);
    Sn_cropped = imcrop(Sn_projection_lattice, r2);
end
