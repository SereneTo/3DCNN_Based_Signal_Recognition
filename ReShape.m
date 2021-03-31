function result=ReShape(x)
% mag=abs(x);
realPart=real(x);
imagPart=imag(x);
temp=[realPart;imagPart];
% temp=temp/max(mag);
result=reshape(temp,[2,100,200,1]);
end