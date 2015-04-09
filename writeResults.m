function writeResults(l,X,fileName)
	fid = fopen(fileName,'w');
	n = size(l,2);
	fprintf(fid,'%d',n);
	for i = 1:n
		fprintf(fid,'\n%6.6f\n',l(i));
		fprintf(fid,'%6.6f ',X(:,i));
	end
	fclose(fid);
endfunction
