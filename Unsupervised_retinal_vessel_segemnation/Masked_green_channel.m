function [I_G_mask]=Masked_green_channel(I_mask,G)
I_mask=imbinarize(I_mask);
I_G_mask=G;
I_G_mask(~I_mask)=0; % Set pixels outside the mask to 0 (black)
end