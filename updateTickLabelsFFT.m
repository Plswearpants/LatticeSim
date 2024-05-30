function updateTickLabelsFFT(targetSize, resolution)
    % Calculate the number of pixels along one dimension
    x_size = targetSize(1);

    % Calculate the frequency resolution based on the spatial resolution and the number of pixels
    freq_res = 1 / (x_size * resolution);

    % Define the range of frequencies to be displayed based on the size of the image
    % Normally it goes from -N/2 to N/2 in FFT
    freq_range = linspace(-x_size/2, x_size/2 - 1, x_size) * freq_res;

    % Set the ticks for frequency
    num_ticks = 11;  % Number of ticks
    tick_indices = linspace(1, x_size, num_ticks);
    tick_labels = freq_range(round(tick_indices));

    % Apply the new tick labels
    xticks(tick_indices);
    yticks(tick_indices);
    xticklabels(round(tick_labels, 3));  % Round for cleaner display
    yticklabels(round(tick_labels, 3));
end
