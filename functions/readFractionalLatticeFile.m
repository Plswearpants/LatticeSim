function [Pt_coords, Sn_coords] = readFractionalLatticeFile(filename)
    % Open the file
    fid = fopen(filename, 'r');
    if fid == -1
        error('Could not open file: %s', filename);
    end
    
    % Initialize lattice parameters
    a = 1.0;
    b = 1.0;
    c = 1.0;
    
    % Initialize arrays for Pt and Sn coordinates
    Pt_coords = [];
    Sn_coords = [];
    
    % Read each line and process the contents
    while ~feof(fid)
        line = fgetl(fid);
        if isempty(line) || ischar(line) == 0 || line(1) == '#'
            continue;
        end
        
        % Check for lattice parameter lines
        if startsWith(line, 'a =')
            a = sscanf(line, 'a = %f');
        elseif startsWith(line, 'b =')
            b = sscanf(line, 'b = %f');
        elseif startsWith(line, 'c =')
            c = sscanf(line, 'c = %f');
        else
            % Split the line into components
            data = strsplit(strtrim(line));
            
            % Check if the line has at least 4 components (atom type and 3 fractional coordinates)
            if length(data) >= 4
                % Extract atom type and fractional coordinates
                atom_type = data{1};
                frac_coords = str2double(data(2:4));
                
                % Convert fractional coordinates to real coordinates
                real_coords = frac_coords .* [a, b, c];
                
                % Store coordinates in the corresponding array
                if strcmp(atom_type, 'Pt')
                    Pt_coords = [Pt_coords; real_coords];
                elseif strcmp(atom_type, 'Sn')
                    Sn_coords = [Sn_coords; real_coords];
                end
            end
        end
    end
    
    % Close the file
    fclose(fid);
end
