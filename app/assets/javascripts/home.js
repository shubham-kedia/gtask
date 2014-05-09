$(document).ready(function(){
// $.ajax({
// 	type: "GET",
// 	data: "data",
// 	dataType: "json",
// 	url: "/home/barchart/"
// })
// .done(function( msg ) {
// 	// console.log(msg);
// 	// console.log(JSON.stringify(msg.data));
// });
divid0='#barchart1'
divid1='#barchart2'
renderlinechart();
renderChart(divid0);
renderChart(divid1);
renderPie();
$( window ).resize(function() {
	$("#barchart1").empty();
	renderChart(divid0);
	$("#barchart2").empty();
	renderChart(divid1);
	$("#multilinechart").empty();
	renderlinechart();
	$("#mypie").empty();
	renderPie();
});

function renderlinechart(){
	margin = {top: 20, right: 55, bottom: 30, left: 50};
	width=$('#multilinechart').width() - margin.left - margin.right;
	height = 500 - margin.top - margin.bottom;
	// var parseDate = d3.time.format("%Y%m%d").parse;
	var parseDate = d3.time.format("%b/%d/%Y").parse;

	var x = d3.time.scale()
	.range([0, width]);

	var y = d3.scale.linear()
	.range([height, 0]);

	var color = d3.scale.category10();

	var xAxis = d3.svg.axis()
	.scale(x)
	.orient("bottom");

	var yAxis = d3.svg.axis()
	.scale(y)
	.orient("left");

	var line = d3.svg.line()
	.interpolate("basis")
	.x(function(d) { 
		return x(d.date); })
	.y(function(d) { 
		return y(d.usage); });

	var svg = d3.select("#multilinechart").append("svg")
	.attr("width", width + margin.left + margin.right)
	.attr("height", height + margin.top + margin.bottom)
	.append("g")
	.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	d3.json("/home/barchart", function(error, data) {
		data.forEach(function(d) {
			delete d.id;
		});
		color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

		data.forEach(function(d) {
			d.date = parseDate(d.date);
		});

		var cities = color.domain().map(function(name) {
			return {
				name: name,
				values: data.map(function(d) {
					return {date: d.date, usage: +d[name]};
				})
			};
		});

		x.domain(d3.extent(data, function(d) { return d.date; }));

		y.domain([
			d3.min(cities, function(c) { return d3.min(c.values, function(v) { return v.usage; }); }),
			d3.max(cities, function(c) { return d3.max(c.values, function(v) { return v.usage; }); })
			]);

		svg.append("g")
		.attr("class", "x axis")
		.attr("transform", "translate(0," + height + ")")
		.call(xAxis);

		svg.append("g")
		.attr("class", "y axis")
		.call(yAxis)
		.append("text")
		.attr("transform", "rotate(-90)")
		.attr("y", 6)
		.attr("dy", ".71em")
		.style("text-anchor", "end")
		.text("Usage (MW)");

		var city = svg.selectAll(".city")
		.data(cities)
		.enter().append("g")
		.attr("class", "city");

		city.append("path")
		.attr("class", "line")
		.attr("d", function(d) { return line(d.values); })
		.style("stroke", function(d) { return color(d.name); });

		city.append("text")
		.datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
		.attr("transform", function(d) { return "translate(" + x(d.value.date) + "," + y(d.value.usage) + ")"; })
		.attr("x", 3)
		.attr("dy", ".35em")
		.text(function(d) { return d.name; });
	});

}
function renderChart(divid) {
// var data = d3.csv.parse(d3.select('#csv').text());
// data = d3.csv("assets/images/data/data.csv", function(error, data) {
	data = d3.json("/home/multilinechart", function(error, data) {

  // Convert strings to numbers.
  // Name,Population (mill),Average Life Expectancy,Area (1000 sq mi),Continent
  data.forEach(function(d) {
  	d['month'] = d['month'];
  	d['expenses'] = d['expenses'];
  });
  // console.log(data);

var valueLabelWidth = 40; // space reserved for value labels (right)
var barHeight = 35; // height of one bar
var barLabelWidth = 100; // space reserved for bar labels
var barLabelPadding = 5; // padding between bar and bar labels (left)
var gridLabelHeight = 18; // space reserved for gridline labels
var gridChartOffset = 3; // space between start of grid and first bar
var maxBarWidth = $(divid).width()-120; // width of the bar with the max value

// accessor functions 
var barLabel = function(d) { return d['month']; };
var barValue = function(d) { return parseFloat(d['expenses']); };

// scales
var yScale = d3.scale.ordinal().domain(d3.range(0, data.length)).rangeBands([0, data.length * barHeight]);
var y = function(d, i) { return yScale(i); };
var yText = function(d, i) { return y(d, i) + yScale.rangeBand() / 2; };
var x = d3.scale.linear().domain([0, d3.max(data, barValue)]).range([0, maxBarWidth]);
// svg container element
var chart = d3.select(divid).append("svg")
.attr('width', maxBarWidth + barLabelWidth + valueLabelWidth)
.attr('height', gridLabelHeight + gridChartOffset + data.length * barHeight);
// grid line labels
var gridContainer = chart.append('g')
.attr('transform', 'translate(' + barLabelWidth + ',' + gridLabelHeight + ')'); 
gridContainer.selectAll("text").data(x.ticks(10)).enter().append("text")
.attr("x", x)
.attr("dy", -3)
.attr("text-anchor", "middle")
.text(String);
// vertical grid lines
gridContainer.selectAll("line").data(x.ticks(10)).enter().append("line")
.attr("x1", x)
.attr("x2", x)
.attr("y1", 0)
.attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
.style("stroke", "#ccc");
// bar labels
var labelsContainer = chart.append('g')
.attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
labelsContainer.selectAll('text').data(data).enter().append('text')
.attr('y', yText)
.attr('stroke', 'none')
.attr('fill', 'black')
  .attr("dy", ".35em") // vertical-align: middle
  .attr('text-anchor', 'end')
  .text(barLabel);
// bars
var barsContainer = chart.append('g')
.attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
barsContainer.selectAll("rect").data(data).enter().append("rect")
.attr('y', y)
.attr('height', yScale.rangeBand())
.attr('width', function(d) { return x(barValue(d)); })
.attr('stroke', 'white')
.attr('fill', 'steelblue');
// bar value labels
barsContainer.selectAll("text").data(data).enter().append("text")
.attr("x", function(d) { return x(barValue(d)); })
.attr("y", yText)
  .attr("dx", 3) // padding-left
  .attr("dy", ".35em") // vertical-align: middle
  .attr("text-anchor", "start") // text-align: right
  .attr("fill", "black")
  .attr("stroke", "none")
  .text(function(d) { return d3.round(barValue(d), 2); });
// start line
barsContainer.append("line")
.attr("y1", -gridChartOffset)
.attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
.style("stroke", "#000");
});
}

function renderPie() {
var w = $('#mypie').width(), //width
h = w+10, //height
r = w/2, //radius
color = d3.scale.category20c(); //builtin range of colors

data = d3.json("/home/piechart", function(error, data) {
var vis = d3.select("#mypie")
.append("svg:svg") 
.data([data])
.attr("width", w) 
.attr("height", h)
.append("svg:g") 
.attr("transform", "translate(" + r + "," + r + ")") 

var arc = d3.svg.arc() 
.outerRadius(r);

var pie = d3.layout.pie() 
.value(function(d) { return d.value; });

var arcs = vis.selectAll("g.slice") 
.data(pie) 
.enter()
.append("svg:g") 
.attr("class", "slice"); 

arcs.append("svg:path")
.attr("fill", function(d, i) { return color(i); } ) 
.attr("d", arc); 

arcs.append("svg:text") 
.attr("transform", function(d) { 
	d.innerRadius = 0;
	d.outerRadius = r;
	return "translate(" + arc.centroid(d) + ")"; 
})
.attr("text-anchor", "middle") 
.text(function(d, i) { return data[i].label; }); 
}); //end of pie chart
}
$(function() {
	$('#datetimepicker1').datetimepicker({
		pickTime: false
        // format: 'dd/MM/yyyy '
      });
});
});