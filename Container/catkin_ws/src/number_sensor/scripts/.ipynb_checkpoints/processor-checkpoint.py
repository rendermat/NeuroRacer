#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

# Define the image conversion bridge.
bridge = CvBridge()
# Create a topic for forwarding the processed images.
pub_image = rospy.Publisher('processed_images', Image, queue_size=10)

def callback(image_message):
    # Extract the image form the message.
    raw_image = bridge.imgmsg_to_cv2(image_message)
    rospy.loginfo('Raw: {0}'.format(np.shape(raw_image)))
    
    # Crop the image (as an example manipulation). 
    margin = 0
    #processed_image = raw_image[margin:-margin, margin:-margin]
    processed_image = cv2.cvtColor(raw_image, cv2.COLOR_BGR2GRAY)
    rospy.loginfo('Grey: {0}'.format(np.shape(processed_image)))
    
    # Convert the processed image to a ROS sensor image message. 
    image_message = bridge.cv2_to_imgmsg(processed_image, encoding="passthrough")
    # Publish the processed image.
    pub_image.publish(image_message)
    
def processor():
    # Define the processor node.
    rospy.init_node('processor', anonymous=True)
    
    # Subscribe to raw input images topic.
    sub_image = rospy.Subscriber('raw_images', Image, callback)
    
    # spin() simply keeps python from exiting until this node is stopped.
    rospy.spin()

if __name__ == '__main__':
    processor()