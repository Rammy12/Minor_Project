function hsi = rgb2hsi(rgb)
    R = rgb(:,:,1);
    G = rgb(:,:,2);
    B = rgb(:,:,3);
    
    % Compute intensity
    I = (R + G + B) / 3;
    
    % Compute saturation
    min_RGB = min(rgb, [], 3);
    S = 1 - (3 ./ (sum(rgb, 3) + eps)) .* min_RGB;
    
    % Compute hue
    num = 0.5 * ((R - G) + (R - B));
    den = sqrt((R - G).^2 + (R - B).*(G - B)) + eps;
    theta = acos(num ./ den);
    
    H = theta;
    H(B > G) = 2 * pi - H(B > G);
    H = H / (2 * pi); % Normalize hue to [0, 1]
    
    % Combine channels
    hsi = cat(3, H, S, I);
end