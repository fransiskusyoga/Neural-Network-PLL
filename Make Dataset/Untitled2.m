% Plot the result
% Count the
xmax=64; %change di val into dependent val
ymax=12; %change di val into dependent val
occur = zeros(xmax*ymax,1);
ShiftHeat = zeros(xmax*ymax,1);
temp = ShiftKpval(:);
for i = 1:ymax
    for j = 1:xmax
        Map = and(trainData(:,2)==j,trainData(:,1)==i);
        occur((i-1)*xmax+j)= sum(Map);
        ShiftHeat((i-1)*xmax+j)= mean(temp(Map));
    end
end
% Plot mean shift
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = isnan(ShiftHeat);
ShiftHeat(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,ShiftHeat,'filled');
colorbar('eastoutside');
xticks(1:xmax);
grid;
% Plot occurance
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = (occur==0);
occur(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,occur,'filled');
colorbar('eastoutside');
xticks(1:xmax);
grid;