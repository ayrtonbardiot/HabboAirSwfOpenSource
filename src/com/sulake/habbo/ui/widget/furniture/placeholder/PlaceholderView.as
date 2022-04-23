// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.placeholder.PlaceholderView

package com.sulake.habbo.ui.widget.furniture.placeholder
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PlaceholderView 
    {

        private var _SafeStr_3745:_SafeStr_21;
        private var _windowManager:_SafeStr_1695;
        private var _window:_SafeStr_3133;

        public function PlaceholderView(_arg_1:_SafeStr_21, _arg_2:_SafeStr_1695)
        {
            _SafeStr_3745 = _arg_1;
            _windowManager = _arg_2;
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function toggleWindow():void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                hideWindow();
            }
            else
            {
                showWindow();
            };
        }

        public function showWindow():void
        {
            if (_window == null)
            {
                createWindow();
            };
            if (_window == null)
            {
                return;
            };
            _window.visible = true;
            _window.x = 200;
        }

        private function createWindow():void
        {
            var _local_2:XmlAsset = (_SafeStr_3745.getAssetByName("placeholder") as XmlAsset);
            if (((_local_2 == null) || (_local_2.content == null)))
            {
                return;
            };
            _window = (_windowManager.createWindow("habbohelp_window", "", 4, 0, (0x020000 | 0x01), new Rectangle(-300, 300, 10, 10), null) as _SafeStr_3133);
            _window.buildFromXML((_local_2.content as XML));
            _window.tags.push("habbo_help_window");
            _window.background = true;
            _window.color = 0x1FFFFFF;
            var _local_1:_SafeStr_3109 = _window.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.procedure = onWindowClose;
            };
        }

        public function hideWindow():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            hideWindow();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.placeholder

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)


