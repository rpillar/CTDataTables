accessing
fnCreatedCell: aTableRowDictionary

	"Developer definable function that is called whenever a cell is created (Ajax source, etc) or processed for input (DOM source). This can be used as a compliment to fnRender allowing you to modify the DOM element (add background colour for example) when the element is available (since it is not when fnRender is called)."

	configurationOptions at: 'fnCreateCell' put: aTableRowDictionary.