// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.BottomBackgroundBorder

package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Point;

    public class BottomBackgroundBorder implements _SafeStr_13 
    {

        private var _window:_SafeStr_3133;
        private var _disposed:Boolean = false;

        public function BottomBackgroundBorder(_arg_1:HabboToolbar)
        {
            _window = (_arg_1.windowManager.buildFromXML((_arg_1.assets.getAssetByName("bottom_background_border_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = onWindowEvent;
            updatePosition();
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_PARENT_RESIZED")
            {
                updatePosition();
            };
        }

        private function updatePosition():void
        {
            _window.position = new Point(-10, (_window.desktop.height - (_window.height - 3)));
            _window.width = (_window.desktop.width + 20);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.habbo.toolbar

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


