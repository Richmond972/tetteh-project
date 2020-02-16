x=0:0.01:pi;

N = 21;

uN = zeros(1,length(x)); % dc component
for n=1:N
  uN = uN + (1/((2*n)-1)) * sin( ((2*n) -1)*x );
end

u = (4/pi) * uN;
plot(x,u)
xlabel('x')
ylabel('u(x)')
hold 
y=1;
plot(x,y*ones(size(x)))