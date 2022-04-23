// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetSellablePetPalettesEvent extends Event 
    {

        private var _SafeStr_4838:String;
        private var _SafeStr_4839:Array;

        public function CatalogWidgetSellablePetPalettesEvent(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("SELLABLE_PET_PALETTES", _arg_3, _arg_4);
            _SafeStr_4838 = _arg_1;
            _SafeStr_4839 = _arg_2;
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get sellablePalettes():Array
        {
            if (_SafeStr_4839 != null)
            {
                return (_SafeStr_4839.slice());
            };
            return ([]);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4838 = "_-T1g" (String#4465, DoABC#4)
// _SafeStr_4839 = "_-J1t" (String#15649, DoABC#4)


