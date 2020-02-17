%Program 6 from trefethen(Spectral Method in Matlab)


N = 128; h = 2*pi/N; x = h*(1:N); t = 0; dt = h/4;
c = 1;
v = sin(2*x); vold = sin(2*x-.2*dt);
% Time-stepping by leap frog formula:
tmax = 20; tplot = .15; clf, drawnow
plotgap = round(tplot/dt); dt = tplot/plotgap;
nplots = round(tmax/tplot);
data = [v; zeros(nplots,N)]; tdata = t;
for i = 1:nplots
for n = 1:plotgap
t = t+dt;
v_hat = fft(v);
w_hat = 1i*[0:N/2-1 0 -N/2+1:-1] .* v_hat;
w = real(ifft(w_hat));
vnew = vold - 2*dt*c.*w; vold = v; v = vnew;
end
data(i+1,:) = v; tdata = [tdata; t];
end
waterfall(x,tdata,data), view(10,70), colormap([0 0 0])
axis([0 2*pi 0 tmax 0 5]), ylabel t, zlabel u, grid off