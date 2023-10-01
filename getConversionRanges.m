function ranges = getConversionRanges()
    % Conversion ranges for Leukocytes
    leukocytesRanges = [
        226, 250;  % Leukocytes (Range 1)
        220, 225;  % Leukocytes (Range 2)
        200, 214;  % Leukocytes (Range 3)
        181, 220;  % Leukocytes (Range 4)
        0, 180     % Leukocytes (Range 5)
    ];
    leukocytesIndications = {'negative', 'trace', 'small', 'moderate', 'large'};

    % Conversion ranges for Nitrite
    nitriteRanges = [
        240, 255;  % Nitrite (Range 1)
        191, 240;  % Nitrite (Range 2)
        0, 190     % Nitrite (Range 3)
    ];
    nitriteIndications = {'negative', 'trace', 'small'};

    % Conversion ranges for Urobilinogen
    urobilinogenRanges = [
        219, 250;  % Urobilinogen (Range 1)
        200, 218;  % Urobilinogen (Range 2)
        183, 200;  % Urobilinogen (Range 3)
        0, 167;    % Urobilinogen (Range 4)
        168, 172;  % Urobilinogen (Range 5)
        173, 182   % Urobilinogen (Range 6)
    ];
    urobilinogenIndications = {'negative', 'trace', 'small', 'moderate', 'large', 'high'};

    % Conversion ranges for Protein
    proteinRanges = [
        196, 230;  % Protein (Range 1)
        176, 195;  % Protein (Range 2)
        157, 175;  % Protein (Range 3)
        148, 157;  % Protein (Range 4)
        123, 147;  % Protein (Range 5)
        0, 122    % Protein (Range 6)
    ];
    proteinIndications = {'negative', 'trace', 'small', 'moderate', 'large', 'high'};

    % Conversion ranges for pH
    pHRanges = [
        146, 155;  % pH (Range 1)
        162, 220;  % pH (Range 2)
        156, 161;  % pH (Range 3)
        116, 128;  % pH (Range 4)
        129, 145;  % pH (Range 5)
        91, 115;   % pH (Range 6)
        0, 90      % pH (Range 7)
    ];
    pHIndications = {'acidic', 'normal', 'slightly alkaline', 'alkaline', 'highly alkaline', 'very highly alkaline', 'extremely alkaline'};

    % Conversion ranges for Blood
    bloodRanges = [
        161, 210;  % Blood (Range 1)
        151, 160;  % Blood (Range 2)
        111, 127;  % Blood (Range 3)
        91, 110;   % Blood (Range 4)
        0, 90;     % Blood (Range 5)
        128, 138;  % Blood (Range 6)
        139, 150   % Blood (Range 7)
    ];
    bloodIndications = {'negative', 'trace', 'small', 'moderate', 'large', 'high', 'very high'};

    % Conversion ranges for Specific Gravity
    specificGravityRanges = [
        0, 51;     % Specific Gravity (Range 1)
        52, 70;    % Specific Gravity (Range 2)
        71, 95;    % Specific Gravity (Range 3)
        109, 120;  % Specific Gravity (Range 4)
        96, 108;   % Specific Gravity (Range 5)
        120, 130;  % Specific Gravity (Range 6)
        130, 180   % Specific Gravity (Range 7)
    ];
    specificGravityIndications = {'very low', 'low', 'normal', 'high', 'very high', 'very high', 'extremely high'};

    % Conversion ranges for Ketones
    ketonesRanges = [
        180, 200;  % Ketones (Range 1)
        164, 179;  % Ketones (Range 2)
        143, 163;  % Ketones (Range 3)
        116, 143;  % Ketones (Range 4)
        87, 115;   % Ketones (Range 5)
        0, 86      % Ketones (Range 6)
    ];
    ketonesIndications = {'negative', 'trace', 'small', 'moderate', 'large', 'very large'};

    % Conversion ranges for Bilirubin
    bilirubinRanges = [
        204, 235;  % Bilirubin (Range 1)
        176, 203;  % Bilirubin (Range 2)
        154, 175;  % Bilirubin (Range 3)
        0, 153     % Bilirubin (Range 4)
    ];
    bilirubinIndications = {'negative', 'trace', 'small', 'moderate'};

    % Conversion ranges for Glucose
    glucoseRanges = [
        165, 185;  % Glucose (Range 1)
        127, 164;  % Glucose (Range 2)
        110, 126;  % Glucose (Range 3)
        100, 109;  % Glucose (Range 4)
        95, 100;   % Glucose (Range 5)
        0, 95      % Glucose (Range 6)
    ];
    glucoseIndications = {'negative', 'trace', 'small', 'moderate', 'large', 'very large'};

    % Create the structure to store the ranges and indications
    ranges = struct('Leukocytes', {leukocytesRanges, leukocytesIndications}, ...
                    'Nitrite', {nitriteRanges, nitriteIndications}, ...
                    'Urobilinogen', {urobilinogenRanges, urobilinogenIndications}, ...
                    'Protein', {proteinRanges, proteinIndications}, ...
                    'pH', {pHRanges, pHIndications}, ...
                    'Blood', {bloodRanges, bloodIndications}, ...
                    'SpecificGravity', {specificGravityRanges, specificGravityIndications}, ...
                    'Ketones', {ketonesRanges, ketonesIndications}, ...
                    'Bilirubin', {bilirubinRanges, bilirubinIndications}, ...
                    'Glucose', {glucoseRanges, glucoseIndications});
end
