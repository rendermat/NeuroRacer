#!/usr/bin/env python
import rospy
import message_filters
from sensor_msgs.msg import Image
from number_sensor.msg import IntWithHeader
from number_sensor.srv import NumberPredictor, NumberPredictorResponse
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

# Define the image conversion bridge.
bridge = CvBridge()
# Create a list to store the input for later comparisson.
input_list = []

def predictor_client(processed_image):
    # Convert the processed image to a ROS sensor image message. 
    image_message = bridge.cv2_to_imgmsg(processed_image, encoding="passthrough")
    
    # Wait for the service to be available.
    rospy.wait_for_service('predictor_service')
    try:
        predictor = rospy.ServiceProxy('predictor_service', NumberPredictor)
        response = predictor(image_message)
        return response.result
    except rospy.ServiceException, e:
        print 'Service call failed: {0}'.format(e)

def callback(image_message, number_message):
    # Extract the processed image form the message.
    processed_image = bridge.imgmsg_to_cv2(image_message)
    # Extract the image number from the message.
    image_number = number_message.data
    # Log the information for debug purposes.
    rospy.loginfo('Num: {0}'.format(number_message.data))
    rospy.loginfo('Proc: {0}'.format(np.shape(processed_image)))
    
    # Store the input data to the dictionary. 
    input_list.append((image_number, processed_image))
    
    # Use the client to request a number prediction from the ai server. 
    predicted_number = predictor_client(processed_image)
    
    # Check if prediction was real number.
    match = predicted_number ==  input_list.pop(0)[0]
    rospy.loginfo('Match: {0}'.format(match))
    
def controller():
    # Define the processor node.
    rospy.init_node('processor', anonymous=True)
    
    # Subscribe to raw input images and image number topics.
    sub_image = message_filters.Subscriber('processed_images', Image)
    sub_number = message_filters.Subscriber('image_numbers', IntWithHeader)
    ts = message_filters.TimeSynchronizer([sub_image, sub_number], 10)
    ts.registerCallback(callback)

    # spin() simply keeps python from exiting until this node is stopped.
    rospy.spin()

if __name__ == '__main__':
    controller()