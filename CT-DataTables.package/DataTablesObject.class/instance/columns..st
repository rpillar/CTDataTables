as yet unclassified
columns: aDataTablesColumnsArrayObject

	"create a DataTables 'columns': structure - supply an array (currently) as something like { col1 . col2 } where 'col1' and 'col2' are DataTablesColumns objects"
	^ configurationOptions at: 'columns' put: aDataTablesColumnsArrayObject.