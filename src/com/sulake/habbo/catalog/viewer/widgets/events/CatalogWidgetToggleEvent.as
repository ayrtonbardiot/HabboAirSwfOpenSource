// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetToggleEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetToggleEvent extends Event 
    {

        private var _SafeStr_4598:String;
        private var _SafeStr_4630:Boolean;

        public function CatalogWidgetToggleEvent(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("CWE_TOGGLE", _arg_3, _arg_4);
            _SafeStr_4598 = _arg_1;
            _SafeStr_4630 = _arg_2;
        }

        public function get widgetId():String
        {
            return (_SafeStr_4598);
        }

        public function get enabled():Boolean
        {
            return (_SafeStr_4630);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4598 = "_-b1D" (String#9596, DoABC#4)
// _SafeStr_4630 = "_-q1w" (String#3476, DoABC#4)


