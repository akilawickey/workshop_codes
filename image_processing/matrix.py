import cv2
import numpy as np

# set the web-cam location
cap = cv2.VideoCapture(0)
height = 240
width= 320
cap.set(3,width)
cap.set(4,height)

# Loop to continuously get images

# Read the frames frome a camera
_,frame = cap.read()   
#cv2.imshow('frame', frame);

print frame;
cv2.imwrite('new.png',frame)
    
# Clean up and exit the program
cv2.destroyAllWindows()
cap.release()

