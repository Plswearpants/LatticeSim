function [projection] = projectLattices(lattice, direction, n)
    if nargin < 4
        % Project the 3D lattice onto the plane without layer filtering
        projection = projectLatticeToPlane(lattice, direction);
    else
        % Project the 3D lattice onto the plane with layer filtering
        projection = projectLatticeToPlane(lattice, direction, n);
    end
end
