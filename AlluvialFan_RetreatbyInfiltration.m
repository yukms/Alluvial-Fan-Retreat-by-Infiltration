%% 2023-02-21
% Model to predct Alluvial fan retreat by infiltration
clear
close all


%% 
qw= 10 ; % mm2 / sec
qs = 0.1; % mm2 / sec
St = 0.01; % topset slope
timestep=150; % 
dt=1; % sec
s = zeros (timestep,1); % mm
qw_inf = zeros (timestep,1); % mm2/sec
alpha = 1 ; % infiltration coeff? % 1/sec

% infiltration occurs vertically
% qw_infiltration =  Area * alpha  [mm2/sec]


%% before retreat 
for i = 1 :dt: timestep  
    
   s(i) = sqrt (2*qs*i/St);  % mm
   qw_inf(i)= alpha *s(i) * s(i) * St /2 ; % mm ^ 2  / sec
    
   figure(2)
   plot ( [0, s(i)],[s(i)*St , 0] ,'b')
   hold on
   
   if qw_inf(i) > qw
       fprintf("infiltration is higher than input, time step is %g \n",i)
       break
      
       
   else
   end

   
end
L = s(i) %  maximum shoreline 
Lp= sqrt ( 2 * qw / alpha / St ) % check L is same with Lp
 thick=0;
    
%% retreat
gg3= -4*St*(2*qw/alpha - 2* qs); % -4ac in  quadratic fomula
 
gg2 =  (2*L*St); %temporary saved _ keep changing term  % b^2  in quadratic fomula

 for j = i+1 : dt : timestep
%      x=( 2*L*St - sqrt ( 4*L*L*St*St-4*St*(-2*qs+2*qw/alpha))) / 2 / St
%     x=( 2*L*St + sqrt ( 4*L*L*St*St-4*St*(-2*qs+2*qw/alpha))) / 2 / St
%       

s(j) =( 2*L*St - sqrt ( gg2^2 +gg3) )/ 2/St  % quadratic fomula: {-b - sqrt (b^2 - 4ac)} / 2a
% s(j) is where qw_inf   equall to qw_input 
gg2 = gg2 + 2*qs/s(j) ; %  b^2 + 2 Thickness(i-1)  % see note
thick=thick+2*qs/s(j);


if s(j)<0 
    break
end
plot ( [0, s(j) ], [L*St+thick , (L-s(j))*St+thick],'r')
xlabel('distance [mm]')
ylabel('distance [mm]')
title ('alluvial fan topography')

 end
 figure(1)
 plot(s(1:j-1))
 ylabel('shoreline location [mm]')
 xlabel('time [sec]')
 
 
 