/*!
*   This file is part of Aloha Editor
*   Author & Copyright (c) 2010 Gentics Software GmbH, aloha@gentics.com
*   Licensed unter the terms of http://www.aloha-editor.com/license.html
*/
/*
*	Aloha Editor is free software: you can redistribute it and/or modify
*   it under the terms of the GNU Affero General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.*
*
*   Aloha Editor is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU Affero General Public License for more details.
*
*   You should have received a copy of the GNU Affero General Public License
*   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
/**
 * jQuery Aloha Plugin
 * 
 * turn all dom elements to continous text
 * @return	jQuery object for the matched elements
 * @api
 */
jQuery.fn.aloha=function(){return this.each(function(){new GENTICS.Aloha.Editable(jQuery(this))})},jQuery.fn.GENTICS_aloha=function(){return this.each(function(){new GENTICS.Aloha.Editable(jQuery(this))})},jQuery.fn.mahalo=function(){return this.each(function(){if(jQuery(this).hasClass("GENTICS_editable"))for(var a=0;a<GENTICS.Aloha.editables.length;a++)GENTICS.Aloha.editables[a].obj.get(0)===this&&GENTICS.Aloha.editables[a].destroy()})},jQuery.fn.GENTICS_mahalo=function(){return this.each(function(){var a=this})},jQuery.fn.GENTICS_contentEditableSelectionChange=function(a){var b=this;return this.keyup(function(b){var c=GENTICS.Aloha.Selection.getRangeObject();a(b)}),this.dblclick(function(b){a(b)}),this.mousedown(function(a){b.selectionStarted=!0}),jQuery(document).mouseup(function(c){GENTICS.Aloha.Selection.eventOriginalTarget=b,b.selectionStarted&&a(c),GENTICS.Aloha.Selection.eventOriginalTarget=!1,b.selectionStarted=!1}),this},jQuery.fn.outerHTML=function(a){return a?this.before(a).remove():jQuery("<p>").append(this.eq(0).clone()).html()}