function result=Reshape2D(x)
mag=abs(x);
realPart=real(x);
imagPart=imag(x);
temp=[realPart;imagPart];
temp=temp/max(mag);
result=reshape(temp,[2,20000,1]);
end