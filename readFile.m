function A = readFile(filename)
	f = fopen(filename,'r');
	n = fscanf( f,'%d',1 );
	B= zeros(n,2);
	for i = 1:n
		B(i,:) = fscanf(f,'%f %f',2);
	endfor
	A = zeros(n,n);
	for i = 1:n-1
		A(i,i) = (B(i,2) + B(i+1,2))/B(i,1);
	endfor
	A(n,n) = B(n,2)/B(n,1);
	for i= 2:n
		A(i,i-1)= -B(i,2)/B(i,1);
	endfor
	for i= 2:n
		A(i-1,i)= -B(i,2)/B(i-1,1);
	endfor
	A = A * 10^3; 
	fclose(f);
endfunction
