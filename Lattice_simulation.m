%% Data Initialization

% Define lattice parameters (unit Angstrom)
a = 6.40450;
b = 11.30870;
c = 6.36460;
resolution = 0.1;

% Adjust lattice parameters based on resolution
a = a / resolution;
b = b / resolution;
c = c / resolution;

% Read and construct lattices
[Pt_lattice, Sn_lattice] = readAndConstructLattices('ptsn4_single_tbs.xtl', a, b, c);

%% Data Processing

% Define the normal direction for the projection
direction = 'a'; % Example: projecting along the b-axis
num_layer_Pt = 2; % Number of topmost non-empty layers to keep (optional)
num_layer_Sn = 4; % Number of topmost non-empty layers to keep (optional)

% Project the 3D lattice onto the plane with optional filtering
[Pt_projection] = projectLattices(Pt_lattice, direction, num_layer_Pt);
[Sn_projection] = projectLattices(Sn_lattice, direction, num_layer_Sn);

% Create repetition of the unit cell to get a lattice and smooth it
rep=10;
sigma=5;
[Pt_projection_lattice, Sn_projection_lattice] = createAndSmoothLattices(Pt_projection, Sn_projection,rep,sigma);

% Crop the lattice to the desired dimension
targetSize = [500, 500]; % Note that here the pixel size is the resolution (Angstrom)
[Pt_cropped, Sn_cropped] = cropLattices(Pt_projection_lattice, Sn_projection_lattice, targetSize);

%% Data Visualization

% Display the raw projections
displayProjections(Pt_projection,'Raw Pt Sublattice');
displayProjections(Sn_projection,'Raw Sn Lattice');

% Display the processed projections
displayProjections(Pt_cropped, 'Cropped Pt Lattice');
updateTickLabels(targetSize, resolution);

displayProjections(Sn_cropped, 'Cropped Sn Lattice');
updateTickLabels(targetSize, resolution);

% Perform FFT on the cropped lattices and display the results
performAndDisplayFFT(Pt_cropped, Sn_cropped, targetSize, resolution);

%% Advanced Visualization with Varying Sigma Values
saveDir = 'G:\Dong\OneDrive - phas.ubc.ca\300Science\320 PtSn4_phD\323 Data processing and plotting\Gridmap&QPI_processing\scripts\General\006_Output\Lattice simulation'; % Directory to save the plots
sigmas = [5, 8, 10, 12]; % Sigma values for Gaussian smoothing

for i = 1:length(sigmas)
    sigma = sigmas(i);
    
    % Project and process lattice
    Sn_projection = projectLatticeToPlane(Sn_lattice, direction, num_layer);
    Sn_projection_lattice = repmat(Sn_projection, 10);
    Sn_projection_lattice = imgaussfilt(Sn_projection_lattice, sigma);
    Sn_cropped = centerCropLattice(Sn_projection_lattice, targetSize);
    
    % Perform FFT
    Sn_cropped_q = abs(fftshift(fft2(Sn_cropped - mean(Sn_cropped, 'all'))));
    
    % Create figure with two subplots
    figure;
    
    % Subplot for cropped image
    subplot(1, 2, 1);
    imagesc(Sn_cropped);
    axis equal;
    axis tight;
    colorbar;
    title(sprintf('Cropped Image, \\sigma = %d', sigma));
    xlabel('X (Å)');
    ylabel('Y (Å)');
    updateTickLabels(targetSize, resolution);
    
    % Subplot for FFT
    subplot(1, 2, 2);
    imagesc(Sn_cropped_q);
    axis equal;
    axis tight;
    colorbar;
    title(sprintf('FFT, \\sigma = %d', sigma));
    xlabel('Frequency (1/Å)');
    ylabel('Frequency (1/Å)');
    updateTickLabelsFFT(targetSize, resolution);
    % Save the figure
    saveas(gcf, fullfile(saveDir, sprintf('Sn_Lattice_Sigma_%d.pdf', sigma)));
end

%% Advanced Visualization with Varying Number of Layers

num_layer_values = [1, 2, 3, 4]; % Number of layers to vary
sigma = 10; % Fixed sigma value for Gaussian smoothing

for i = 1:length(num_layer_values)
    num_layer = num_layer_values(i);
    
    % Project and process lattice
    Sn_projection = projectLatticeToPlane(Sn_lattice, direction, num_layer);
    Sn_projection_lattice = repmat(Sn_projection, 10);
    Sn_projection_lattice = imgaussfilt(Sn_projection_lattice, sigma);
    Sn_cropped = centerCropLattice(Sn_projection_lattice, targetSize);
    
    % Perform FFT
    Sn_cropped_q = abs(fftshift(fft2(Sn_cropped - mean(Sn_cropped, 'all'))));
    
    % Create figure with two subplots
    figure;
    
    % Subplot for cropped image
    subplot(1, 2, 1);
    imagesc(Sn_cropped);
    axis equal;
    axis tight;
    colorbar;
    title(sprintf('Cropped Image, Num Layers = %d', num_layer));
    xlabel('X (Å)');
    ylabel('Y (Å)');
    updateTickLabels(targetSize, resolution);
    
    % Subplot for FFT
    subplot(1, 2, 2);
    imagesc(Sn_cropped_q);
    axis equal;
    axis tight;
    colorbar;
    title(sprintf('FFT, Num Layers = %d', num_layer));
    xlabel('Frequency (1/Å)');
    ylabel('Frequency (1/Å)');
    updateTickLabelsFFT(targetSize, resolution);
    % Save the figure
    saveas(gcf, fullfile(saveDir, sprintf('Sn_Lattice_Num_Layers_%d.pdf', num_layer)));
end
