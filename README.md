# Joystick publishing in ROS2 with QT

The joystick interface is developed using Qt. This interface communicates with ROS2, publishing the buttons pressed simultaneously. Additionally, the circular object located at the top of the screen can be held and moved, and this movement is shared with ROS2, updating the position of the object.

**Note:** New features are being added to the main branch, it is still being worked on, please download the v1.0 branch.

### System Requirements
- **OS:** Ubuntu 22.04 (Jammy Jellyfish)
- **QT Version:** 6
- **ROS2:** Humble Hawksbill
---
**Note:** Different button effects were added to simulate button presses.

---

### Problems & Solutions

1. It fails to detect the ROS2 libraries:
    - Launch the QT Creator application from the terminal
    - Make sure to run `source /opt/ros/humble/setup.bash` in the terminal where QT Creator is launched
2. The application not working on the Windows side.
    - ROS2 launches for Linux should be initiated via the command prompt (cmd).


[qt_joy.webm](https://github.com/serkanMzlm/QT-ROS2-Joystick/assets/74418302/1093c2bf-77d2-40e3-9b08-3631efae21ea)



## NEW 

[Screencast from 09-01-2025 21:21:28.webm](https://github.com/user-attachments/assets/9cb52734-c413-42d4-ae94-59be2bc1b3ea)
