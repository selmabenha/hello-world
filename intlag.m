function [err,t,f,x,p]=intlag(n)

%
for i=1:n+1
  t(i)=cos((2*(i-1)+1)*pi/(2*(n+1)));
  f(i)=funct(t(i));
end
%
%we're gonna write random stuff and say random stuff here to get the point
%across

%calcul de la valeur du polynome d interpolation au point x(i)
%
m=1000;
err=0;
for i=1:m+1
  x(i)=-1+(2.*(i-1))/m;
  p(i)=0;
  for j=1:n+1
    p(i) = p(i) + f(j) * phi(j,n,x(i),t);
  end
  err = max(err,abs(p(i)-funct(x(i))));
end
end
%calcul de phi_j (la j_ieme fonction de la base de Lagrange)
function basis = phi(j,n,xx,t)   
basis=1;
for k=1:n+1
  if k ~= j
    basis = basis * (xx-t(k))/(t(j)-t(k));
  end
end
end
%fonction a interpoler
function f = funct(xx);
f = 1/(1+25*xx*xx);
end
