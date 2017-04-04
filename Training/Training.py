from PIL import Image, ImageDraw
import random

imageSize = 256
rectSize = 2
canvas = Image.new("RGB", (imageSize, imageSize), "white")
positiveCount = 100
negativeCount = 100

# Generate training data for the Squares classifier neural network.
# The Squares classifier refers to a GoogLeNet model trained on the presence of red squares.
# Images featuring red squares are classified as positive, and all others as negative.
# Feature additions are planned, which would allow for the introduction of noise into generated images.
#
# imageSize: The resolution of the image in pixels, i.e. if imageSize = 256, then the output image will be 256x256.
# rectSize: The squares on the image will extend n pixels out in each dimension.
# positiveCount: The number of images generated which would classify as Positive.
# negativeCount: The number of images generated which would classify as Negative.

# When considering the generation of images, we need to ensure the uniqueness of each image.
# As such, the simplest way to generate these parameters is to randomly pick a set of numbers out of
# a larger set, which corresponds to the population of possible combinations of *all* parameters (a*b*c*d*...*n)
# and then derive the parameters from that sample. But how do you actually pick these numbers in a
# reasonable way?
#
# 1. Using Python's random.sample() on a generated range of all combinations.
# Time:  O(m) where m is the sample size if it is large. If the sample size is small, then it simply
# tries again if it selects a repeat. In other words, non-deterministic when at a manageable scale.
# Space: O(m) where m is min(population size, size(hashset(sample size))).
# Notes: It's difficult to add to already existing datasets. Python's implementation
# branches based on population size versus sample size. If the maximum size of the hashset used to store samples
# would be larger than the population size, then we make a copy of the population and remove elements from it.
# Interestingly, they state that using a range() generator function as an input is more space efficient, but this
# is only true when the sample size is small.
#
# 2. Use an n-bit block-cipher function, where n = ceil(log_2(size(population)))
# Time: approx O(1)--this can be a huge constant depending on the number of rounds. We suggest adjusting the number of
# rounds so that it is only random enough, not cryptographically random.
# Space: O(1)--Cipher functions map 1:1 from their input to output range. This means that we don't need to store
# generated values for any reason.
# Notes: Properties of cipher functions make them, at least theoretically, extremely convenient for producing sequences
# of unique random numbers. However, actually implementing these cipher functions is extremely complicated--we avoid
# this for the same reason we use Binary and Binomial Heap instead of Fibonacci Heap. An additional complication is that
# we can generate numbers outside of the range of the population size. We simply ignore these numbers and try again.
# The maximum number of these ``collisions'' is 2^n - size(population). In the worst case, the number of collisions
# is approximately equal to the size of the population, which means that on average, it will take only twice as long to
# generate all numbers in the population in the worst case.
#  A strong advantage of this technique means it is very easy to add to an existing dataset. You simply store the
# seed and offset (or key and counter/IV) and continue from where you left off. It has a glaring lack of randomness
# when n is small, but this shouldn't matter, because when generating a dataset for a neural network,
# we care more about uniform distribution.

# TODO:
# Modify generate_features() to support a list of parameters to make it simpler to generate features correctly.
# Create a conversion function to convert the output of generate_features() to a tuple of parameters for the same reason
# Create a function to convert that tuple of parameters to a filename.
# Modify implementation to prevent re-generation of previously generated images.
# Modify implementation to sort images into TRAINING, TEST, and VALIDATION sets.
# Introduce more parameters for feature creation so we can have noise.
# main() could reasonably be broken up into more functions.


def generate_features(x, y, count):
    """(int, int) ->  list<(int,int)>

    Enumerates a parameter-list for an image feature using a generator function.
    The current iteration is intended to create a list of unique pixel pairs for an image set.
    """
    # Randomly sample a lazy list corresponding to the full set of possible values
    # Convert the more computationally efficient representation into a tuple of parameters.
    return [divmod(x, imageSize) for x in random.sample(range(x * y), count)]


def main():
    random.seed()  # blank for OS time, otherwise insert fixed integer
    # this implementation has a weakness in that it should generate all features at the same time, but is good enough.
    # this means that a color will never be in the same position in a different image.
    reds    = generate_features(imageSize, imageSize, positiveCount);
    yellows = generate_features(imageSize, imageSize, positiveCount);
    for i, j in zip(reds, yellows):
        pos = canvas.copy()
        img = ImageDraw.Draw(pos)
        x = (j[0] - rectSize, j[1] - rectSize)
        y = (j[0] + rectSize, j[1] + rectSize)
        img.rectangle((x, y), fill="yellow", outline="yellow")
        x = (i[0] - rectSize, i[1] - rectSize)
        y = (i[0] + rectSize, i[1] + rectSize)
        img.rectangle((x, y), fill="red", outline="red")
        pos.save("Positive/{}_{},{}_{}.png".format(i[0],i[1],j[0],j[1]), "PNG")

    yellows = generate_features(imageSize, imageSize, positiveCount);
    for i in yellows:
        neg = canvas.copy()
        img = ImageDraw.Draw(neg)
        x = (i[0] - rectSize, i[1] - rectSize)
        y = (i[0] + rectSize, i[1] + rectSize)
        img.rectangle((x, y), fill="yellow", outline="yellow")
        neg.save("Negative/{}_{}.png".format(i[0],i[1]), "PNG")


if __name__ == "__main__":
    main()
