;; Auto-generated. Do not edit!


(when (boundp 'number_sensor::NumberPredictor)
  (if (not (find-package "NUMBER_SENSOR"))
    (make-package "NUMBER_SENSOR"))
  (shadow 'NumberPredictor (find-package "NUMBER_SENSOR")))
(unless (find-package "NUMBER_SENSOR::NUMBERPREDICTOR")
  (make-package "NUMBER_SENSOR::NUMBERPREDICTOR"))
(unless (find-package "NUMBER_SENSOR::NUMBERPREDICTORREQUEST")
  (make-package "NUMBER_SENSOR::NUMBERPREDICTORREQUEST"))
(unless (find-package "NUMBER_SENSOR::NUMBERPREDICTORRESPONSE")
  (make-package "NUMBER_SENSOR::NUMBERPREDICTORRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass number_sensor::NumberPredictorRequest
  :super ros::object
  :slots (_image ))

(defmethod number_sensor::NumberPredictorRequest
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(defclass number_sensor::NumberPredictorResponse
  :super ros::object
  :slots (_result ))

(defmethod number_sensor::NumberPredictorResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass number_sensor::NumberPredictor
  :super ros::object
  :slots ())

(setf (get number_sensor::NumberPredictor :md5sum-) "b275fc781a7750fca95a098877b3f1f6")
(setf (get number_sensor::NumberPredictor :datatype-) "number_sensor/NumberPredictor")
(setf (get number_sensor::NumberPredictor :request) number_sensor::NumberPredictorRequest)
(setf (get number_sensor::NumberPredictor :response) number_sensor::NumberPredictorResponse)

(defmethod number_sensor::NumberPredictorRequest
  (:response () (instance number_sensor::NumberPredictorResponse :init)))

(setf (get number_sensor::NumberPredictorRequest :md5sum-) "b275fc781a7750fca95a098877b3f1f6")
(setf (get number_sensor::NumberPredictorRequest :datatype-) "number_sensor/NumberPredictorRequest")
(setf (get number_sensor::NumberPredictorRequest :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
int32 result
")

(setf (get number_sensor::NumberPredictorResponse :md5sum-) "b275fc781a7750fca95a098877b3f1f6")
(setf (get number_sensor::NumberPredictorResponse :datatype-) "number_sensor/NumberPredictorResponse")
(setf (get number_sensor::NumberPredictorResponse :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
int32 result
")



(provide :number_sensor/NumberPredictor "b275fc781a7750fca95a098877b3f1f6")


