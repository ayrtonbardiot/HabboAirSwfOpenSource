// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetApproveNameResultEvent extends Event 
    {

        private var _SafeStr_4258:int;
        private var _nameValidationInfo:String;

        public function CatalogWidgetApproveNameResultEvent(_arg_1:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("CWE_APPROVE_RESULT", _arg_3, _arg_4);
            _SafeStr_4258 = _arg_1;
            _nameValidationInfo = _arg_2;
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function get nameValidationInfo():String
        {
            return (_nameValidationInfo);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4258 = "_-fc" (String#2827, DoABC#4)


