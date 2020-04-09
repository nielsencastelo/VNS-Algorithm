  tp = 1;   % Time between contour plots of zeta and psi
  tf = 40;  % Final integration time

  KEav = zeros(3,round(tf/tp)+1);		 
  zetasqav = zeros(3,round(tf/tp)+1);

  makeplot = 1;
  col = 'bgr';
  for p = 1:3
    N = 2^(8-p)
    [K, zetahatsq, KEav(p,:),zetasqav(p,:)]= FS_2Dturb(N,tp,tf, ...
						  makeplot);
    if (p==1)
      figure(5)
      loglog(K,zetahatsq,[col(p) '.'])
      makeplot=0;% Logical flag for making pcolor plots at tf of zeta(x,y),
                 % psi(x,y), noise G, and power spectrum
                 % |zetahat|^2/N^2.  
      ylim([1e-8 1])
      xlabel('K_{np}')
      ylabel('Z_{np}')
      title('Vorticity power spectrum')
      hold on
    else
      loglog(K,zetahatsq,[col(p) '.'])
    end
  end

  legend('N=128','N=64','N=32',3)
  loglog(3:30,2*(3:30).^(-2),'k')
  text(10,.05,'K^{-2} fit line')
  
  hold off

  figure(2)
  subplot(2,2,1)
  plot(tav,KEav)
  title('<KE>')
  legend('N=128','N=64','N=32',2)
  subplot(2,2,2)
  plot(tav,zetasqav)
  xlabel('t')
  title('<\eta^2>')
  legend('N=128','N=64','N=32')


  