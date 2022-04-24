// by nota

//com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class TextInputCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _SafeStr_6671:ITextFieldWindow;

        public function TextInputCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _SafeStr_6671 = (_window.findChildByName("input_text") as ITextFieldWindow);
            if (_SafeStr_6671 != null)
            {
                _SafeStr_6671.addEventListener("WKE_KEY_UP", onKey);
            };
            return (true);
        }

        private function onKey(_arg_1:WindowKeyboardEvent):void
        {
            if (_SafeStr_6671 == null)
            {
                return;
            };
            events.dispatchEvent(new TextInputEvent(_SafeStr_6671.text));
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6671 = "_-EQ" (String#11505, DoABC#4)


