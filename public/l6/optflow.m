%Read in a video file.
vidReader = VideoReader('visiontraffic.avi');

%Create optical flow object.
opticFlow = opticalFlowFarneback;

% skip first still frames
for i=1:90
    readFrame(vidReader);
end

ba = vision.BlobAnalysis;

%Estimate the optical flow of objects in the video.
while hasFrame(vidReader)
    frameRGB = readFrame(vidReader);
    frameGray = rgb2gray(frameRGB);
  
    % estimate optical flow
    flow = estimateFlow(opticFlow,frameGray); 

    % show motion vectors
    figure(1);
    imshow(frameRGB) 
    hold on
    plot(flow,'DecimationFactor',[15 15],'ScaleFactor',5)
    hold off 
    
    % calculate speed and direction from Vx and Vy
    dir = atan2(flow.Vy, flow.Vx);
    spd = sqrt(flow.Vx.^2 + flow.Vy.^2);
    
    % show speed map
    figure(2);
    imshow(spd, [0, 10]);
    colormap(gca, 'jet');
    colorbar;
    
    % threshold optical flow for speeds over 2
    thr = spd > 2;
    figure(3);
    imshow(thr);
    
    % remove all measurements for speeds lower than 2
    filtdir = zeros(size(dir));
    filtdir(thr) = dir(thr);
    
    % calculate region statistics for thresholded image
    [AREA,CENTROID,BBOX] = step(ba, thr);
    
    % analyze found regions
    bb = [];
    lbl = [];
    cc = [];
    avgdir = [];
    for i=1:size(AREA, 1)
        % leave only regions bigger than 2000px
        if AREA(i) > 2000
            % extract bounding box 
            x = BBOX(i,1);
            y = BBOX(i,2);
            w = BBOX(i,3);
            h = BBOX(i,4);
            
            % add area to list of labels
            lbl = [lbl AREA(i)];
            
            % store bounding box
            bb = [bb; BBOX(i, :)];
            
            % compute average direction inside bounding box
            dirbb = filtdir(y:y+h-1,x:x+w-1);
            avgdir = [avgdir mean(dirbb(dirbb > 0))];
            
            % store centroid
            cc = [cc; CENTROID(i,:)];
        end
    end
    
    % draw annotations (bounding boxes with segment area)
    ann = frameRGB;
    if size(bb, 1) > 0
        ann = insertObjectAnnotation(ann, 'rectangle', bb, lbl, 'TextBoxOpacity',0.9,'FontSize',18);
    end
    
    % show annotated image
    figure(4);
    imshow(ann);
    hold on;
    
    % draw average direction vector
    for i=1:size(bb,1)
        x1 = cc(i, 1);
        y1 = cc(i, 2);
        x2 = x1 + 30*cos(avgdir(i));
        y2 = y1 + 30*sin(avgdir(i));
        
        line([x1 x2], [y1 y2], 'LineWidth', 3);
    end
    hold off;
    
end