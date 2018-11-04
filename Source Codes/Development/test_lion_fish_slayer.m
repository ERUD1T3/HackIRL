%img = readimage(fish_test, 701)
img = readfish('Dataset\test\lionfishtest.jpg')

%[x,y] = size(img)
imshow(img)

tic
    fishPreds = LionFishSlayer.classify(img)
toc


%Test performance analysis
%fishPreds = classify(LionFishSlayer, fish_test)
%fishActual = fish_test.Labels
%correctPreds = nnz(fishPreds == fishActual) %magic nnz function
%correctFrac = correctPreds/numel(fish_test.Labels)
%confusionchart(fish_test.Labels, fishPreds)

%Help functions
function img = readfish(file)
    img = imread(file);
    %img = imcrop(img, [130 80 426 426]);
    img = imresize(img, [227 227]);
%img = repmat(img, [1 1 3])
end

