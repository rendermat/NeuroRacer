; Auto-generated. Do not edit!


(cl:in-package number_sensor-msg)


;//! \htmlinclude IntWithHeader.msg.html

(cl:defclass <IntWithHeader> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass IntWithHeader (<IntWithHeader>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IntWithHeader>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IntWithHeader)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name number_sensor-msg:<IntWithHeader> is deprecated: use number_sensor-msg:IntWithHeader instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IntWithHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader number_sensor-msg:header-val is deprecated.  Use number_sensor-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <IntWithHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader number_sensor-msg:data-val is deprecated.  Use number_sensor-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IntWithHeader>) ostream)
  "Serializes a message object of type '<IntWithHeader>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IntWithHeader>) istream)
  "Deserializes a message object of type '<IntWithHeader>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IntWithHeader>)))
  "Returns string type for a message object of type '<IntWithHeader>"
  "number_sensor/IntWithHeader")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IntWithHeader)))
  "Returns string type for a message object of type 'IntWithHeader"
  "number_sensor/IntWithHeader")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IntWithHeader>)))
  "Returns md5sum for a message object of type '<IntWithHeader>"
  "e7344a45486eefa24d2f337265df37ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IntWithHeader)))
  "Returns md5sum for a message object of type 'IntWithHeader"
  "e7344a45486eefa24d2f337265df37ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IntWithHeader>)))
  "Returns full string definition for message of type '<IntWithHeader>"
  (cl:format cl:nil "Header header~%int32 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IntWithHeader)))
  "Returns full string definition for message of type 'IntWithHeader"
  (cl:format cl:nil "Header header~%int32 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IntWithHeader>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IntWithHeader>))
  "Converts a ROS message object to a list"
  (cl:list 'IntWithHeader
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
