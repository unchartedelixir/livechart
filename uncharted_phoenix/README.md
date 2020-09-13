# Uncharted Phoenix
A simple ***Elixir*** charting library that generates easy to customize charts for ***Phoenix*** and ***LiveView***.

## Features
Easily generate pie charts, column charts, bar charts, progress counters, and line charts
Generates repsonsive and accessible SVGs as LiveView components
Provides adavanced styling like gradients and rounded corners
Smooth animations for updating live data to the UI

## HEX Installation
Add this to your mix.exs deps:
``` {:uncharted_phoenix, "~> 0.1.0"} ```

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
![Column Chart](assets/images/column-chart.jpg "Column Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Bar Chart
![Bar Chart](assets/images/bar-chart.jpg "Bar Chart")
  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Pie Chart
![Pie Chart](assets/images/pie-chart.jpg "Pie Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Live Line Chart
![Live Line Chart](assets/images/line-chart.jpg "Live Line Chart")

  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

### The Progress Chart
![Progress Chart](assets/images/progress-chart.jpg "Progress Chart")
  #### Initialize
  
  #### Configure Chart
  
  #### Connecting to Live Data

