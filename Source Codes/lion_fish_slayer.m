

function lion_fish_slayer()
    %Data preprocessing
    fishds = imageDatastore('Dataset','IncludeSubfolders', true , 'LabelSource', 'foldernames', 'ReadFcn', @readfish);
    %img = lionfishds.read()
    [fish_train, fish_test] = splitEachLabel(fishds, .8, 'randomized')
    % Source code for the lion Fish slayer neural net
    %img1 = readfish('Dataset/lionfish/lionfish.jpg');
    %imshow(img);
    LionFishSlayer = alexnet;

    %reading image input layer
    %prediction = LionFishSlayer.classify(img1)

end

%Help functions
function img = readfish(file)
    img = imread(file);
    img = imcrop(img, [130 80 426 426]);
    img = imresize(img, [227 227]);
%img = repmat(img, [1 1 3])
end



