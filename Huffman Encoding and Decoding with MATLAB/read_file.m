function [message] = read_file(filename)
fileId=fopen(filename,'r');
message=fscanf(fileId,'%c');
fclose(fileId);
end
