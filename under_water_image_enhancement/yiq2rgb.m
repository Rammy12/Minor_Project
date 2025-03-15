function rgb = yiq2rgb(yiq)
    T = [1.000, 0.956, 0.621;
         1.000, -0.272, -0.647;
         1.000, -1.106, 1.703];
    rgb = reshape((T * reshape(yiq, [], 3)')', size(yiq));
    rgb = min(max(rgb, 0), 1); % Clip values between 0 and 1
end