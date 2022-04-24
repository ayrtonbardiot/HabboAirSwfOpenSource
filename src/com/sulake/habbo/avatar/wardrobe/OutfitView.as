// by nota

//com.sulake.habbo.avatar.wardrobe.OutfitView

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class OutfitView 
    {

        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3745:_SafeStr_21;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4573:_SafeStr_3264;

        public function OutfitView(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_21, _arg_3:Boolean)
        {
            _windowManager = _arg_1;
            _SafeStr_3745 = _arg_2;
            var _local_4:XmlAsset = (_SafeStr_3745.getAssetByName("Outfit") as XmlAsset);
            _window = _SafeStr_3133(_windowManager.buildFromXML((_local_4.content as XML)));
            if (_window != null)
            {
                _SafeStr_4573 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            };
            if (!_arg_3)
            {
                _window.findChildByName("button").disable();
            };
        }

        public function dispose():void
        {
            _windowManager = null;
            _SafeStr_3745 = null;
            if (_window)
            {
                _window.dispose();
            };
            _window = null;
            if (_SafeStr_4573)
            {
                _SafeStr_4573.dispose();
            };
            _SafeStr_4573 = null;
        }

        public function update(_arg_1:BitmapData):void
        {
            _SafeStr_4573.bitmap = new BitmapData(_SafeStr_4573.width, _SafeStr_4573.height, true, 0xFFFFFF);
            var _local_2:int = int(((_SafeStr_4573.width - _arg_1.width) / 2));
            var _local_3:int = (_SafeStr_4573.height - _arg_1.height);
            _SafeStr_4573.bitmap.copyPixels(_arg_1, _arg_1.rect, new Point(_local_2, _local_3));
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                if (_arg_1.type == "WME_OVER")
                {
                    _window.color = 0xCCCCCC;
                }
                else
                {
                    if (_arg_1.type == "WME_OUT")
                    {
                        _window.color = 0x666666;
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_4573 = "_-E1D" (String#2271, DoABC#4)


