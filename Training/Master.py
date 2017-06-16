import Training
#Each constraint has paramter (shape, size, R, G, B, theta, bool, sizeDev,RDev,GDev,BDev,thetaDev)
list = [("square",5,225,6,7,32,True,.10,.20,.90,.90,.10),("square",4,5,226,7,32,False,.1,.0,.0,.0,.0),
        ("square",7,255,6,227,32,False,.9,.0,.0,.0,.0),("circle",8,200,0,0,32,True,.50,.9,.4,.2,.0)]
imageCount = 14
Training.main(list,256, imageCount,"Training/")
