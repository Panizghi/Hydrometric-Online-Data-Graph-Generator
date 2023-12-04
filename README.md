# Accessing & Analyzing Hydrometric Online Data
Developed a Hydrometric graph generator by using JAVFAX through an automated system of accessing live online data to control the water depth in rivers and lakes for flood prevention.
The information allows informs us about how water flows in and around first nations, cities, towns and rural areas so that we can make engineering and public policy decisions, like where to build dams, as well as how we should attempt to control water flow in our lakes and rivers.

#### This project involves the analysis of hydrometric data, focusing on an automated system for accessing live online data to control water depth in rivers and lakes. It includes two Java classes, StationDataProvider and StationAnalyzer, along with a MATLAB script for visualizing water level data. 

## Java Classes
### 1. StationDataProvider
#### Purpose:
The StationDataProvider class serves as a bridge between an online data source and the Java program. It retrieves live hydrometric data from a specified URL, parses the data, and provides a stream of WaterLevel objects.

#### Functionality:
Connects to an online CSV data source containing hydrometric data.
Parses the CSV data and converts it into a stream of WaterLevel objects.
Handles the communication between the Java program and the external data source.
Dependencies:
Apache Commons CSV library.
### 2. StationAnalyzer
#### Purpose:
The StationAnalyzer class processes the stream of WaterLevel objects, extracting meaningful insights and generating graphical representations of the water level data.

#### Functionality:
Calculates the average water level from the stream of WaterLevel objects.
Creates an XYChart using the XChart library to visualize the historical water level data over time.
Provides methods to obtain statistical information about the water level data.
Dependencies:
XChart library.

## MATLAB Script
HydrometricDataAnalysis.m
#### Purpose:
The MATLAB script retrieves daily water level data from specific hydrometric stations in Ontario, Canada, and generates graphical representations of the data.

##### Functionality:
Constructs URLs for each hydrometric station to access live data.
Fetches data from the URLs using the webread function.
Processes and cleans the data, calculating statistical measures.
Plots the original water level data, average values, and standard deviation.
Generates separate plots for each hydrometric station.
Dependencies:
MATLAB.


## How to Use:
#### Java Classes:

- Include the necessary libraries in your Java project.
- Instantiate StationDataProvider with the desired data source URL.
- Use StationAnalyzer to process the data stream and generate charts.

#### MATLAB Script:

Ensure MATLAB is installed on your system.
Run the script, modifying station IDs and names as needed.
View the generated plots for insights into water level data.

<img width="500" alt="Screen Shot 2022-05-24 at 10 23 51 PM" src="https://user-images.githubusercontent.com/90856064/170166207-57689f7d-eaaa-43d0-870b-75d27f8f2502.png">
