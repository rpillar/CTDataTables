script
scriptFormatFunction: fieldNames with: fieldLabels

	| formatData jsn rs1 rs2 st1 st2 |
	"Provide a function to specify the format of the child rows. Because for differing applications the child rows will almost certainly be different this should just be taken
	 as an example. Returns a HTML template string."
	
	jsn := JSNamedFunction named: 'format'.
	jsn return: true.
	jsn arguments: #(d).
	
	rs1 := ReadStream on: fieldNames.
	rs2 := ReadStream on: fieldLabels.
	
	formatData := WAHtmlCanvas builder render: [ :html | 
		html table 
			class: 'stripe';
			style: 'padding-left:100px;';
			attributeAt: 'cellpadding' put: '5';
			attributeAt: 'cellspacing' put: '0';
			attributeAt: 'border' put: '0';  
			with: [
				( 1 to: ( fieldNames size ) ) do: [ :idx |
				html tableRow
					class: 'formart-row';
					with: [  
						html tableData 
							with:	( rs2 next ), ' : '.
						st1 :=  WriteStream on: String new.
						st1 nextPut: $$; 
							nextPut: ${;
							nextPutAll: 'd.';
							nextPutAll: rs1 next;
							nextPut: $}.
						html tableData
							with: st1 contents.
					].
				]
			]
	].

	st2 := WriteStream on: String new. 
	st2 nextPut: $`; nextPutAll: formatData; nextPut: $`.
	
	jsn << ( JSStream on: st2 contents ).
	^ jsn asJavascript.