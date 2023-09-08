script
scriptEventListenerOpenCloseRow

	"Return a fundtion - Add event listener for opening and closing details. Use in conjunction with the format function. NOTR - this is just an example that will work for most basic Datatables instances. However
	if you want to do something more 'custom' then override this as required."
	
	| jq js jsCond jsFunction jsTrue jsFalse |
	js := JSStream new.
	jq := JQueryClass new.

	jsCond := ( JSStream on: 'row.child.isShown()' ).
	jsTrue := ( JSStream on: 'row.child.hide()' ),
		( ( JSStream on: 'tr' ) call: 'removeClass'  with: 'shown' ).
	jsFalse := 
		( ( JSStream on: 'row' ) 
			call: 'child'  
			with: ( ( JSStream on: 'format' ) apply: { ( JSStream on: 'row' ) call: 'data' } ); 
			call: 'show' ), 
		( ( JSStream on: 'tr' ) call: 'addClass'  with: 'shown' ).

	js nextPutAll: ( ( ( jq this closest: 'tr' ) assignLocalTo: 'tr' ) asJavascript );
		nextPut: $;;
		nextPutAll: 'var row = table.row(tr)';
		nextPut: $;;
		nextPutAll: ( ( jsTrue condition: jsCond else: jsFalse) asJavascript );
		nextPut: $;.
	
	jsFunction := ( js contents ) asFunction: #().
	
	^ ( ( jq expression: 'tbody' ) call: 'on' with: 'click' with: 'td.details-control' with: jsFunction ).