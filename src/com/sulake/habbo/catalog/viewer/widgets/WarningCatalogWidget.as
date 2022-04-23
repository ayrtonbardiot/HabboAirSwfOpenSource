// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.WarningCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;

    public class WarningCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        public function WarningCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _window.findChildByName("warning_text").caption = "";
            events.addEventListener("CWE_SHOW_WARNING_TEXT", onWarningText);
            return (true);
        }

        private function onWarningText(_arg_1:CatalogWidgetShowWarningTextEvent):void
        {
            _window.findChildByName("warning_text").caption = _arg_1.text;
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


