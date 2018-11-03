% Source code for the lion Fish slayer neural net
img1 = imread('http://farm1.static.flickr.com/44/148196327_af9a856e8f.jpg')
imshow(img1)
LionFishSlayer = alexnet
prediction = LionFishSlayer.classify('http://farm1.static.flickr.com/44/148196327_af9a856e8f.jpg')