import Training
#Each constraint has paramter (shape, size, R, G, B, theta, bool, sizeDev,RDev,GDev,BDev,thetaDev)
list = [("square",200,225,6,7,0,True,.10,.10,.10,.10,.7),("square",4,5,226,7,0,False,.1,.0,.0,.0,.0),
        ("square",7,255,6,227,0,False,.1,.0,.0,.0,.0),("circle",8,200,0,0,0,False,.10,.9,.4,.2,.0)]
imageCount = 14
Training.main(list, imageCount,"Training/")
