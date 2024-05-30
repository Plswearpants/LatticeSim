function performAndDisplayFFT(Pt_cropped, Sn_cropped, targetSize, resolution)
    fprintf('Fourier transforming lattice \n');
    Pt_cropped_q = abs(fftshift(fft2(Pt_cropped - mean(Pt_cropped, 'all'))));
    Sn_cropped_q = abs(fftshift(fft2(Sn_cropped - mean(Sn_cropped, 'all'))));
    
    % Display FFT for Pt lattice
    figure;
    imagesc(Pt_cropped_q);
    colorbar;
    title('FFT of Pt Cropped Lattice');
    updateTickLabelsFFT(targetSize, resolution);
    xlabel('Frequency (1/Å)');
    ylabel('Frequency (1/Å)');
    
    % Display FFT for Sn lattice
    figure;
    imagesc(Sn_cropped_q);
    colorbar;
    title('FFT of Sn Cropped Lattice');
    updateTickLabelsFFT(targetSize, resolution);
    xlabel('Frequency (1/Å)');
    ylabel('Frequency (1/Å)');
end
