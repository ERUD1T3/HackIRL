

function lion_fish_slayer()
    %Data preprocessing
    fishds = imageDatastore('Dataset','IncludeSubfolders', true , 'LabelSource', 'foldernames', 'ReadFcn', @readfish);
    %img = lionfishds.read()
    [fish_train,fish_test] = splitEachLabel(fishds,.8)
    % Source code for the lion Fish slayer neural net
    %img1 = readfish('Dataset/lionfish/lionfish.jpg');
    %imshow(img);
    
    fishSpecies = fishds.Labels; %classnames are taken from folder names
    numSpecies = numel(categories(fishSpecies)) %num of classes
    
    LionFishSlayer = alexnet;

    layers = LionFishSlayer.Layers

    %modifying fully connected and calssification layers to accomodate data classes
    fc = fullyConnectedLayer(numSpecies) %new fully connected layer with number of scpies for used dataset
    layers(end-2) = fc;
    layers(end) = classificationLayer;
    
    %default training options: opts = trainingOptions('sgdm'); %stochastic gradient descent with momentum to see training options

    %less agressive training rate
    opts = trainingOptions('sgdm')
   % opts = trainingOptions('sgdm','InitialLearnRate',0.001); 

    [LionFishSlayer,info] = trainNetwork(fish_train, layers, opts); 

    %plot training loss
    plot(info.TraininLoss) 
    %reading image input layer
    %prediction = LionFishSlayer.classify(img1)

end

%Help functions
function img = readfish(file)
    img = imread(file);
    %img = imcrop(img, [130 80 426 426]);
    img = imresize(img, [227 227]);
%img = repmat(img, [1 1 3])
end



