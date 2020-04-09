% HW4p1 solution script. Plots the Laplace transform integral 
%
%  I(s) = int_0^infty ds*exp(-st)/sqrt(1+t) 
%
% vs. s, evaluated using the change of variable 
%
%  t = (1+x)/(1-x)
% 
% using Clenshaw-Curtis quadrature with N=10 over the interval -1<x<1 and
% Plot the (t(xj),f(xj)) corresponding to the quadrature points xj,
% the solution and its error vs. exact (erfc) solution for s = 0.1:0.1:10, and
% convergence of the s = 0.1 solution vs. N over a range of N.

  smin = 0.1;
  smax = 10;
  ds = 0.1;
  ns = round((smax-smin)/ds)+1;
  N = 10;
  [x,w] = clencurt(N); % x is a column vector, w a row vector
  xf = x(2:N+1); % f corresponds to 'finite' quadrature points excluding x=1
                 % <-> t=infty.
  tf = (1+xf)./(1-xf);
  dtfdxf = 2./(1-xf).^2;
  
  s = smin + (0:(ns-1))*ds; 
  
  % Vectorize quadrature to do all s simultaneously by constructing
  % an N x ns matrix whose columns are the integrand g(x;s) =
  % f(t(x),s)dt/dx for each s (excluding g(x=1;s), which is zero
  % since x=1 corresponds to t = infty). 

  gf = exp(-tf*s).*repmat(dtfdxf./sqrt(1+tf),1,ns);  
  I = w(2:(N+1))*gf;                        % Row vector (1 x ns) of integrals
  Iex = sqrt(pi./s).*exp(s).*erfc(sqrt(s)); % Exact values of integrals

  subplot(2,2,1)
  plot(s,I,'x',s,Iex,'-')
  xlabel('s')
  ylabel('I(s)')
  legend('Cheb N=10','Exact')
 
  % Error convergence for s = 0.1; only |s <= 2| shown.
 
  subplot(2,2,2)
  plot(s,(I-Iex)./Iex,'x')
  xlim([0 2])
  xlabel('s')
  ylabel('relative error in I(s)')

  s = 0.1
  subplot(2,2,3)
  xplt = -1:0.01:0.99;
  tplt = (1+xplt)./(1-xplt);
  dtdx = 2./(1-xplt).^2;
  gplt = exp(-tplt*s).*dtdx./sqrt(1+tplt);  

  plot(xplt,tplt,'b--',[xplt 1],[gplt 0],'r-')
  xlabel('x')
  legend('t(x)','g(x)',2)
  hold on
  plot(xf,tf,'b+',[xf; 1],[gf(:,1); 0],'rx')
  hold off
  ylim([0 50])
  title('N = 10 Quadrature Points and Integrand')

  subplot(2,2,4)
  nk = 10;
  relerr = zeros(1,nk);
  for k = 1:nk
    N = 5*k;
    [x,w] = clencurt(N); % x is a column vector, w a row vector
    xf = x(2:N+1); % f corresponds to 'finite' quadrature points excluding x=1
                   % <-> t=infty.
    tf = (1+xf)./(1-xf);
    dtfdxf = 2./(1-xf).^2;
    gf = exp(-tf*s).*dtfdxf./sqrt(1+tf);  
    I = w(2:(N+1))*gf;     
    Iex = sqrt(pi./s).*exp(s).*erfc(sqrt(s)); % Exact value
    relerr(k) = abs(I-Iex)/Iex;
  end
  Nrange = 5*(1:nk);
  semilogy(Nrange,relerr,'x')
  title('I(s = 0.1) error convergence')
  xlabel('N')
  ylabel('relative error in I(s)')
