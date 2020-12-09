% Record values in array
timeA = 0;
loop = 0;
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        loop = loop + 1;
        timeA = timeA + b{iit}.timeImpact;
        
        timeArray(loop) = timeA;
        temperatureArray(loop) = b{iit}.TP;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            loop = loop + 1;
            timeA = timeA + T;
            
            timeArray(loop) = timeA;
            temperatureArray(loop) = s{iit,jit}.TP;
            temperatureArray(loop) = s{iit,jit}.TP_new;
            impactArray(loop) = abs(s{iit,jit}.FI);
            deformationArray(loop) = s{iit,jit}.deformation;

            stressArray(loop) = ((impactArray(loop)/2)/deformationArray(loop));
            MPaArray(loop) = 1e-6*stressArray(loop);
            deformationRadius(loop) = sqrt((((diameter/2)^2-((diameter/2)-deformationArray(loop))^2)));
            %thermalShock(loop) = s{iit,jit}.TC_avg*temperatureArray(loop);
        end;
    end;
end;
    
    % MAX
%Tensile Strength (4)
tensileStrengthQuantity = max(MPaArray(loop)/tensileStrength);
%Elastic Limit (3)
elasticLimitQuantity = max(MPaArray(loop)/elasticLimit);
%Fracture Toughness (1)
fractureToughnessQuantity = max((MPaArray(loop)*sqrt(pi*deformationRadius(loop)))/(fractureToughness));
%Maximum Service Temperature (4)
maximumServiceTemperatureQuantity = max(temperatureArray(loop)/(maximumServiceTemperature));
%Pod Thickness (2)
podThicknessQuantity = max(deformationArray(loop)/(podThickness));
%Diameter (4)
deformationQuantity = max(deformationArray(loop)/(0.5*diameter));
%Maximum Force (4)
maximumForceQuantity = max(impactArray(loop)/maximumForce);
survivabilityMaxTemperature = (4*maximumServiceTemperatureQuantity)/4;
survivabilityMaxImpact = (fractureToughnessQuantity+4*maximumForceQuantity)/5;
survivabilityMaxDeformation = (4*tensileStrengthQuantity+3*elasticLimitQuantity+2*podThicknessQuantity+4*deformationQuantity)/13;
survivabilityMax = double(max([survivabilityMaxTemperature,survivabilityMaxImpact,survivabilityMaxDeformation]));
    % MEAN
%Tensile Strength (4)
tensileStrengthQuantity = mean(MPaArray(loop)/tensileStrength);
%Elastic Limit (3)
elasticLimitQuantity = mean(MPaArray(loop)/elasticLimit);
%Fracture Toughness (1)
fractureToughnessQuantity = mean((MPaArray(loop)*sqrt(pi*deformationRadius(loop)))/(fractureToughness));
%Maximum Service Temperature (4)
maximumServiceTemperatureQuantity = mean(temperatureArray(loop)/(maximumServiceTemperature));
%Pod Thickness (2)
podThicknessQuantity = mean(deformationArray(loop)/(podThickness));
%Diameter (4)
deformationQuantity = mean(deformationArray(loop)/(0.5*diameter));
%Maximum Force (4)
maximumForceQuantity = mean(impactArray(loop)/maximumForce);
survivabilityMeanTemperature = (4*maximumServiceTemperatureQuantity)/4;
survivabilityMeanImpact = (fractureToughnessQuantity+4*maximumForceQuantity)/5;
survivabilityMeanDeformation = (4*tensileStrengthQuantity+3*elasticLimitQuantity+2*podThicknessQuantity+4*deformationQuantity)/13;
survivabilityMean = double(mean([survivabilityMeanTemperature,survivabilityMeanImpact,survivabilityMeanDeformation]));
    % MEDIAN
%Tensile Strength (4)
tensileStrengthQuantity = median(MPaArray(loop)/tensileStrength);
%Elastic Limit (3)
elasticLimitQuantity = median(MPaArray(loop)/elasticLimit);
%Fracture Toughness (1)
fractureToughnessQuantity = median((MPaArray(loop)*sqrt(pi*deformationRadius(loop)))/(fractureToughness));
%Maximum Service Temperature (4)
maximumServiceTemperatureQuantity = median(temperatureArray(loop)/(maximumServiceTemperature));
%Pod Thickness (2)
podThicknessQuantity = median(deformationArray(loop)/(podThickness));
%Diameter (4)
deformationQuantity = median(deformationArray(loop)/(0.5*diameter));
%Maximum Force (4)
maximumForceQuantity = median(impactArray(loop)/maximumForce);
survivabilityMedianTemperature = (4*maximumServiceTemperatureQuantity)/4;
survivabilityMedianImpact = (fractureToughnessQuantity+4*maximumForceQuantity)/5;
survivabilityMedianDeformation = (4*tensileStrengthQuantity+3*elasticLimitQuantity+2*podThicknessQuantity+4*deformationQuantity)/13;
survivabilityMedian = double(median([survivabilityMedianTemperature,survivabilityMedianImpact,survivabilityMedianDeformation]));

survivability = max([survivabilityMedian,survivabilityMean,survivabilityMax]);

writematrix("Breaking Metric: " + survivability,'Test Output','WriteMode','append');
%Value of 1 means it will break