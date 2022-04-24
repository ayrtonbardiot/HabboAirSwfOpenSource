// by nota

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetInitPurchaseEvent extends Event 
    {

        private var _SafeStr_6961:Boolean = true;
        private var _userName:String;

        public function CatalogWidgetInitPurchaseEvent(_arg_1:Boolean=true, _arg_2:String=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("INIT_PURCHASE", _arg_3, _arg_4);
            _SafeStr_6961 = _arg_1;
            _userName = _arg_2;
        }

        public function get enableBuyAsGift():Boolean
        {
            return (_SafeStr_6961);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_6961 = "_-mK" (String#18192, DoABC#4)


