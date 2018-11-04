%% Setup 
clear rpi
clear fishPreds
clear img
clear raw_img
    
load('CNN.mat');
rpi = raspi('169.254.0.2','pi', 'raspberry');
myserialdevice = serialdev(rpi,'/dev/ttyAMA0')
cam = cameraboard(rpi,'Resolution','800x600');

writeChId = 618366;
writeKey = 'FQDCKUZNJUN5IMLP';
%% Launching Code
lionfishcount = 0

for iteration = 1:500
    
    raw_img = snapshot(cam);
    image(raw_img);
    drawnow;
    
    img = readfish(raw_img);
    %imshow(img)
    
    tic
        [fishPreds, confidence] = LionFishSlayer.classify(img);
    toc
    
    if fishPreds == 'lionfish'
        disp('lionfish detected')
        lionfishcount = lionfishcount + 1
        for scores = 1:1000
            if(confidence(score) > .01)
                thingSpeakWrite(writeChId,confidence(score),'Writekey',writeKey);
                disp('updating cloud')
                pause(15)
            end
        end 
        disp('Done!')
        break
    else 
        %disp(fishPreds)
        disp('not lionfish')
    end
    
end

%Help functions
function img = readfish(raw_img)
    %img = imread(file);
    %img = imcrop(img, [130 80 426 426]);
    img = imresize(raw_img, [227 227]);
%img = repmat(img, [1 1 3])
end
