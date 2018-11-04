# Hack river lagoon LionFishSlayerNet (We make high tech lionfish extermination tools)
  Link to hackathon notes
  
  https://docs.google.com/document/d/1KPcapY3LNtZ5nnSNl-_BrrGktfDZ_psH2LO7PlWli50/edit#
  
# How it works

  Our project makes it easy to automate the identification and tracking of invasive species in the IRL.

  In order to achieve this, we modified layers of a MATLAB CNN called alexnet and retrained with 1400 lionfish 
  images.

  Our deep learning software is called LionFishSlayerNet. Yeah, it's dope!

  A Raspberry Pi is used as a target for the CNN.

  A camera module connected to the Pi captures images that are fed to LionFishSlayerNet.

  LionFishSlayerNet makes a prediction on the image. 
  if it thinks it's a lionfish, it will stop and send data to an IoT cloud over wifi.

  The data is available here: https://thingspeak.com/channels/618366.

  The data tells you, when the image was taken, where it was taken, and how confident the neural net is that it's a 
  LionFish.

  Boom! A.I and IoT do all the work while we sit back and relax.

  LionFishSlayerNet can be trained to identify any other invasive species if you have a big enough dataset. The 
  possibilities are endless!

  
# Dependancies
  Deep learning matlab support package
  Alexnet matlab package
  Raspberry Pi matlab hardware support package
  
# Current Issues
  Loss in accuracy when dealing with non-lionfishes
  Requires proximity to subject
  
