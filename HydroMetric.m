clear all;
close all;

base_url = 'dd.weather.gc.ca/hydrometric/csv/';
province = 'ON';
frequency = 'daily';
file_type = 'csv';
station_id = ["02HA014","02HC030","02HC028","02HC027"]; 
station_name = ["REDHILL CREEK AT HAMILTON","ETOBICOKE CREEK BELOW QUEEN ELIZABETH HIGHWAY","LITTLE ROUGE CREEK NEAR LOCUST HILL","BLACK CREEK NEAR WESTON"];

for p = 1:length(station_id)
    clear y_minus_reverse;
    
    my_url = strcat('https://', base_url, province, '/', frequency, '/', ...
        province, '_', station_id(p), ...
        '_', frequency, '_hydrometric.', file_type);
    
    gauge_data = webread(my_url);
    depth_data = gauge_data.WaterLevel_NiveauD_eau_m_;
    depth_data(find(isnan(depth_data))) = [];
    
    y = depth_data';
    x = 1:1:length(y);
    avg_y_scalar = mean(y);
    avg_y_vector = avg_y_scalar * ones(1,length(y));
    std_y = std(y);
    y_plus = y + std_y;
    y_minus = y - std_y;
    
    j = 1;
    for i = length(y):-1:1
        y_minus_reverse(j) = y_minus(i);
        j = j + 1; 
    end
    
    figure(p);
    plot(x, y, 'b-', x, avg_y_vector);
    patch([1:1:length(y) length(y):-1:1],...
        [y_plus y_minus_reverse],...
        'b',...
        'facealpha', 0.05,...
        'edgecolor', 'r',...
        'edgealpha', 0.05) 
    
    legend('original data',...
        'average values',...
        'standard deviation');
    
    title(['Daily water level at', station_name(p), 'ID', station_id(p)]);
    xlabel('Historical daily water [day]');
    ylabel('Water level [m]');
end
