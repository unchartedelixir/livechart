# Uncharted
A simple ***Elixir*** charting library that generates easy to customize charts

## Features
- Easily generate pie charts, column charts, bar charts, progress counters, and line charts
- Generates repsonsive and accessible SVGs as LiveView components
- Provides adavanced styling like gradients and rounded corners
- Smooth animations for updating live data to the UI

## Phoenix & LiveView Package

### Installation

## How To Use

### Base Chart Colors 
Base chart configuration allows you to define a set solid colors and gradients for any chart you will use within the applciation.

#### Set a Base Color
```
colors = %{
  blue: "#6bdee4",
}
```

#### Set a Base Gradient Color
```
colors = %{
  rose_gradient: %Gradient{
    start_color: "#642B73",
    stop_color: "#C6426E"
  }
}
```

### The Column Chart
![Column Chart](demo/assets/static/images/column-chart.jpg?raw=true "Column Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Bar Chart
![Bar Chart](demo/assets/static/images/bar-chart.jpg?raw=true "Bar Chart")
  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Pie Chart
![Pie Chart](demo/assets/static/images/pie-chart.jpg?raw=true "Pie Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Live Line Chart
![Live Line Chart](demo/assets/static/images/line-chart.jpg?raw=true "Live Line Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Progress Chart
![Progress Chart](demo/assets/static/images/progress-chart.jpg?raw=true "Progress Chart")
  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data
  
  ## Contributing
  We appreciate any contribution to LiveView.
  
  Running the Elixir tests:
  ```
  $ mix deps.get
  $ mix test
  $ mix format
  $ mix credo--strict
  ```




