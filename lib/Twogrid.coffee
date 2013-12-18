'use strict';

# Twogrid.coffee

module.exports = class Twogrid
	constructor: (@width = 10, @height = 10, @params = {}) ->
		rawData = @params.rawData
		initVal = @params.initVal || 0
		max = @width * @height
		if @params.rawData is undefined
			@grid = []
			@grid.push(initVal) for [0..max] 			
		@grid = rawData 									if @params.rawData instanceof Array 
		@grid = rawData.replace(/\s/g, '').split(',')		if @grid is undefined
		return @

	copy: (gridToCopy) ->
		return @ if gridToCopy instanceof Twogrid isnt true
		@grid = gridToCopy.grid.slice()
		@width = gridToCopy.width
		@height = gridToCopy.height
		return @

	get: ([x, y] = [0,0]) -> 
		return undefined if (y + 1 > @height) or (x + 1 > @width)
		return @grid[x + y * @width]

	set: ([x,y] = [0,0], value) ->
		return @ if (y + 1 > @height) or (x + 1 > @width)
		@grid[ x + y * @width ] = value
		return @

	display: ->
		outputStr = '\n'
		for y in [0 ... @height]
			for x in [0 ... @width]
				outputStr += @get([x,y])
			outputStr += '\n'
		console.log outputStr
		return @
