import cv2
import numpy as np

# set the web-cam location
cap = cv2.VideoCapture(0)
height = 240
width= 320
cap.set(3,width)
cap.set(4,height)

# Loop to continuously get images
while(1):
    # Read the frames frome a camera
    _,frame = cap.read()   
   
    grey = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY);
    cv2.imshow('frame1', grey);
   
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV);
    cv2.imshow('frame2', hsv);
    # if key pressed is 'Esc' then exit the loop
    if cv2.waitKey(33)== 27:
        break
    
# Clean up and exit the program
cv2.destroyAllWindows()
cap.release()
