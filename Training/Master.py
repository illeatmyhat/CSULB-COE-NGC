import Training
#Deviations for the postive, Size, R,G,B,Theta
deviations = [.60,.20,.90,.90,.10]
list = [("square",5,225,6,7,32,False),("square",2,5,226,7,32,False),("square",7,255,6,227,32,False),("circle",8,200,200,200,32,True)]
imageCount = 14
Training.main(list,256, imageCount,deviations,"Training/")
