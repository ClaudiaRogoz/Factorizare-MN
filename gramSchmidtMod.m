function [Q,R] = gramSchmidtMod(A)
	[m,n]= size(A);
	for i = 1 : n
		R(i,i) =norm(A(1:m,i));
		Q(1:m,i) = A(1:m,i) / R(i,i);
		for j = i+1 : n
			R(i,j) = Q(1:m,i)' *A(1:m,j);
			A(1:m,j)= A(1:m,j)- Q(1:m,i)*R(i,j);
		end
	end
endfunction 
