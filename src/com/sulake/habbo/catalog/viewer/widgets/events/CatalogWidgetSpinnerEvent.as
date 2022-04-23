// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetSpinnerEvent extends Event 
    {

        public static const VALUE_CHANGED:String = "CWSE_VALUE_CHANGED";
        public static const RESET:String = "CWSE_RESET";
        public static const SHOW:String = "CWSE_SHOW";
        public static const HIDE:String = "CWSE_HIDE";
        public static const _SafeStr_8345:String = "CWSE_SET_MAX";
        public static const SET_MIN:String = "CWSE_SET_MIN";

        private var _SafeStr_4525:int;
        private var _SafeStr_6887:Array;

        public function CatalogWidgetSpinnerEvent(_arg_1:String, _arg_2:int=1, _arg_3:Array=null)
        {
            super(_arg_1);
            _SafeStr_4525 = _arg_2;
            _SafeStr_6887 = _arg_3;
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }

        public function get skipSteps():Array
        {
            return (_SafeStr_6887);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_6887 = "_-W1Y" (String#6920, DoABC#4)
// _SafeStr_8345 = "_-U1m" (String#36412, DoABC#4)


