// by nota

//com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent

package com.sulake.habbo.catalog.navigation.events
{
    import flash.events.Event;

    public class CatalogPageOpenedEvent extends Event 
    {

        public static const CATALOG_PAGE_OPENED:String = "CATALOG_PAGE_OPENED";

        private var _SafeStr_4786:int;
        private var _pageLocalization:String;

        public function CatalogPageOpenedEvent(_arg_1:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("CATALOG_PAGE_OPENED", _arg_3, _arg_4);
            _SafeStr_4786 = _arg_1;
            _pageLocalization = _arg_2;
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get pageLocalization():String
        {
            return (_pageLocalization);
        }


    }
}//package com.sulake.habbo.catalog.navigation.events

// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)


