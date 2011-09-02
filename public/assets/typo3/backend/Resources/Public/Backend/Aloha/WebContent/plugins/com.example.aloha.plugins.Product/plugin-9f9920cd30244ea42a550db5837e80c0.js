/**
 * Aloha Product Example Plugin
 */
if(typeof EXAMPLE=="undefined"||!EXAMPLE)var EXAMPLE={};EXAMPLE.Product=new GENTICS.Aloha.Plugin("com.example.aloha.plugins.Product"),EXAMPLE.Product.languages=["en","de","fr"],EXAMPLE.Product.productField=null,EXAMPLE.Product.init=function(){var a=this;jQuery("head").append('<link rel="stylesheet" type="text/css" href="'+GENTICS.Aloha.settings.base+'/plugins/com.example.aloha.plugins.Product/resources/product.css">');var b=new GENTICS.Aloha.ui.Button({iconClass:"GENTICS_button GENTICS_button_product",size:"small",onclick:function(){a.insertProduct()},tooltip:this.i18n("button.insertproduct"),toggle:!1});GENTICS.Aloha.FloatingMenu.addButton("GENTICS.Aloha.continuoustext",b,GENTICS.Aloha.i18n(GENTICS.Aloha,"floatingmenu.tab.insert"),1),GENTICS.Aloha.FloatingMenu.createScope(this.getUID("product"),"GENTICS.Aloha.global"),this.productField=new GENTICS.Aloha.ui.AttributeField,this.productField.setTemplate('<span><b>{name}</b><span class="product-preview" style="background-image: url('+GENTICS.Aloha.settings.base+'{url});"></span>'+'<br class="clear" /><i>{type}</i></span>'),this.productField.setObjectTypeFilter(["product"]),this.productField.setDisplayField("name"),GENTICS.Aloha.FloatingMenu.addButton(this.getUID("product"),this.productField,this.i18n("floatingmenu.tab.product"),1),GENTICS.Aloha.EventRegistry.subscribe(GENTICS.Aloha,"selectionChanged",function(b,c){var d=a.findProduct(c);jQuery(".product-selected").removeClass("product-selected"),d.length!=0&&(GENTICS.Aloha.FloatingMenu.setScope(a.getUID("product")),a.productField.setTargetObject(d,"data-product-name"),d.addClass("product-selected")),GENTICS.Aloha.FloatingMenu.doLayout()}),GENTICS.Aloha.EventRegistry.subscribe(GENTICS.Aloha,"editableDeactivated",function(a,b){jQuery(".product-selected").removeClass("product-selected")})},EXAMPLE.Product.findProduct=function(a){return jQuery(a.commonAncestorContainer).closest(".GENTICS_block.product")},EXAMPLE.Product.insertProduct=function(){GENTICS.Aloha.FloatingMenu.userActivatedTab=this.i18n("floatingmenu.tab.product");var a=GENTICS.Aloha.Selection.getRangeObject(),b=jQuery('<div class="GENTICS_block product" contentEditable="false"><div class="image"></div><div class="name">'+this.i18n("newproductname")+"</div></div>");GENTICS.Utils.Dom.insertIntoDOM(b,a,jQuery(GENTICS.Aloha.activeEditable.obj)),a.startContainer=a.endContainer=b.contents().get(0),a.select(),this.productField.focus()},EXAMPLE.Product.updateProduct=function(a,b){a.find(".name").text(b.name),a.find(".image").css("backgroundImage","url("+GENTICS.Aloha.settings.base+b.url+")")}