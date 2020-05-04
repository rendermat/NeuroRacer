#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from number_sensor.msg import IntWithHeader
from cv_bridge import CvBridge, CvBridgeError
import cv2
import os
import random as rand

# Setup the path to the source raw images. 
current_folder = os.path.dirname(os.path.abspath(__file__))
raw_images_folder = os.path.join(current_folder, 'raw_images')

# Define the image conversion bridge.
bridge = CvBridge()

def camera():
    # Define topics to publish to.
    pub_image = rospy.Publisher('raw_images', Image, queue_size=10)
    pub_number = rospy.Publisher('image_numbers', IntWithHeader, queue_size=1)
    # Define the camera input node.
    rospy.init_node('cam', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    
    while not rospy.is_shutdown():
        
        # Select an image number in range 0 to 9.
        image_index = rand.randint(0, 9)
        # Load the image form disc.
        image_file_path = os.path.join(raw_images_folder, '{0}.png'.format(image_index))
        cv_image = cv2.imread(image_file_path)

        # Convert the raw image to a ROS sensor image message. 
        image_message = bridge.cv2_to_imgmsg(cv_image, encoding="passthrough")
        # Package the image index into another message.
        number_message = IntWithHeader()
        number_message.data = image_index

        # Publish the image message.
        pub_image.publish(image_message)
        pub_number.publish(number_message)
        rate.sleep()

if __name__ == '__main__':
    try:
        camera()
    except rospy.ROSInterruptException:
        pass