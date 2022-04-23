// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer._SafeStr_3229

package com.sulake.habbo.catalog.viewer
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import flash.events.Event;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;

    public /*dynamic*/ interface _SafeStr_3229 
    {

        function showCatalogPage(_arg_1:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<_SafeStr_3141>, _arg_5:int, _arg_6:Boolean):void;
        function dispatchWidgetEvent(_arg_1:Event):Boolean;
        function get catalog():IHabboCatalog;
        function get roomEngine():IRoomEngine;
        function dispose():void;
        function getCurrentLayoutCode():String;
        function get viewerTags():Array;

    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3229 = "_-a1p" (String#8259, DoABC#4)


