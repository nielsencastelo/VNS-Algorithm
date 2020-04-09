  N = 4;
  [D,x] = cheb(N);
  SL = -D*diag(1-x.^2)*D;
  [U,Lambda] = eig(SL);
  [lambda,jsort] = sort(diag(Lambda));
  
  % Sort eigenvectors into order of increasing lambda, and
  % normalize to have value 1 at x=1. Resulting eigenvectors
  % will be the columns of Usort.
  
  Usort = zeros(N+1,N+1);
  for j = 1:(N+1)
    Usort(:,j) = U(:,jsort(j))/U(1,jsort(j));
  end

    % Plot eigenfunctions interpolated between Chebyshev points
  xx = (-1:.01:1)';
  Uex = zeros(length(xx),N);      % Correct eigenfns:
  Uex(:,1) = 1;                   % P0(x)
  Uex(:,2) = xx;                  % P1(x)
  Uex(:,3) = 0.5*(3*xx.^2 - 1);   % P2(x)
  Uex(:,4) = 0.5*(5*xx.^3 - 3*xx);% P3(x)
  
  subplot(2,2,1)
  plot(xx,Uex,'-')
  xlabel('x')
  ylabel('y')
  title('Eigenfunctions of N=4 Chebyshev soln to Legendre Eqn.')
  hold on
  T4 = 1 - 8*xx.^2 + 8*xx.^4;     % Spurious eigenfn. T4(x)
  plot(xx,T4,'m--')
  legend('P_0','P_1','P_2','P_3','T_4')
  
  % Plot the eigenvectors from Matlab, separating spurious numerical one to
  % keep plot colors straight.
  
  plot(x,Usort(:,2:5),'x')
  hold on
  plot(x, Usort(:,1),'mx',x,ones(5,1),'b*',x,[1;-1;1;-1;1],'m*')
  
  hold off