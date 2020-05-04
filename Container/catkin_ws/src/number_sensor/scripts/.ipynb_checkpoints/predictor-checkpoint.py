#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from number_sensor.srv import NumberPredictor, NumberPredictorResponse
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

# Define the image conversion bridge.
bridge = CvBridge()

def predict_number(req):
    # Extract the input image form the request.
    input_image = bridge.imgmsg_to_cv2(req.image)
    # Log the information for debug purposes.
    rospy.loginfo('AI-In: {0}'.format(np.shape(input_image)))
    
    # Make a prediction and return (dummy for now).
    prediction = 10
    return NumberPredictorResponse(prediction)

def predictor_server():
    # define the predictor server node.
    rospy.init_node('predictor_server')
    
    # Define the service this server fullfills and link the request end point.
    service = rospy.Service('predictor_service', NumberPredictor, predict_number)
    print 'Ready to predict numbers from images.'
    
    # spin() simply keeps python from exiting until this node is stopped.
    rospy.spin()

if __name__ == "__main__":
    predictor_server()