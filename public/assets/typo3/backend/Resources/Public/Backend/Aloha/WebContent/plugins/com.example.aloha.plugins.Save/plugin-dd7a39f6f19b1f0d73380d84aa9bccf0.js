/*!
* Aloha Editor
* Author & Copyright (c) 2010 Gentics Software GmbH
* aloha-sales@gentics.com
* Licensed unter the terms of http://www.aloha-editor.com/license.html
*/
/**
 * this is an example plugin to demonstrate how to access the aloha edited content and save it to a storage (cms, database, ...) of your choice
 * @author laurin 
 */
if(typeof EXAMPLE=="undefined"||!EXAMPLE)var EXAMPLE={};EXAMPLE.DummySavePlugin=new GENTICS.Aloha.Plugin("com.example.aloha.DummySave"),EXAMPLE.DummySavePlugin.languages=["en","de","fi","fr","it"],EXAMPLE.DummySavePlugin.init=function(){var a=this,b=new GENTICS.Aloha.ui.Button({label:this.i18n("save"),onclick:function(){a.save()}});GENTICS.Aloha.Ribbon.addButton(b)},EXAMPLE.DummySavePlugin.save=function(){var a="";jQuery.each(GENTICS.Aloha.editables,function(b,c){a=a+"Editable ID: "+c.getId()+"\nHTML code: "+c.getContents()+"\n\n"}),alert(this.i18n("saveMessage")+"\n\n"+a)}