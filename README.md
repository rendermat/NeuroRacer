# Robot Operating System

**Namen:** Fabian Georgi (s0563263), <br> Matthias Titze (s0563413) <br>
**Dozent:** Patrick Baumann <br>
**Kurs:** KI in der Robotik <br>

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
Eine Message ist ein Datentyp mit denen Knoten untereinander Informationen austauschen können. Sie stellen eine Art Standard zur Kommunikation dar, sodass Sender und Empfänger über des selbe Dateiformat sprechen.
### 1.3 Topics <a name="#13-topics"/>
Ein Topic stellt in etwa den Mittelsmann beim Informationsaustausch ist. Der Sender kann diese Nachrichten dort auf dem Topic "ablegen". Der Empfänger hat nun die Möglichkeit sich, wenn er das Topic abonniert hat, die Nachricht abzuholen. So findet die Kommunikation zwischen den zwei Nodes über ein Topic statt.
### 1.4 Master <a name="#14-master"/>
Der Master-Node stellt den obersten Knoten dar. Er ist der oberste Knoten im Graphen und verwaltet die anderen. Er überwacht die anderen Nodes und Ihre dazugehörigen Topics. Er sorgt dafür, dass sich die Nodes untereinander finden können, damit diese Informationen austauschen können. Des Weiteren stellt er den Parameterserver zur Verfügung, sodass dort Daten - ähnlich wie Environment-Variablen - verwaltet werden können.
### 1.5 Service <a name="15-service"/>
Der Service stellt eine Art speziellen Node dar. Es stellt auch einen Prozess dar, jedoch erweitert er jenen dahingegend, dass ein Service immer eine Antwort zurückliefert.




# 2. Architektur - Number Sensor
**Nodes:** In unserem Fall stellt eine Node die Sensoreingabe dar, eine weitere die Verarbeitung der Eingabe. Dazu gibt es die Kernsteuerung, welche wiederum eine AI-Komponente für die Auswertung und Analyse der Sensordaten nutzt. Es fällt leicht, sich weitere Komponenten, wie Bewegungssteuerung, Monitorausgabe etc. vorzustellen. Zusammenfassend seien hier die in diesem Projekt genutzten Nodes aufgelistet:

 - Camera
 - Processor
 - Controller
 - Predictor

**Graph:** Die erste Node `/camera` verschickt ein Bild, das einem Videoinput simuliert. Der zweite Knoten `/processor` empfängt dieses Bild und bearbeitet es (Reduktion auf Graustufen). Das bearbeitete Bild sendet er wieder weiter an den Steuerungsknoten `/controller`. Die Kamara verschickt des weiteren eine Nummer, die die auf dem Bild dargestellte Zahl identifiziert. Der Controller empfängt diese Nummer und speichert sie zusammen mit dem vorverarbeiteten Bild ab. Nun wird das Bild an die AI-Komponente `/predictor` verschickt. Dieser analysiert es mit einem trainierten Neuronalen Netz und macht eine Voraussage über die abgebildete Nummer. Diese Voraussage returniert er. Der Controller kann nun beide Ergebnisse abgleichen.

![rqt_graph](./Docs/Graph_Task_2_1.png)<br>

**Kommunikation Kamera - Pre-Prozessor:** Die Kommunikation erfolgt über den Topic-Stream `/raw_images`. Das Kamaramodul ist Publisher der Nachricht und die Prozessor-Node der Subscriber. Das Nachritenformat ist die ROS Standard Sensor-Image-Message. 
![rqt_graph](./Docs/Graph_Task_1_3.png)<br>

**Kommunikation Pre-Prozessor - Controller:**  Diese Kommunikation erfolgt ebenfalls über eine Topic: `/processed_images`. Der Controller ist außerdem Abonnent des Topics `/image_numbers`.

**Kommunikation Controller - Predictor:**  Dkjkjkjk



# 3. AI-Modell - Neural Network
### 3.1 Architektur - Dense Layer Neural Network

klklk

### 3.2 Kostenfunktion

### 3.3 Optimizer

### 3.4 Auswertung Training





# 4. Deployment 







