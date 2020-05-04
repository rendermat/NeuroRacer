#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from number_sensor.srv import NumberPredictor, NumberPredictorResponse
from cv_bridge import CvBridge, CvBridgeError
import cv2
import torch
from torchvision import transforms
import numpy as np
import os

# Define the image conversion bridge.
bridge = CvBridge()

# Setup the path to the source raw images. 
current_folder = os.path.dirname(os.path.abspath(__file__))
models_folder = os.path.join(current_folder, 'models')
model_file_path = os.path.join(models_folder, 'mnist_model_01.pt')
# Load the model from file.
model = torch.load(model_file_path) 

def predict_number(req):
    # Extract the input image form the request.
    input_image = bridge.imgmsg_to_cv2(req.image)
    # Log the information for debug purposes.
    rospy.loginfo('AI-In: {0}'.format(np.shape(input_image)))
    
    # Transform the image to normaliyed tensor.
    transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,)),])
    image_tensor = transform(np.array(input_image)).view(1, 784)
    
    # Make a prediction and return.
    with torch.no_grad():
        logps = model(image_tensor)
    
    ps = torch.exp(logps)
    probab = list(ps.numpy()[0])
    prediction = probab.index(max(probab))
    
    rospy.loginfo('AI-Out: {0}'.format(prediction))
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