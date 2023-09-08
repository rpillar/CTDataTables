initialization
datatable: aSelector with: aDataTableObject

	^ ( ( JQueryClass new ) expression: aSelector ) call: 'DataTable' with: aDataTableObject.	

	