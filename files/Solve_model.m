nfx = zeros(size(fx));
nfx(:) = eval(fx(:));

nfxp = zeros(size(fxp));
nfxp(:)= eval(fxp(:));

nfy = zeros(size(fy));
nfy(:) = eval(fy(:));

nfyp = zeros(size(fyp));
nfyp(:)= eval(fyp(:));

nf = zeros(size(f));
nf(:)=eval(f(:));

[gx,hx] = gx_hx(nfy,nfx,nfyp,nfxp);