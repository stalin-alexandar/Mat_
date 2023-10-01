% Read the urine strip image
image = imread('C:\Users\lenovo\Desktop\R&D\samp.png');

% Display the image
figure;
imshow(image);
title('Urine Strip');

% Initialize variables
num_boxes = 0;
boxes = struct('BoundingBox', []);
results = struct('Box', [], 'RGBMean', []);
 

% Manually select and crop each box
while true
    % Manually select a box by drawing a rectangle
    figure;
    imshow(image);
    title('Select a box by drawing a rectangle');
    rect = round(getrect);
    
    % Check if the user clicked outside the image or pressed Enter
    if rect(3) <= 0 || rect(4) <= 0
        break;
    end
    
    % Increment the box count
    num_boxes = num_boxes + 1;
    
    % Save the box coordinates
    boxes(num_boxes).BoundingBox = rect;
    
    % Crop the box from the image
    cropped_box = imcrop(image, rect);
    
    % Perform analysis on the cropped box
    rgb_mean = mean(mean(cropped_box, 1), 2);
    
    % Store the analysis results
    results(num_boxes).Box = rect;
    results(num_boxes).RGBMean = rgb_mean;
    
    % Display the cropped box
    figure;
    imshow(cropped_box);
    title(['Cropped Box ', num2str(num_boxes)]);
end

% Display the original image with bounding boxes
figure;
imshow(image);
hold on;
for i = 1:num_boxes
    rectangle('Position', boxes(i).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
end
hold off;
title('Urine Strip with Bounding Boxes');

% Display the analysis results
for i = 1:num_boxes
    disp(['RGB Mean: ', num2str(mean(results(i).RGBMean))]);
    disp('-------------------');
end

% Extract the RGB mean values
rgb_means = vertcat(results.RGBMean);

% Patient values (replace these with the actual patient values)
patientLeukocytes = rgb_means(1);
patientNitrite = rgb_means(2);
patientUrobilinogen = rgb_means(3);
patientProtein = rgb_means(4);
patientpH = rgb_means(5);
patientBlood = rgb_means(6);
patientSpecificGravity = rgb_means(7);
patientKetones = rgb_means(8);
patientBilirubin = rgb_means(9);
patientGlucose = rgb_means(10);



% Get the conversion ranges for each parameter
leukocytesRanges = ranges.Leukocytes;
nitriteRanges = ranges.Nitrite;
urobilinogenRanges = ranges.Urobilinogen;
proteinRanges = ranges.Protein;
pHRanges = ranges.pH;
specificGravityRanges = ranges.SpecificGravity;
ketonesRanges = ranges.Ketones;
bilirubinRanges = ranges.Bilirubin;
glucoseRanges = ranges.Glucose;
bloodRanges = ranges.Blood;

% Check Leukocytes
leukocytesIndication = '';
for i = 1:size(leukocytesRanges, 1)
    rangeMin = leukocytesRanges(i, 1);
    rangeMax = leukocytesRanges(i, 2);
    
    if patientLeukocytes >= rangeMin && patientLeukocytes <= rangeMax
        switch i
            case 1
                leukocytesIndication = 'Negative';
            case 2
                leukocytesIndication = 'Trace';
            case 3
                leukocytesIndication = 'Small';
            case 4
                leukocytesIndication = 'Moderate';
            case 5
                leukocytesIndication = 'Large';
        end
        break;
    end
end

% Check Nitrite
nitriteIndication = '';
for i = 1:size(nitriteRanges, 1)
    rangeMin = nitriteRanges(i, 1);
    rangeMax = nitriteRanges(i, 2);
    
    if patientNitrite >= rangeMin && patientNitrite <= rangeMax
        switch i
              case 1
                nitriteIndication = 'Negative';
            case 2
                nitriteIndication = 'Positive';
            case 3
                nitriteIndication = 'Highly positive';
        end
        break;
    end
end

% Check Urobilinogen
urobilinogenIndication = '';
for i = 1:size(urobilinogenRanges, 1)
    rangeMin = urobilinogenRanges(i, 1);
    rangeMax = urobilinogenRanges(i, 2);
    
    if patientUrobilinogen >= rangeMin && patientUrobilinogen <= rangeMax
        switch i
              case 1
                urobilinogenIndication= 'Normal level 1';
            case 2
                urobilinogenIndication = 'Normal Level 2';
            case 3
                urobilinogenIndication = 'Normal Level 3';
            case 4
                urobilinogenIndication = 'Highly positive Level 1';
            case 5
                urobilinogenIndication = 'Highly positive Level 2';
            case 6
                urobilinogenIndication = 'Highly positive Level 3';
        end
        break;
    end
end

% Check Protein
proteinIndication = '';
for i = 1:size(proteinRanges, 1)
    rangeMin = proteinRanges(i, 1);
    rangeMax = proteinRanges(i, 2);
    
    if patientProtein >= rangeMin && patientProtein <= rangeMax
        switch i
  case 1
                proteinIndication = 'Negative';
            case 2
                proteinIndication = 'Trace';
            case 3
                proteinIndication = 'Positive 1';
            case 4
                proteinIndication = 'Positive 2';
            case 5
                proteinIndication = 'Highly Positive 1';
            case 6
                proteinIndication = 'Highly Positive 2';
        end
        break;
    end
end

% Check pH
pHIndication = '';
for i = 1:size(pHRanges, 1)
    rangeMin = pHRanges(i, 1);
    rangeMax = pHRanges(i, 2);
    
    if patientpH >= rangeMin && patientpH <= rangeMax
        switch i
            case 1
                pHIndication = 'Very Acidic';
            case 2
                pHIndication = 'Very Acidic';
            case 3
                pHIndication = 'Lightly Acidic';
            case 4
                pHIndication = 'Optimal Range - Good';
            case 5
                pHIndication = 'Optimal Range - Good';
            case 6
                pHIndication = 'Lightly Alkaline ';
            case 7
                pHIndication = 'Highly Alkaline';
        end
        break;
    end
end

% Check Specific Gravity
specificGravityIndication = '';
for i = 1:size(specificGravityRanges, 1)
    rangeMin = specificGravityRanges(i, 1);
    rangeMax = specificGravityRanges(i, 2);
    
    if patientSpecificGravity >= rangeMin && patientSpecificGravity <= rangeMax
        switch i
            case 1
                specificGravityIndication = 'Result is Abnormal';
            case 2
                specificGravityIndication = 'Result is Normal';
            case 3
                specificGravityIndication = 'Result is Normal';
            case 4
                specificGravityIndication = 'Result is Normal';
            case 5
                specificGravityIndication = 'Result is Normal';
            case 6
                specificGravityIndication = 'Result is Normal';
            case 7
                specificGravityIndication = 'Result is Normal';
        end
        break;
    end
end


% Check Ketones
ketonesIndication = '';
for i = 1:size(ketonesRanges, 1)
    rangeMin = ketonesRanges(i, 1);
    rangeMax = ketonesRanges(i, 2);
    
    if patientKetones >= rangeMin && patientKetones <= rangeMax
        switch i
             case 1
                ketonesIndication = 'Result is Negative';
            case 2
                ketonesIndication = 'Result is Low';
            case 3
                ketonesIndication = 'Result is Moderate';
            case 4
                ketonesIndication = 'Result is High';
            case 5
                ketonesIndication = 'Result is Moderately High';
            case 6
                ketonesIndication = 'Result is Very High';
        end
        break;
    end
end

% Check Bilirubin
bilirubinIndication = '';
for i = 1:size(bilirubinRanges, 1)
    rangeMin = bilirubinRanges(i, 1);
    rangeMax = bilirubinRanges(i, 2);
    
    if patientBilirubin >= rangeMin && patientBilirubin <= rangeMax
        switch i
            case 1
                bilirubinIndication = 'Result is Negative';
            case 2
                bilirubinIndication = 'Result is Low';
            case 3
                bilirubinIndication = 'Result is Moderate';
            case 4
                bilirubinIndication = 'Result is High';
        end
        break;
    end
end

% Check Glucose
glucoseIndication = '';
for i = 1:size(glucoseRanges, 1)
    rangeMin = glucoseRanges(i, 1);
    rangeMax = glucoseRanges(i, 2);
    
    if patientGlucose >= rangeMin && patientGlucose <= rangeMax
        switch i
               case 1
                glucoseIndication = 'Result is Negative-Normal';
            case 2
                glucoseIndication = 'Result is Trace - Light Glucose Present';
            case 3
                glucoseIndication = 'Result is Positive - Moderate Glucose Present';
            case 4
                glucoseIndication = 'Result is Positive - High Glucose Present';
            case 5
                glucoseIndication = 'Result is Highly Positive - Very High Glucose Present';
            case 6
                glucoseIndication = 'Result is Highly Positive - Very High Glucose Present';
        end
        break;
    end
end

% Check Blood
bloodIndication = '';
for i = 1:size(bloodRanges, 1)
    rangeMin = bloodRanges(i, 1);
    rangeMax = bloodRanges(i, 2);
    
    if patientBlood >= rangeMin && patientBlood <= rangeMax
        switch i
     case 1
                bloodIndication = 'Result is Negative';
            case 2
                bloodIndication = 'Non Hemolyzed Trace';
            case 3
                bloodIndication = 'Non Hemolyzed Moderate';
            case 4
                bloodIndication = 'Hemolyzed Trace';
            case 5
                bloodIndication = 'Result is slightly Positive';
            case 6
                bloodIndication = 'Result is Moderate';
            case 7
                bloodIndication = 'Result is Highly Positive';
        end
        break;
    end
end

% Display the results
% Display the results
disp('Patient Test Results:');
disp('---');
disp('Leukocytes');
disp(['Value: ', num2str(patientLeukocytes)]);
disp(['Indication: ', leukocytesIndication]);
disp('---');
disp('Nitrite');
disp(['Value: ', num2str(patientNitrite)]);
disp(['Indication: ', nitriteIndication]);
disp('---');
disp('Urobilinogen');
disp(['Value: ', num2str(patientUrobilinogen)]);
disp(['Indication: ', urobilinogenIndication]);
disp('---');
disp('Protein');
disp(['Value: ', num2str(patientProtein)]);
disp(['Indication: ', proteinIndication]);
disp('---');
disp('pH');
disp(['Value: ', num2str(patientpH)]);
disp(['Indication: ', pHIndication]);
disp('---');
disp('Blood');
disp(['Value: ', num2str(patientBlood)]);
disp(['Indication: ', bloodIndication]);
disp('---');
disp('Specific Gravity');
disp(['Value: ', num2str(patientSpecificGravity)]);
disp(['Indication: ', specificGravityIndication]);
disp('---');
disp('Ketones');
disp(['Value: ', num2str(patientKetones)]);
disp(['Indication: ', ketonesIndication]);
disp('---');
disp('Bilirubin');
disp(['Value: ', num2str(patientBilirubin)]);
disp(['Indication: ', bilirubinIndication]);
disp('---');
disp('Glucose');
disp(['Value: ', num2str(patientGlucose)]);
disp(['Indication: ', glucoseIndication]);
disp('---');
