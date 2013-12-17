# twogrid

<img src='https://www.codeship.io/projects/be485250-494f-0131-6348-2ec227d8ea8c/status' />

## What?

Deploy a 2D grid matrix fast, in Javascript.  Useful for olympiads / quick hacks.


## Install

	npm install twogrid

## Usage

	Twogrid = require('Twogrid');

	// empty
	var twogrid = new Twogrid(3, 2);										// 3 X 2 array of 0s
	twogrid = new Twogrid(3, 2, { initVal: 8 });							// 3 X 2 array of 8s
	twogrid = new Twogrid(3, 2, { initVal: 'how are you' });				// 3 X 2 array of "how are you"
	twogrid = new Twogrid(3, 2, { rawData: 									// 3 X 2 array from a comma-
		'0,0,1,																// delimited string
		0,0,1' 
	});
	twogrid = new Twogrid(3, 3, { rawData: [ 1,2,3,4,5,6,7,8,9 ]});			// from an array

	twogrid.newTwogrid(3,2).get(1,0);										// is chainable

	var newgrid = new Twogrid();

	twogrid.newTwogrid(3,2).get(1,0);										// is chainable


## Constructors

See **Usage** for examples.


## Methods

### get(x,y)

Returns the cell at the given x,y position.  If cell is out of out of bounds, returns `undefined`.  **Is not chainable.**

**x** : X position of cell to get.

**y** : Y position of cell to get.


### set(x,y, value)

Sets the cell at the given x,y position.

**x** : X position of cell to get.

**y** : Y position of cell to get.

**Value** : The new value to set to.  Can be an object.


### copy(gridToCopy)

Copies another Twogrid instance, defined by `gridToCopy`.


### display()

Displays grid on console.


## Tests

`Grunt` and `jasmine-node` must be installed.  Then run:

	grunt test


## Bugs 

Please file in the bug report.


## License

MIT

## Authors

<a href='http://blog.joeltong.org'>jhtong</a>
