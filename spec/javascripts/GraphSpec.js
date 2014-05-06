describe("Chart", function() {
	// var line;
	// var bar;
	// var pie;
	// beforeEach(function() {
	// 	line = new renderlinechart();
	// 	bar = new renderChart();
	// 	pie = new renderPie();
	// });
 json=[{"label":"one","value":20,"id":null},{"label":"two","value":30,"id":null},{"label":"three","value":20,"id":null},{"label":"four","value":10,"id":null},{"label":"five","value":20,"id":null}];
	it("should be able to generate multiline chart", function() {
		Chart.generate(json)
  });
});