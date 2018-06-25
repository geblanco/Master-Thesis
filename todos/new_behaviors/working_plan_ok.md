# Navigation Behaviors - Tasks

1. Identify necessary behaviors.
    1. For each behavior extract the topics it will accept and the algorithms it will cover.
    2. For each behavior estimate time to implement, along with it's launcher, time to integrate and validate it.
    3. For each behavior plan some scenarios to test the behavior
    4. For each behavior implement, integrate, create the scenario and validate the behavior.

## 1. Identified Behaviors

Think about this 

### 1. Self Localize and Map By Lidar

### 3. Generate Global Path to Goal (or generate path in occupancy grid)

### 4. Follow path in occupancy grid

### 2. Go to point in occupancy grid


Decidir lo de las trayectorias del go to point

El go to point comprueba todo el tiempo que el camino este libre
Go to point con toda la implementacion del nav_interface 
Duplicar codigo del follow path y generate path dentro del go to point

Comprobar que trajectory controller estan usando

Go to point, Hz de update para comprobar el camino
~~Escuchar society pose, comprobar que no esten en el camino~~

Hablar con Hriday y Alejo sobre obstaculos moviles.

Comprobar si move base/navstack tiene metodo de comprobar obstaculos en la trayectoria (si no igual hacer un proceso)

Justificacion teorica de duplicar codigo por eficiencia, es un trabajo experimental, libertad de que los otros dos desaparezcan.
