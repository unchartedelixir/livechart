# Uncharted
A simple ***Elixir*** charting library that generates easy to customize charts.

![Bar Chart](/demo/assets/static/images/uncharted.jpg?raw=true "Bar Chart")

## Features
- Easily generate pie charts, column charts, bar charts, progress counters, and line charts
- Generates responsive and accessible SVGs as LiveView components
- Provides advanced styling like gradients and rounded corners
- Smooth animations for updating live data to the UI

## Uncharted Phoenix
[Uncharted Phoenix](/uncharted_phoenix) is a Hex package that generates SVGs as live view components. It builds on the
basic chart package Uncharted and adapts Uncharted charts for display as components in LiveView.

***Charts Included***:
- The Pie Chart
- The Column Chart
- The Progress Chart
- The Live Line Chart
- The Bar Chart

## Uncharted Demo
The[Uncharted Demo](/demo) is a working example of each of the Uncharted chart components.

To start the demo Phoenix server:

* Install dependencies with `mix deps.get`
* Install Node.js dependencies with `npm install` inside the assets directory
* Start Phoenix endpoint with `mix phx.server`

Now you can visit `localhost:4000` from your browser.


## Contributing

We appreciate any contribution to Uncharted!

To contribute feedback, please open a GitHub issue.

To contribute a specific feature or bugfix, please open a PR. Before submitting your PR, we ask you to run the Elixir
tests, lint, and formatting tools we use on the project. If you have a contribution to make but don't know how to run
the tools below, go ahead and open it and we will help you. For larger changes, open an issue first so that we can have
a discussion before you put a lot of work into a PR.

To run the tests and formatting tools:

```
$ mix deps.get
$ mix test
$ mix format
$ mix credo--strict
 ```
