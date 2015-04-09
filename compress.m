function [A,Nram,C] = compress(original_file_name)
	S = wavread(original_file_name);
	Sm = S - mean(S);
	N = length(S);
	j = 1;
	sr = zeros(160,ceil(N/160));
	for i = 1: floor(N/160)
		sr(1:160,i) = S(j:j+159);
		j = j + 160;
	end
	[Nram nram] = size(sr);
	if (N-(Nram *nram))>0
		sr(1:(N-(Nram *nram)),i+1) = S(j:N)
	end
	[nram Nram] = size(sr);
	x = sr(:,1);
	p =30;
	Ns= 160;
	w = 1; 
	A = zeros((p+1)* Nram,1);
	for n = 1:Nram
		x = sr(:,n);		
		r = zeros( p, 1);
		r0 = sum( x(1:Ns) .* x(1:Ns) );
		for k = 1: p
			r(k) = sum( x(k+1:Ns) .* x(1:Ns-k) );
		end
		a = durbin(r0,r,p);
		A(w:w+p-1) = a(2:p+1);
		k = predictie(a(1:p+1));
		C(w:w+p-1) = k ;
		w = w+p;
	end
	C = C';
	size(C);
	output = original_file_name;
	x = '';
	for i =1: length(original_file_name)
		if output(i) ~= '.'
			x =strcat(x,output(i));
		else 
			break;
		end
	end
	output = strcat(x,".compressed");
	wavwrite(A,output);
endfunction
