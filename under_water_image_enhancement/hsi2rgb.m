function rgb = hsi2rgb(hsi)
    H = hsi(:,:,1) * 2 * pi; % Convert back to radians
    S = hsi(:,:,2);
    I = hsi(:,:,3);
    
    % Initialize output
    R = zeros(size(H));
    G = zeros(size(H));
    B = zeros(size(H));
    
    % Compute RGB values
    idx = (H < 2*pi/3);
    B(idx) = I(idx) .* (1 - S(idx));
    R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
    G(idx) = 3*I(idx) - (R(idx) + B(idx));
    
    idx = (H >= 2*pi/3 & H < 4*pi/3);
    H(idx) = H(idx) - 2*pi/3;
    R(idx) = I(idx) .* (1 - S(idx));
    G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
    B(idx) = 3*I(idx) - (R(idx) + G(idx));
    
    idx = (H >= 4*pi/3);
    H(idx) = H(idx) - 4*pi/3;
    G(idx) = I(idx) .* (1 - S(idx));
    B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
    R(idx) = 3*I(idx) - (G(idx) + B(idx));
    
    % Combine and clip values
    rgb = cat(3, R, G, B);
    rgb = min(max(rgb, 0), 1);
end