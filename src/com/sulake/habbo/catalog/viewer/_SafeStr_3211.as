// by nota

//com.sulake.habbo.catalog.viewer._SafeStr_3211

package com.sulake.habbo.catalog.viewer
{
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog._SafeStr_3141;

    public /*dynamic*/ interface _SafeStr_3211 
    {

        function dispose():void;
        function init():void;
        function closed():void;
        function dispatchWidgetEvent(_arg_1:Event):Boolean;
        function get window():_SafeStr_3133;
        function get viewer():_SafeStr_3229;
        function get pageId():int;
        function get offers():Vector.<_SafeStr_3141>;
        function get localization():IPageLocalization;
        function get layoutCode():String;
        function get hasLinks():Boolean;
        function get links():Array;
        function selectOffer(_arg_1:int):void;
        function replaceOffers(_arg_1:Vector.<_SafeStr_3141>, _arg_2:Boolean=false):void;
        function updateLimitedItemsLeft(_arg_1:int, _arg_2:int):void;
        function get acceptSeasonCurrencyAsCredits():Boolean;
        function get allowDragging():Boolean;
        function set searchPageId(_arg_1:int):void;
        function get mode():int;
        function get isBuilderPage():Boolean;

    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3229 = "_-a1p" (String#8259, DoABC#4)


