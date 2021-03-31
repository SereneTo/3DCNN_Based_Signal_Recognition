       for Bw = 1e6: 5e6 : 100e6
          for Rw= 0.5*Bw: 0.05*Bw:Bw
                
             PAM(8,5e9,Bw,Rw,24,1)
%             disp(fc)
%             disp(Bw)
%             disp(Rw)
%             disp(power(2,m))
              
          end
       end

