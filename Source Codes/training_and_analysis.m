
%Acquring training data
pathToData = 'IRLfish' %Dataset location
fishData = imageDatastore(pathToData,'IncludeSubfolders',true,'LabelSource','foldernames'); %store dataset in workspace
fishSpecies = fishData.Labels; %classnames are taken from folder names
numSpecies = numel(categories(fishSpecies)) %num of classes
[trainImgs,testImgs] = splitEachLabel(fishData,0.6, 'randomized'); % 60% of images used for training

%Transfer training alexnet MATLAB CNN for lion fish termination purposes
lion_fish_slayer_net = alexnet;
layers = lion_fish_slayer_net.Layers

%modifying fully connected and calssification layers to accomodate data classes
fc = fullyConnectedLayer(numSpecies) %new fully connected layer with number of scpies for used dataset
layers(end-2) = fc;
layers(end) = classificationLayer;

%default training options: opts = trainingOptions('sgdm'); %stochastic gradient descent with momentum to see training options

%less agressive training rate
opts = trainingOptions('sgdm','InitialLearnRate',0.001); 

[lion_fish_slayer_net,info] = trainNetwork(trainImgs, layers, opts); 

%plot training loss
plot(info.TraininLoss) 

%Feed testing set in the NN
fishPreds = classify(lion_fish_slayer_net,testImgs)

%Test performance analysis
fishAcual = testImgs.Labels
correctPreds = nnz(fishPreds, fishAcual) %magic nnz function
correctFrac = correctPreds/numel(testImgs.Labels)
confusionchart(testImgs.Labels, fishPreds)




