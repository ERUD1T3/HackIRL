%%
clear rpi

rpi = raspi('169.254.0.2','pi', 'raspberry');
myserialdevice = serialdev(rpi,'/dev/ttyAMA0')
cam = cameraboard(rpi,'Resolution','1980x1980');

 clear fishPreds
 clear img
 clear raw_img
    

%%
for i = 1:1000
    
   
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
        break
    else 
        disp(fishPreds)
    end
    
end

%Help functions
function img = readfish(raw_img)
    %img = imread(file);
    %img = imcrop(img, [130 80 426 426]);
    img = imresize(raw_img, [227 227]);
%img = repmat(img, [1 1 3])
end
