# Robot Operating System

**Namen:** Fabian Georgi (s0563263), <br> 			 Matthias Titze (s0563413) <br>
**Dozent:** Patrick Baumann <br>
**Kurs:** 	KI in der Robotik <br>

# Table of contents
- [1. Theorie](#1-theorie)
    - [1.1 Nodes](#11-nodes)
	- [1.2 Messages](#12-messages)
	- [1.3 Topics](#13-topics)
	- [1.4 Master](#14-master)
- [2. Objective I - Erstellung eines Publishers & Subscribers](#2-objective-i)


# 1. Theorie
Bevor die Implementierung beginnt, sollten zunächst einige Grundlagen geklärt werden.

### 1.1 Nodes <a name="#11-nodes"/>
Eine Node ist in ROS ein gekapselter Prozess der Berechnungen ausführt. Sie kann durch eine ausführbare Datei innerhalb eines Paketes erzeugt werden. Nodes werden zu einem Graphen verknüpft und kommunizieren miteinander über ***Topics*** (Streams), ***RPC Dienste*** und den ***Parameter Server***. Jeder dieser Knoten stellt im Grunde eine Form von Microservice dar, der eine sehr eng umfasste Aufgabe erfüllt. Somit benötigt eine Robotersteuerung in der Regel viele Nodes.<br>Die Verwendung von Nodes hat einige Vorteile: Das System ist modular und kann im Verglich zu monolitischen Architekturen leicht erweitert werden. Auch erreichen wir eine gesteigerte Fehlertoleranz, da sich Abstürze auf einzelne Komponenten beschränken. Die Wiederverwendung und Nutzung von existierenden Bausteinen wird begünstigt, da klare Schnittstellen entstehen. Implementierungsdetails sind hingegen oft verborgen.

### 1.2 Messages <a name="#12-messages"/>
Eine Message ist ein Datentyp mit denen Knoten untereinander Informationen austauschen können. Sie stellen eine Art Standard zur Kommunikation dar, sodass Sender und Empfänger über das selbe Dateiformat sprechen.
### 1.3 Topics <a name="#13-topics"/>
Ein Topic bildet in etwa den Mittelsmann beim Informationsaustausch. Der Sender kann Nachrichten auf dem Topic "ablegen". Der Empfänger hat nun die Möglichkeit sich, wenn er das Topic abonniert hat, die Nachricht abzuholen. So findet die Kommunikation zwischen den zwei Nodes über ein bezeichneten Stream statt. Im Grunde genommen entspricht diese Architektur dem Publisher-Subscriber-Prinzip bei Internetservices.
### 1.4 Master <a name="#14-master"/>
Der Master `roscore` ist die Registry in einem ROS-System. Er überwacht die anderen Nodes und Ihre dazugehörigen Topics. Er sorgt somit dafür, dass sich die Nodes untereinander finden können, wenn diese Informationen austauschen wollen. Des Weiteren stellt er den Parameterserver zur Verfügung, sodass dort Daten - ähnlich wie Environment-Variablen - verwaltet werden können.
### 1.5 Service <a name="15-service"/>
Der Service ist eine Definition für ein Client-Server-System. Er definiert einen Austauschkanal bei dem der Client einen Request an den Server sendet und von diesem eine Antwort erhält. Folglich sind an dem System mindestens zwei Nodes, wo bei eine der Client und der andere Server ist. Es könnten aber auch mehrere Clients den Server bedienen. Im Vergleich zum Topic ist anzumerken, dass das Absenden eines Request den Client zeitweilig blockiert bis die Antwort der Servers ankommt (synchrone Kommunikation). 


# 2. Architektur - Number Sensor
**Nodes:** In unserem Fall stellt eine Node die Sensoreingabe dar, eine weitere die Verarbeitung der Eingabe. Dazu gibt es die Kernsteuerung, welche wiederum eine AI-Komponente für die Auswertung und Analyse der Sensordaten nutzt. Es fällt leicht, sich weitere Komponenten, wie Bewegungssteuerung, Monitorausgabe etc. vorzustellen. Zusammenfassend seien hier die in diesem Projekt genutzten Nodes aufgelistet:

 - Camera
 - Processor
 - Controller
 - Predictor

**Graph:** Die erste Node `/camera` verschickt ein Bild, das einem Videoinput simuliert. Der zweite Knoten `/processor` empfängt dieses Bild und bearbeitet es (Reduktion auf Graustufen). Das bearbeitete Bild sendet er wieder weiter an den Steuerungsknoten `/controller`. Die Kamara verschickt des Weiteren eine Nummer, die die auf dem Bild dargestellte Zahl identifiziert. Der Controller empfängt diese Nummer und speichert sie zusammen mit dem vorverarbeiteten Bild ab. Nun wird das Bild an die AI-Komponente `/predictor` verschickt. Dieser analysiert es mit einem trainierten Neuronalen Netz und macht eine Voraussage über die abgebildete Nummer. Diese Voraussage returniert er. Der Controller kann nun beide Ergebnisse abgleichen.

![rqt_graph](./Docs/Graph_Task_2_1.png)<br>

**Kommunikation Kamera - Pre-Prozessor:** Die Kommunikation erfolgt über den Topic-Stream `/raw_images`. Das Kamaramodul ist Publisher der Nachricht und die Prozessor-Node der Subscriber. Das Nachritenformat ist die ROS Standard Sensor-Image-Message. 

![rqt_graph](./Docs/Graph_Task_1_3.png)<br>

**Kommunikation Pre-Prozessor - Controller:**  Diese Kommunikation erfolgt ebenfalls über eine Topic: `/processed_images`. Der Controller ist außerdem Abonnent des Topics `/image_numbers`.

**Kommunikation Controller - Predictor:**  Der Datentransfer wird hier mittels eines Services realisiert. Der `/controller` sendet das Bild synchron zum `/predictor`. Dieser analysiert das Bild und fällt auf Grundlage des Neuronalen Netzes seine Entscheidung. Er veruscht also die Zahl vorherzusagen, die er meint, die auf dem Bild dargestellt ist. Das Ergebnis wird zum `/controller` zurück gesendet. Anschließend werden die beiden Werte - reale Zahl von der `/camera` und die vorhergesagte Zahl vom `/predictor` verglichen, sodass eine Evaluation des Neuronalen Netzen ermöglicht wird. 

# 3. AI-Modell - Neural Network
### 3.1 Architektur - Dense Layer Neural Network

Das Modell besteht aus 6 Layern. In dem ersten Layern - dem sogenannten Input Layer - verarbeiten 784 Neuronen jeweils das einzelne Bild. Dabei wird das 28x28 MNIST-Bild in einen Vektor transponiert, sodass er die Dimension 784x1 erreicht. Das ermöglicht mittels einer Matrixmultiplikation eine sehr performante Klassifikation.

Es handelt sich hierbei um ein Fully-Connected Neuronales Netzwerk. Das bedeutet, dass jedes Neuron der n-ten Schicht mit jedem Neuron in der n+1-ten Schicht verbunden ist. Es ist also "vollkommen vernetzt".

Zwischen diesen Fully-Connected-Layern liegen Aktivierungslayer. Sie sorgen dafür, dass das Signal in einen definierten Wertebereich abgebildet wird. Die Aktivierungsfunktion bestimmt, wie der Aktivierungszustand eines Neurons von der Eingabe aller anderen Neuronen, die mit diesem Neuronen verbunden sind, abhängt. In dieser Architektur wurde sich für die am verbreiteste Aktivierungsfunktion entschieden: ReLU (Rectified Linear Unit) `f(x) = max(0,x)`. Hier wird der Wertebereich also nach [0, ∞) verschoben, also faktisch gesagt, alle positiven Werte werden "durchgelassen" und die negativen auf 0 gesetzt.

In der letzten Schicht - dem sogenannten Output-Layer - finden Sich nur noch 10 Neuronen, die potenziellen Klassen widerspiegeln (0, ..., 9). Hier wird dann als Aktivierungsfunktion die Softmax-Funktion genutzt. Sie bildet den Wertebereich auf [0,1] ab und hat desweiteren die Eigenschaft, dass die Summe aller Werte wiederum 1 ergeben. Das erinnert doch stark an die Stochastik, sodass wir diese Werte als einfache Wahrscheinlichkeiten betrachten können. Der höchste Wert ist also ausschlaggebend - da es laut dem Modell am wahrscheinlichsten ist -, sodass sich für diese dann entschieden wird.

Im Folgenden ist einmal die Architektur mit der Anzahl der Neuronen in den einzelnen Schichten und den jeweiligen Aktivierungsfunktionen in jeder Schicht zu sehen:

 ![img](https://miro.medium.com/max/1574/1*HWhBextdDSkxYvz0kEMTVg.png)

### 3.2 Kostenfunktion



### 3.3 Optimizer



### 3.4 Auswertung Training





# 4. Deployment 

Wir können das Projekt in einem Docker-Container ausführen, der ein Ubuntu Linux und die passende ROS Melodic Installation enthält. Dazu ist folgenden Image zu beziehen:

```bash
# Pull the base image.
$ docker pull neurorace/simulation-base
```

Der Docker-Container muss aus dem Image gebaut werden:

- Er erhält den Namen `neurorace`.
- Wir linken das Volumen mit den Quellcode des Projekts ein - der Pfad ist anzupassen.
- Wir setyen die `DISPLAY`-Variable, um X-Server Gui-Projektion of den Host zu erlauben.
- Schließlich startet der Conatiner in `bash`, damit er nicht gleich wieder runter fährt.

```bash
# Create a container from the image and set it to run bash.
$ docker run -it --name neurorace \
    -v <path>/NeuroRacer/Container:/home \
    -e DISPLAY=192.168.2.107:0 \
    neurorace/simulation-base \
    bash
```

Vor der Ausführung muss das Projekt gebait werden.

```bash
# Goto catkin workspace.
$ cd ../home/catkin_ws/
```

```bash
# Build the projekt with catkin.
$ catkin_make
```

```bash
# Source the required setup bash scripts.
$ source /opt/ros/melodic/setup.bash && source /home/catkin_ws/devel/setup.bash
```

Nun können wir das Projekt mit `roslaunch` ausführen.

```bash
# Start the core service.
$ roscore
```

```bash
# Use roslaunch to start all the nodes.
$ roslaunch number_sensor sensor.launch
```

Für Anzeige des Graphen kann RQT als GUI verwendet werden. Dieses ist eventuell nachzuinstallieren.

```bash
$ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
$ sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
$ sudo apt update
$ sudo apt-get install ros-melodic-rqt
```

Starte RQT und nutze die GUI, um das System zu analysieren.

```bash
# Start rqt
$ rqt
```









