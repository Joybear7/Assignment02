%Assignment 2: Tracking Colored Balls
%Joy Fucella

clear all; close all; clc;

StartingFrame = 1;
EndingFrame = 489;
Xcentroid = [ ];
Ycentroid = [ ];
Xcentroid1 = [ ];
Ycentroid1 = [ ];

for k = StartingFrame : EndingFrame-1
    %blue ball
    pos1 = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    bw1 = createMaskblue(pos1);

    [labels,number] = bwlabel(bw1,8);
    if number > 0
        Istats = regionprops(labels,'basic','Centroid');
        [maxVal, maxIndex] = max([Istats.Area]);
    
        Xcentroid = [Xcentroid Istats(maxIndex).Centroid(1)];
        Ycentroid = [Ycentroid Istats(maxIndex).Centroid(2)];
    end
    %red ball
    pos2 = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    bw2 = createMaskred(pos2);

    [labels1,number1] = bwlabel(bw2,8);
    if number1 > 0
        Istats1 = regionprops(labels1,'basic','Centroid');
        [maxVal, maxIndex1] = max([Istats1.Area]);
    
        Xcentroid1 = [Xcentroid1 Istats1(maxIndex1).Centroid(1)];
        Ycentroid1 = [Ycentroid1 Istats1(maxIndex1).Centroid(2)];
    end
end

%Plot the trails
imshow(pos1);
hold on;
scatter(Xcentroid,Ycentroid,'r');
scatter(Xcentroid1, Ycentroid1,'b');