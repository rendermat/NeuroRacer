; Auto-generated. Do not edit!


(cl:in-package number_sensor-srv)


;//! \htmlinclude NumberPredictor-request.msg.html

(cl:defclass <NumberPredictor-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass NumberPredictor-request (<NumberPredictor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NumberPredictor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NumberPredictor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name number_sensor-srv:<NumberPredictor-request> is deprecated: use number_sensor-srv:NumberPredictor-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <NumberPredictor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader number_sensor-srv:image-val is deprecated.  Use number_sensor-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NumberPredictor-request>) ostream)
  "Serializes a message object of type '<NumberPredictor-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NumberPredictor-request>) istream)
  "Deserializes a message object of type '<NumberPredictor-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NumberPredictor-request>)))
  "Returns string type for a service object of type '<NumberPredictor-request>"
  "number_sensor/NumberPredictorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NumberPredictor-request)))
  "Returns string type for a service object of type 'NumberPredictor-request"
  "number_sensor/NumberPredictorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NumberPredictor-request>)))
  "Returns md5sum for a message object of type '<NumberPredictor-request>"
  "b275fc781a7750fca95a098877b3f1f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NumberPredictor-request)))
  "Returns md5sum for a message object of type 'NumberPredictor-request"
  "b275fc781a7750fca95a098877b3f1f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NumberPredictor-request>)))
  "Returns full string definition for message of type '<NumberPredictor-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NumberPredictor-request)))
  "Returns full string definition for message of type 'NumberPredictor-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NumberPredictor-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NumberPredictor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NumberPredictor-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude NumberPredictor-response.msg.html

(cl:defclass <NumberPredictor-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass NumberPredictor-response (<NumberPredictor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NumberPredictor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NumberPredictor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name number_sensor-srv:<NumberPredictor-response> is deprecated: use number_sensor-srv:NumberPredictor-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <NumberPredictor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader number_sensor-srv:result-val is deprecated.  Use number_sensor-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NumberPredictor-response>) ostream)
  "Serializes a message object of type '<NumberPredictor-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NumberPredictor-response>) istream)
  "Deserializes a message object of type '<NumberPredictor-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NumberPredictor-response>)))
  "Returns string type for a service object of type '<NumberPredictor-response>"
  "number_sensor/NumberPredictorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NumberPredictor-response)))
  "Returns string type for a service object of type 'NumberPredictor-response"
  "number_sensor/NumberPredictorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NumberPredictor-response>)))
  "Returns md5sum for a message object of type '<NumberPredictor-response>"
  "b275fc781a7750fca95a098877b3f1f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NumberPredictor-response)))
  "Returns md5sum for a message object of type 'NumberPredictor-response"
  "b275fc781a7750fca95a098877b3f1f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NumberPredictor-response>)))
  "Returns full string definition for message of type '<NumberPredictor-response>"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NumberPredictor-response)))
  "Returns full string definition for message of type 'NumberPredictor-response"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NumberPredictor-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NumberPredictor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NumberPredictor-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NumberPredictor)))
  'NumberPredictor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NumberPredictor)))
  'NumberPredictor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NumberPredictor)))
  "Returns string type for a service object of type '<NumberPredictor>"
  "number_sensor/NumberPredictor")