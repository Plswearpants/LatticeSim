function updateTickLabels(targetSize, resolution)
    % Note that here the pixel size is the resolution (Angstrom)
    x_size = targetSize(1);

    % Define the physical size of the image
    physicalSize = resolution * x_size; % in angstrom

    % Set the ticks for pixels
    pixelTicks = linspace(0, x_size, 11); % 11 ticks from 0 to x_size

    % Set the corresponding physical units for the ticks
    physicalTicks = linspace(0, physicalSize, 11);

    % Apply the new tick labels
    xticks(pixelTicks);
    yticks(pixelTicks);
    xticklabels(physicalTicks);
    yticklabels(physicalTicks);
end
