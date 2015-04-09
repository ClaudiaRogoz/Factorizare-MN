function [l,X] = qrEig(A,a)
	n = size(A,1);	
	B = A;
	X = eye(n);	
	for i = 1:1500
		[Q,R] = gramSchmidtMod(B);
		B = R * Q;
		X = X*Q;
	end 
l = diag(B);
endfunction
