
(cl:in-package :asdf)

(defsystem "number_sensor-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "NumberPredictor" :depends-on ("_package_NumberPredictor"))
    (:file "_package_NumberPredictor" :depends-on ("_package"))
  ))