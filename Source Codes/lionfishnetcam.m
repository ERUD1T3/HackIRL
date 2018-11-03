%%
clear rpi
rpi = raspi();
cam = cameraboard(rpi,'Resolution','640x480');

%%
for i = 1:100
    img = snapshot(cam);
    image(img);
    drawnow;
end
