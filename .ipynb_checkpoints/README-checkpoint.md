[rqt_graph]: https://github.com/Syntex2k/ros/blob/master/docs/rqt_graph.png "Kommunikation zwischen Publisher und Subscriber"


# Robot Operating System

**Name:** Fabian Georgi <br>
**Matrikelnummer:** s0563263 <br>
**Dozent:** Patrick Baumann <br>
**Kurs:** KI in der Robotik <br>

# Table of contents
- [1. Theorie](#1-theorie)
    - [1.1 Nodes](#11-nodes)
	- [1.2 Messages](#12-messages)
	- [1.3 Topics](#13-topics)
	- [1.4 Master](#14-master)
- [2. Objective I - Erstellung eines Publishers & Subscribers](#2-objective-i)


# 1. Theorie <a name="1-theorie"/>
Bevor die Implementierung beginnt, sollten zunächst einige Grundlagen geklärt werden.
### 1.1 Nodes <a name="#11-nodes"/>
Ein Node ist in ROS nicht anderes als eine ausführbare Datei innerhalb eines Paketes. Nodes können miteinander mittels Nachrichten über sogenannte Topics kommunizeren.
### 1.2 Messages <a name="#12-messages"/>
Eine Message ist ein Datentyp mit denen Knoten untereinander Informationen austauschen können. Sie stellen eine Art Standard zur Kommunikation dar, sodass Sender und Empfänger über des selbe Dateiformat sprechen.
### 1.3 Topics <a name="#13-topics"/>
Ein Topic stellt in etwa den Mittelsmann beim Informationsaustausch ist. Der Sender kann diese Nachrichten dort auf dem Topic "ablegen". Der Empfänger hat nun die Möglichkeit sich, wenn er das Topic abonniert hat, die Nachricht abzuholen. So findet die Kommunikation zwischen den zwei Nodes über ein Topic statt.
### 1.4 Master <a name="#14-master"/>
Der Master-Node stellt den obersten Knoten dar. Er ist der oberste Knoten im Graphen und verwaltet die anderen. Er überwacht die anderen Nodes und Ihre dazugehörigen Topics. Er sorgt dafür, dass sich die Nodes untereinander finden können, damit diese Informationen austauschen können. Des Weiteren stellt er den Parameterserver zur Verfügung, sodass dort Daten - ähnlich wie Environment-Variablen - verwaltet werden können. 


# 2. Objective I - Erstellung eines Publishers & Subscribers <a name="2-objective-i"/>
Ziel dieser Aufgabe ist es zwei Nodes bereitzustellen. Der erste Node (Talker/Cam) verschickt ein Bild und eine Zahl. Der zweite Node empfängt das Bild und bearbeitet es (z.B. schneidet das Bild zurecht). Dieses bearbeitete Bild sendet er wieder weiter.

Mittels rqt-graph lässt sich folgender Plot erstellen: <br>
![rqt_graph] <br>
Der `cam` Node verschickt einmal ein Integer an das `number_topic` und ein Bild an das `image_topic`. Der `processor` holt sich das Bild dort ab, bearbeitet und sendet es weiter an das `processed_image_topic`. Dort ist jedoch noch kein Subscriber, sodass es erstmal im Leeren landet.

