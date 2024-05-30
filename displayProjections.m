function displayProjections(projection, title1)
    % Display the projection
    figure;
    imagesc(projection);
    colorbar;
    title(title1);
    xlabel(' X(Å)');
    ylabel(' Y(Å)');

end
