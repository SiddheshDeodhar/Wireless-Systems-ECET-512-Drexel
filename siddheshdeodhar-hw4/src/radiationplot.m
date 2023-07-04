


clear all, close all, clc



c = 3*10^8;
frequency = 2.4*10^9;
lambda =3*10^8/(2.4*10^9);


r = 1;
Eo = 1;



k = (2*pi)/lambda;
A = 0.5*lambda;
B = 0.25*lambda;
a = 0.25*lambda;
b = 0.25*lambda;
eta = (1.26*10^(-6))*3*10^8;
efficiency = 0.8;

maximum_theta= 2*pi-1*10^(-5);
minimum_theta = 1*10^(-5);


thetas = linspace(minimum_theta, maximum_theta, 100);

minimum_phi = -pi/2;
maximum_phi = pi/2;


index = linspace(maximum_phi, minimum_phi, 200);


Zin = [];
integral = 0;
for phi = index
    theta_row = [];
    for theta = thetas
        Vx = (A/lambda)*sin(theta)*cos(phi);
        Vy = (B/lambda)*sin(theta)*sin(phi);
        F1 = (4/pi)*((cos(pi*Vx))/(1-4*(Vx^2)));
        F0 = (2/pi)*((sin(pi*Vy))/(Vy));
        intensity_theta = j*(exp(-1*j*k*r)/(lambda*r))*Eo*((A*B)/4)*...
            ((1+cos(theta))/2)*sin(phi)*F1*F0;
        intensity_phi = j*(exp(-1*j*k*r)/(lambda*r))*Eo*((A*B)/4)*...
            ((1+cos(theta))/2)*cos(phi)*F1*F0;
        intensity_theta_magnitude = abs(intensity_theta);
        intensity_phi_magnitude = abs(intensity_phi);
        radiation_intensity = (r^2)*(intensity_theta_magnitude^2 + intensity_phi_magnitude^2)/(2*eta);
        theta_row = [theta_row, 10*log10(radiation_intensity)];
        integral = integral + radiation_intensity*sin(theta);
    end
    Zin = [Zin; theta_row];
end

intensities = 10.^(Zin./10);
antenna_directivity = max(max(intensities))/(integral);
antenna_gain = 10*log10(efficiency*antenna_directivity); %130dB



close all;

figure(1)
[Z, X, Y] = sphere3d(Zin,minimum_theta,maximum_theta,minimum_phi,maximum_phi,r,1,'surf');
title(" Radiation Pattern");
set(gca, 'Visible', 'on')
xlabel("Z", 'Visible', 'on');
ylabel("X", 'Visible', 'on');
zlabel("Y", 'Visible', 'on');
box on


azimuth_angle = 3*pi/2; 
theta_index = find((thetas>=azimuth_angle) == 1,  1);
azimuth_X = X(:, theta_index)';
azimuth_Y = Y(:, theta_index)';


elevation_angle = pi/2;
phi_index = find((index>=elevation_angle) == 1,1);
elevation_Z = -1*Z(phi_index, :);
elevation_Y = X(phi_index, :);

figure(2);
plot(elevation_Y,elevation_Z);
set(gca, 'Visible', 'on')
title("Elevation Plane", 'Visible', 'on');
xlim([-2.1*10^(-17), 2.1*10^(-17)]);
xlabel("Y", 'Visible', 'on');
ylabel("Z", 'Visible', 'on');

figure(3);
plot(azimuth_X, azimuth_Y);
set(gca, 'Visible', 'on')
title("Azimuth Plane", 'Visible', 'on');
xlabel("X", 'Visible', 'on');
ylabel("Y", 'Visible', 'on');





