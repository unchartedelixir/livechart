# Uncharted
A simple ***Elixir*** charting library that generates easy to customize charts.

![Bar Chart](/demo/assets/static/images/uncharted.jpg?raw=true "Bar Chart")

## Features
- Easily generate pie charts, column charts, bar charts, progress counters, and line charts
- Generates repsonsive and accessible SVGs as LiveView components
- Provides adavanced styling like gradients and rounded corners
- Smooth animations for updating live data to the UI

## Uncharted Phoenix
[Uncharted Phoenix](/uncharted_phoenix) is a Hex package that genertaes svgs as live view compoents.

***Charts Inluded***:
- The Pie Chart
- The Column Chart
- The Progress Chart
- The Live Line Chart
- The Bar Chart

## Uncharted Demo
The[Uncharted Demo](/demo) is a working example of each of Uncarted chart components.

To start your Phoenix server:

Install dependencies with `mix deps.get`
Install Node.js dependencies with `npm install` inside the assets directory
Start Phoenix endpoint with `mix phx.server`

Now you can visit `localhost:4000` from your browser.


## Contributing
We appreciate any contribution to Uncharted.

Running the Elixir tests:
```
$ mix deps.get
$ mix test
$ mix format
$ mix credo--strict
  ```




