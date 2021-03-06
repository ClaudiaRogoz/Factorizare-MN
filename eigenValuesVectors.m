function [l,X]=eigenValuesVectors(A)
	[X,lambda] = eig(A);
	[n, n] = size(A);
	lambda = diag(lambda);
	for i = 1 : n
		l(i) = sqrt(lambda(i))/(2*pi);
	end
	for i = 1 : n
		for j = 1: n 
			X(j,i)= X(j,i)/X(n,i);
		endfor
	endfor
	clf;
	x = 0:n-1;
	for i = 1:n
		subplot(n/2,n-n/2,i);	
		plot(x,X(:,i));
	endfor
endfunction
