# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "number_sensor: 1 messages, 1 services")

set(MSG_I_FLAGS "-Inumber_sensor:/home/catkin_ws/src/number_sensor/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(number_sensor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_custom_target(_number_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "number_sensor" "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_custom_target(_number_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "number_sensor" "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(number_sensor
  "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/number_sensor
)

### Generating Services
_generate_srv_cpp(number_sensor
  "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/number_sensor
)

### Generating Module File
_generate_module_cpp(number_sensor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/number_sensor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(number_sensor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(number_sensor_generate_messages number_sensor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_dependencies(number_sensor_generate_messages_cpp _number_sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_dependencies(number_sensor_generate_messages_cpp _number_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(number_sensor_gencpp)
add_dependencies(number_sensor_gencpp number_sensor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS number_sensor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(number_sensor
  "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/number_sensor
)

### Generating Services
_generate_srv_eus(number_sensor
  "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/number_sensor
)

### Generating Module File
_generate_module_eus(number_sensor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/number_sensor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(number_sensor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(number_sensor_generate_messages number_sensor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_dependencies(number_sensor_generate_messages_eus _number_sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_dependencies(number_sensor_generate_messages_eus _number_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(number_sensor_geneus)
add_dependencies(number_sensor_geneus number_sensor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS number_sensor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(number_sensor
  "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/number_sensor
)

### Generating Services
_generate_srv_lisp(number_sensor
  "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/number_sensor
)

### Generating Module File
_generate_module_lisp(number_sensor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/number_sensor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(number_sensor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(number_sensor_generate_messages number_sensor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_dependencies(number_sensor_generate_messages_lisp _number_sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_dependencies(number_sensor_generate_messages_lisp _number_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(number_sensor_genlisp)
add_dependencies(number_sensor_genlisp number_sensor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS number_sensor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(number_sensor
  "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/number_sensor
)

### Generating Services
_generate_srv_nodejs(number_sensor
  "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/number_sensor
)

### Generating Module File
_generate_module_nodejs(number_sensor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/number_sensor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(number_sensor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(number_sensor_generate_messages number_sensor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_dependencies(number_sensor_generate_messages_nodejs _number_sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_dependencies(number_sensor_generate_messages_nodejs _number_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(number_sensor_gennodejs)
add_dependencies(number_sensor_gennodejs number_sensor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS number_sensor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(number_sensor
  "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor
)

### Generating Services
_generate_srv_py(number_sensor
  "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor
)

### Generating Module File
_generate_module_py(number_sensor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(number_sensor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(number_sensor_generate_messages number_sensor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/srv/NumberPredictor.srv" NAME_WE)
add_dependencies(number_sensor_generate_messages_py _number_sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/catkin_ws/src/number_sensor/msg/IntWithHeader.msg" NAME_WE)
add_dependencies(number_sensor_generate_messages_py _number_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(number_sensor_genpy)
add_dependencies(number_sensor_genpy number_sensor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS number_sensor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/number_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/number_sensor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(number_sensor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(number_sensor_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/number_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/number_sensor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(number_sensor_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(number_sensor_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/number_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/number_sensor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(number_sensor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(number_sensor_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/number_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/number_sensor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(number_sensor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(number_sensor_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/number_sensor
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(number_sensor_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(number_sensor_generate_messages_py sensor_msgs_generate_messages_py)
endif()
