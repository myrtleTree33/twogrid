'use strict';

# Twogrid-spec.coffee

Twogrid = require '../lib/Twogrid.coffee'

describe 'Twogrid', ->

	twogrid = {}

	beforeEach ->
		twogrid = new Twogrid 3, 3, { rawData: [ 1,2,3,4,5,6,7,8,9 ]}

	describe 'initializes ', ->
		it 'from a comma-delimited string', ->
			twogrid = new Twogrid 2, 2, { rawData: '0,0,1,1' }
			twogrid.display()
			expect(twogrid.get(0,0)).toEqual '0'

		it 'from a comma-delimited string with whitespace', ->
			twogrid = new Twogrid(2,2,{
				rawData: 
					'0,0,
					1,1'
				})
			twogrid.display()
			expect(twogrid.get(0,0)).toEqual '0'

		it 'an empty array if no string is given', ->
			twogrid = new Twogrid 3, 3
			twogrid.display()
			expect(twogrid.get(2,2)).toEqual 0

		it 'a populated array if no string is given and an initVal is provided', ->
			twogrid = new Twogrid 3, 3, {initVal: 2}
			twogrid.display()
			expect(twogrid.get(2,2)).toEqual 2

		it 'a 2D array from a flattened 1D array', ->
			twogrid = new Twogrid 3, 3, { rawData: [ 1,2,3,4,5,6,7,8,9 ]}
			twogrid.display()
			expect(twogrid.get(2,2)).toEqual 9


	describe 'cells', ->
		describe 'should be retrievable', ->
			it 'in the middle', ->
				expect(twogrid.get(1,1)).toEqual 5

			it 'at corners', ->
				expect(twogrid.get(0,0)).toEqual 1
				expect(twogrid.get(0,2)).toEqual 7
				expect(twogrid.get(2,0)).toEqual 3
				expect(twogrid.get(2,2)).toEqual 9

			it 'and undefined if out of bounds', ->
				expect(twogrid.get(-1,-1)).toBeUndefined
				expect(twogrid.get(0,-1)).toBeUndefined
				expect(twogrid.get(-1,0)).toBeUndefined
				expect(twogrid.get(3,3)).toBeUndefined


		describe 'should be editable', ->
			it 'in the middle', ->
				expect(twogrid.get(1,1)).toEqual 5
				twogrid.set(1,1,20)
				expect(twogrid.get(1,1)).toEqual 20

			it 'at corners', ->
				expect(twogrid.get(0,0)).toEqual 1
				twogrid.set(0,0,20)
				expect(twogrid.get(0,0)).toEqual 20

				expect(twogrid.get(0,2)).toEqual 7
				twogrid.set(0,2,20)
				expect(twogrid.get(0,2)).toEqual 20

				expect(twogrid.get(2,0)).toEqual 3
				twogrid.set(2,0,20)
				expect(twogrid.get(2,0)).toEqual 20

				expect(twogrid.get(2,2)).toEqual 9
				twogrid.set(2,2,20)
				expect(twogrid.get(2,2)).toEqual 20

			it 'and undefined if out of bounds', ->
				expect(twogrid.get(10,10)).toBeUndefined
				twogrid.set(10,10,20)
				expect(twogrid.get(0,0)).toBeUndefined

				expect(twogrid.get(3,0)).toBeUndefined
				twogrid.set(3,0,20)
				expect(twogrid.get(0,1)).toEqual 4
				expect(twogrid.get(3,0)).toBeUndefined

	describe 'clonable', ->
		it 'from another twogrid instance', ->
			newGrid = new Twogrid()
			expect(newGrid.get(0,0)).toEqual 0
			newGrid.copy(twogrid)
			expect(newGrid.get(0,0)).toEqual 1
			

	describe 'has chainable', ->
		it 'constructors', ->
			expect(twogrid instanceof Twogrid).toBeTruthy

		it 'setters', ->
			expect(twogrid.set(1,1,20) instanceof Twogrid).toBeTruthy

		it 'display', ->
			expect(twogrid.display instanceof Twogrid).toBeTruthy
