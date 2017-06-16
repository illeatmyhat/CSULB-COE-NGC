from PIL import Image, ImageDraw
import math
import random

canvas = Image.new("RGB", (512, 512), "white")
#Generates the locations of all the shapes, returns a list
#finds the straight-line distance between two points
def distance(ax, ay, bx, by):
    return math.sqrt((by - ay)**2 + (bx - ax)**2)

#rotates point `A` about point `B` by `angle` radians clockwise.
def rotated_about(ax, ay, bx, by, angle):
    radius = distance(ax,ay,bx,by)
    angle += math.atan2(ay-by, ax-bx)
    return (
        round(bx + radius * math.cos(angle)),
        round(by + radius * math.sin(angle))
    )


def generateLocations(imageSize, imageCount):
    return [divmod(x, imageSize) for x in random.sample(range(imageSize * imageSize), imageCount)]

#Saves the pictures to positves folder
def generatePositiveImages(listOfParameters, listOfShapes, positiveCanvas, url):
    for locations in listOfParameters:
        img = ImageDraw.Draw(positiveCanvas)
        for index, shapeProp in enumerate(listOfShapes):
            loc = locations[index]
            size = random.randint((2 * shapeProp[1]) - int((2 * shapeProp[1]) * shapeProp[7]), int((2 * shapeProp[1]) * shapeProp[7]) + (2 * shapeProp[1]))
            R = random.randint(shapeProp[2] - int(shapeProp[2] * shapeProp[8]),int(shapeProp[2] * shapeProp[8]) + shapeProp[2])
            G = random.randint(shapeProp[3] - int(shapeProp[3] * shapeProp[9]),int(shapeProp[3] * shapeProp[9]) + shapeProp[3])
            B = random.randint(shapeProp[4] - int(shapeProp[4] * shapeProp[10]),int(shapeProp[4] * shapeProp[10]) + shapeProp[4])
            theta = random.randint(shapeProp[5] - int(shapeProp[5] * shapeProp[11]),int(shapeProp[5] * shapeProp[11]) + shapeProp[5])
            if(shapeProp[6] == True):
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    square_center = (loc[0] + (size / 2), loc[1] + (size / 2))
                    square_vertices = (
                        (square_center[0] + size / 2, square_center[1] + size / 2),
                        (square_center[0] + size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] + size / 2)
                    )
                    square_vertices = [rotated_about(x, y, square_center[0], square_center[1], math.radians(theta))
                                       for x, y in
                                       square_vertices]
                    img.polygon(square_vertices, fill=(R, G, B),outline=(R,G,B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R,G,B),outline=(R,G,B))
            elif(random.randint(1,10) < 7):
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    square_center = (loc[0] + (size / 2), loc[1] + (size / 2))
                    square_vertices = (
                        (square_center[0] + size / 2, square_center[1] + size / 2),
                        (square_center[0] + size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] + size / 2)
                    )
                    square_vertices = [rotated_about(x, y, square_center[0], square_center[1], math.radians(theta))
                                       for x, y in
                                       square_vertices]
                    img.polygon(square_vertices, fill=(R, G, B), outline=(R, G, B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R, G, B), outline=(R, G, B))
        positiveCanvas.thumbnail((256, 256), Image.ANTIALIAS)
        positiveCanvas.save(url + "Positive/{}_{},{}_{}.png".format(loc[0], loc[1], loc[0], loc[1]), "PNG")
        positiveCanvas = canvas.copy()

#Saves the pictures to positves folder
def generateNegativeImages(listOfParameters, listOfShapes, negativeCanvas, url):
    for locations in listOfParameters:
        img = ImageDraw.Draw(negativeCanvas)
        for index, shapeProp in enumerate(listOfShapes):
            loc = locations[index]
            if(shapeProp[6] != True):
                size = random.randint((2 * shapeProp[1]) - int((2 * shapeProp[1]) * shapeProp[7]),int((2 * shapeProp[1]) * shapeProp[7]) + (2 * shapeProp[1]))
                R = random.randint(shapeProp[2] - int(shapeProp[2] * shapeProp[8]),int(shapeProp[2] * shapeProp[8]) + shapeProp[2])
                G = random.randint(shapeProp[3] - int(shapeProp[3] * shapeProp[9]),int(shapeProp[3] * shapeProp[9]) + shapeProp[3])
                B = random.randint(shapeProp[4] - int(shapeProp[4] * shapeProp[10]),int(shapeProp[4] * shapeProp[10]) + shapeProp[4])
                theta = random.randint(shapeProp[5] - int(shapeProp[5] * shapeProp[11]),int(shapeProp[5] * shapeProp[11]) + shapeProp[5])
                # Setting shapeProp(shape Properties) equal to the index in list of shapes, which will be a tuple of (shape, size, R-value, G-Value, B-Value, Theta)
                # Therefore properties are availible by using shapeProp indices
                shapeProp = listOfShapes[index]
                # Cases depending on what shape property the shape holds, square, circle,etc...
                if (shapeProp[0] == "square"):
                    square_center = (loc[0] + (size / 2), loc[1] + (size / 2))
                    square_vertices = (
                        (square_center[0] + size / 2, square_center[1] + size / 2),
                        (square_center[0] + size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] - size / 2),
                        (square_center[0] - size / 2, square_center[1] + size / 2)
                    )
                    square_vertices = [rotated_about(x, y, square_center[0], square_center[1], math.radians(theta))
                                       for x, y in
                                       square_vertices]
                    img.polygon(square_vertices, fill=(R, G, B), outline=(R, G, B))
                if (shapeProp[0] == "circle"):
                    x = (loc[0] - size, loc[1] - size)
                    y = (loc[0] + size, loc[1] + size)
                    img.ellipse((x, y), fill=(R, G, B), outline=(R, G, B))
        negativeCanvas.thumbnail((256,256), Image.ANTIALIAS)
        negativeCanvas.save(url + "Negative/{}_{},{}_{}.png".format(loc[0], loc[1], loc[0], loc[1]), "PNG")
        negativeCanvas = canvas.copy()


def main(listOfShapes, imageCount,url):
    #Empty list that will be filled with the locations of the shapes, a list of seperate list for the locations, a set for each pair of shapes
    imageSize = 512
    listOfParameters = []
    for x in range(imageCount):
        locationsList = generateLocations(imageSize - 10,len(listOfShapes))
        listOfParameters.append(locationsList)
    positiveCanvas = canvas.copy()
    negativeCanvas = canvas.copy()
    #Saving images for positive's
    generatePositiveImages(listOfParameters, listOfShapes, positiveCanvas,url)
    generateNegativeImages(listOfParameters, listOfShapes, negativeCanvas,url)

if __name__ == "__main__":
    main(listOfShapes =vars(), imageCount = vars(),url= vars())