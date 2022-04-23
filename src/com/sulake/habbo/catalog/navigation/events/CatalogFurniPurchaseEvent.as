// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.navigation.events.CatalogFurniPurchaseEvent

package com.sulake.habbo.catalog.navigation.events
{
    import flash.events.Event;

    public class CatalogFurniPurchaseEvent extends Event 
    {

        public static const CATALOG_FURNI_PURCHASE:String = "CATALOG_FURNI_PURCHASE";

        private var _SafeStr_4263:String;

        public function CatalogFurniPurchaseEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("CATALOG_FURNI_PURCHASE", _arg_2, _arg_3);
            _SafeStr_4263 = _arg_1;
        }

        public function get localizationId():String
        {
            return (_SafeStr_4263);
        }


    }
}//package com.sulake.habbo.catalog.navigation.events

// _SafeStr_4263 = "_-u1X" (String#4219, DoABC#4)


