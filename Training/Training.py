from PIL import Image, ImageDraw
import PIL
import random

canvas = Image.new("RGB", (256, 256), "white")
#Generates the locations of all the shapes, returns a list
def generateLocations(imageSize, imageCount):
    return [divmod(x, imageSize) for x in random.sample(range(imageSize * imageSize), imageCount)]

#Saves the pictures to positves folder
def generatePositiveImages(listOfParameters, listOfShapes, positiveCanvas, url):
    for locations in listOfParameters:
        img = ImageDraw.Draw(positiveCanvas)
        for index, shapeProp in enumerate(listOfShapes):
            loc = locations[index]
            if(shapeProp[6] == True):
                size = random.randint(shapeProp[1] - int(shapeProp[1] * shapeProp[7]),int(shapeProp[1] * shapeProp[7]) + shapeProp[1])
                R = random.randint(shapeProp[2] - int(shapeProp[2] * shapeProp[8]),int(shapeProp[2] *  shapeProp[8]) + shapeProp[2])
                G = random.randint(shapeProp[3] - int(shapeProp[3] * shapeProp[9]),int(shapeProp[3] *  shapeProp[9]) + shapeProp[3])
                B = random.randint(shapeProp[4] - int(shapeProp[4] * shapeProp[10]),int(shapeProp[4] *  shapeProp[10]) + shapeProp[4])
                theta = random.randint(shapeProp[5] - int(shapeProp[5] * shapeProp[11]), int(shapeProp[5] * shapeProp[11]) + shapeProp[5])
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.rectangle((x, y), fill=(R, G, B),outline=(R,G,B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R,G,B),outline=(R,G,B))
            elif(random.randint(1,10) < 7):
                size = random.randint(shapeProp[1] - int(shapeProp[1] * shapeProp[7]),int(shapeProp[1] * shapeProp[7]) + shapeProp[1])
                R = random.randint(shapeProp[2] - int(shapeProp[2] * shapeProp[8]), int(shapeProp[2] * shapeProp[8]) + shapeProp[2])
                G = random.randint(shapeProp[3] - int(shapeProp[3] * shapeProp[9]),int(shapeProp[3] * shapeProp[9]) + shapeProp[3])
                B = random.randint(shapeProp[4] - int(shapeProp[4] * shapeProp[10]), int(shapeProp[4] * shapeProp[10]) + shapeProp[4])
                theta = random.randint(shapeProp[5] - int(shapeProp[5] * shapeProp[11]),int(shapeProp[5] * shapeProp[11]) + shapeProp[5])
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.rectangle((x, y), fill=(R, G, B), outline=(R, G, B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R, G, B), outline=(R, G, B))
        positiveCanvas.save(url + "Positive/{}_{},{}_{}.png".format(loc[0], loc[1], loc[0], loc[1]), "PNG")
        positiveCanvas = canvas.copy()

#Saves the pictures to positves folder
def generateNegativeImages(listOfParameters, listOfShapes, negativeCanvas, url):
    for locations in listOfParameters:
        img = ImageDraw.Draw(negativeCanvas)
        for index, shapeProp in enumerate(listOfShapes):
            loc = locations[index]
            if(shapeProp[6] != True):
                size = random.randint(shapeProp[1] - int(shapeProp[1] * shapeProp[7]),int(shapeProp[1] * shapeProp[7]) + shapeProp[1])
                R = random.randint(shapeProp[2] - int(shapeProp[2] * shapeProp[8]),int(shapeProp[2] * shapeProp[8]) + shapeProp[2])
                G = random.randint(shapeProp[3] - int(shapeProp[3] * shapeProp[9]),int(shapeProp[3] * shapeProp[9]) + shapeProp[3])
                B = random.randint(shapeProp[4] - int(shapeProp[4] * shapeProp[10]),int(shapeProp[4] * shapeProp[10]) + shapeProp[4])
                theta = random.randint(shapeProp[5] - int(shapeProp[5] * shapeProp[11]),int(shapeProp[5] * shapeProp[11]) + shapeProp[5])
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.rectangle((x, y), fill=(R, G, B), outline=(R, G, B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R, G, B), outline=(R, G, B))
        negativeCanvas.save(url + "Negative/{}_{},{}_{}.png".format(loc[0], loc[1], loc[0], loc[1]), "PNG")
        negativeCanvas = canvas.copy()


def main(listOfShapes, imageSize, imageCount,url):
    #Empty list that will be filled with the locations of the shapes, a list of seperate list for the locations, a set for each pair of shapes
    listOfParameters = []
    for x in range(imageCount):
        locationsList = generateLocations(imageSize,len(listOfShapes))
        listOfParameters.append(locationsList)
    positiveCanvas = canvas.copy()
    negativeCanvas = canvas.copy()
    #Saving images for positive's
    generatePositiveImages(listOfParameters, listOfShapes, positiveCanvas,url)
    generateNegativeImages(listOfParameters, listOfShapes, negativeCanvas,url)

if __name__ == "__main__":
    main(listOfShapes =vars(), imageSize = vars(), imageCount = vars(),url= vars())