instance creation
newPreviewElementForText: aBrText inEditor: aTextElement
	"Instantiate an element that has a role of code/example/result preview container."
	<return: #BlElement>
	^ GtPillarScriptExecutorStencil new
		text: aBrText;
		editor: aTextElement;
		codeSnippet: codeSnippet;
		icon: GtDocumenterConstants defaultExecuteButtonIcon;
		newPreviewElement