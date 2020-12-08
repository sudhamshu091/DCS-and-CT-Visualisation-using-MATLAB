function [msg] = huffman_decode(symb,code,bitstream)
n=length(symb);
lengths=[];
for i=1:n
    len=length(char(code(i)));
    lengths=[lengths len];
end
maxlen=max(lengths);
msg='';
%bitstream length is denoted by streamlen
streamlen=length(bitstream);
i=1;
while i<=streamlen
    j=0;
    while j<maxlen
        c=bitstream(i:i+j);
        ind=1;
        while (ind<=n && ~isequal(char(code(ind)),c))
            ind=ind+1;
        end
        if ind<=n
            msg=[msg char(symb(ind))];
            break
        else j=j+1;
        end
    end
    i=i+j+1;
end

