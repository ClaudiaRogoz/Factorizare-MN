function k = decompress(compressed_file_name)
	output = compressed_file_name;	
	x = '';
	for i =1 : length(compressed_file_name)
		if output(i) ~= '.'
			x =strcat(x,output(i));
		else 
			break;
		end
	end
	output = strcat(x,".wav");
	s = wavread(output);
	[a,Nram,C] = compress(output);	
	p = length(a)-1;
	maxno = p;
	%k = zeros(maxno,1);
	%for i = p:-1:2
    	%	k(i) = -a( i+1 );
    	%	t( i:-1:2 ) = ( a( i:-1:2 ) + ( k(i) .* a(2:i) ) ) /( 1.0 - ( k(i) * k(i) ) );
    	%	a( 2:i ) = t( 2:i );
		
	%end
	%k(1) = -a(2);		
	x = '';
	for i = 1 : length(compressed_file_name)
		if output(i) ~= '.'
			x = strcat(x,output(i));
		else 
			break;
		end
	end
	output = strcat(x,"2.wav");	
	wavwrite(C,output);
endfunction

