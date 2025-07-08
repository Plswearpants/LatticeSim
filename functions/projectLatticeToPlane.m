function projection = projectLatticeToPlane(lattice, direction, n)
    % projectLatticeToPlane Projects a 3D lattice onto a specified plane and filters topmost layers.
    % 
    % This function filters the topmost n non-empty layers of a 3D lattice
    % along the specified direction and projects the lattice onto a plane
    % normal to that direction. The resulting projection accumulates the
    % depth information of the atoms in the filtered lattice.
    %
    % Inputs:
    %   - lattice: 3D matrix representing the atomic lattice
    %   - direction: A character specifying the direction of the projection ('a', 'b', or 'c')
    %   - n: Number of topmost non-empty layers to keep (default is all layers)
    %
    % Outputs:
    %   - projection: 2D matrix representing the projected lattice
    %
    % Example:
    %   projection = projectLatticeToPlane(lattice, 'b', 10);
    %
    %   This example projects the 3D lattice onto the plane normal to the
    %   'b' direction and keeps the topmost 10 non-empty layers.

    % Get the size of the lattice
    [nx, ny, nz] = size(lattice);
    
    % Initialize the filtered lattice
    filtered_lattice = zeros(nx, ny, nz);
    
    % Filter the topmost n non-empty layers
    switch direction
        case 'a'
            non_empty_layers = find(squeeze(sum(sum(lattice, 2), 3)) > 0);
        case 'b'
            non_empty_layers = find(squeeze(sum(sum(lattice, 1), 3)) > 0);
        case 'c'
            non_empty_layers = find(squeeze(sum(sum(lattice, 1), 2)) > 0);
        otherwise
            error('Invalid direction. Choose ''a'', ''b'', or ''c''.');
    end
    
    % If n is not provided, keep all non-empty layers
    if nargin < 3
        n = length(non_empty_layers);
    end
    
    % Check if n exceeds the number of non-empty layers
    if n > length(non_empty_layers)
        error('n exceeds the number of non-empty layers in the lattice.');
    end
    
    % Keep only the topmost n non-empty layers, including the nth layer
    top_layers = non_empty_layers(1:n);
    
    switch direction
        case 'a'
            filtered_lattice(top_layers, :, :) = lattice(top_layers, :, :);
        case 'b'
            filtered_lattice(:, top_layers, :) = lattice(:, top_layers, :);
        case 'c'
            filtered_lattice(:, :, top_layers) = lattice(:, :, top_layers);
    end
    
    % Find all indices where filtered lattice is 1
    [x_indices, y_indices, z_indices] = ind2sub(size(filtered_lattice), find(filtered_lattice == 1));
    
    % Initialize the projection matrix
    switch direction
        case 'a'
            projection = zeros(ny, nz);
            % Iterate through the found indices and update the projection
            for i = 1:length(x_indices)
                y = y_indices(i);
                z = z_indices(i);
                x = x_indices(i);
                projection(y, z) = projection(y, z) + (nx - x);
            end
        case 'b'
            projection = zeros(nx, nz);
            % Iterate through the found indices and update the projection
            for i = 1:length(y_indices)
                x = x_indices(i);
                z = z_indices(i);
                y = y_indices(i);
                projection(x, z) = projection(x, z) + (ny - y);
            end
        case 'c'
            projection = zeros(nx, ny);
            % Iterate through the found indices and update the projection
            for i = 1:length(z_indices)
                x = x_indices(i);
                y = y_indices(i);
                z = z_indices(i);
                projection(x, y) = projection(x, y) + (nz - z);
            end
        otherwise
            error('Invalid direction. Choose ''a'', ''b'', or ''c''.');
    end
end
