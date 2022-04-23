// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.bots.BotGridItem

package com.sulake.habbo.inventory.bots
{
    import _-Lc._SafeStr_1620;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;

    public class BotGridItem 
    {

        private static const THUMB_COLOR_NORMAL:int = 0xCCCCCC;
        private static const THUMB_COLOR_UNSEEN:int = 10275685;

        private var _SafeStr_3740:_SafeStr_1620;
        private var _window:_SafeStr_3133;
        private var _assets:_SafeStr_21;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _SafeStr_4617:Boolean;
        private var _SafeStr_3882:BotsView;
        private var _SafeStr_6890:int = -1;
        private var _SafeStr_6695:Boolean;
        private var _isUnseen:Boolean;

        public function BotGridItem(_arg_1:BotsView, _arg_2:_SafeStr_1620, _arg_3:_SafeStr_1695, _arg_4:_SafeStr_21, _arg_5:Boolean)
        {
            if (((((_arg_1 == null) || (_arg_2 == null)) || (_arg_3 == null)) || (_arg_4 == null)))
            {
                return;
            };
            _assets = _arg_4;
            _SafeStr_3882 = _arg_1;
            _SafeStr_3740 = _arg_2;
            _isUnseen = _arg_5;
            var _local_7:XmlAsset = (_arg_4.getAssetByName("inventory_thumb_xml") as XmlAsset);
            if (((_local_7 == null) || (_local_7.content == null)))
            {
                return;
            };
            _window = (_arg_3.buildFromXML((_local_7.content as XML)) as _SafeStr_3133);
            _window.procedure = eventHandler;
            var _local_6:BitmapData = _arg_1.getGridItemImage(_arg_2);
            setImage(_local_6);
            updateStatusGraphics();
        }

        public function dispose():void
        {
            _assets = null;
            _SafeStr_3882 = null;
            _SafeStr_3740 = null;
            _SafeStr_4620 = null;
            _SafeStr_6890 = -1;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WME_DOWN":
                    _SafeStr_3882.setSelectedGridItem(this);
                    _SafeStr_6695 = true;
                    return;
                case "WME_UP":
                    _SafeStr_6695 = false;
                    return;
                case "WME_OUT":
                    if (_SafeStr_6695)
                    {
                        _SafeStr_6695 = false;
                        _SafeStr_3882.placeItemToRoom(_SafeStr_3740.id, true);
                    };
                    return;
            };
        }

        public function setImage(_arg_1:BitmapData):void
        {
            if (!_window)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            var _local_2:BitmapData = new BitmapData(_local_3.width, _local_3.height);
            _local_2.fillRect(_local_2.rect, 0);
            _local_2.copyPixels(_arg_1, _arg_1.rect, new Point(((_local_2.width / 2) - (_arg_1.width / 2)), ((_local_2.height / 2) - (_arg_1.height / 2))));
            if (_local_3.bitmap)
            {
                _local_3.bitmap.dispose();
            };
            _local_3.bitmap = _local_2;
        }

        public function setUnseen(_arg_1:Boolean):void
        {
            if (_isUnseen != _arg_1)
            {
                _isUnseen = _arg_1;
                updateStatusGraphics();
            };
        }

        public function setSelected(_arg_1:Boolean):void
        {
            if (_SafeStr_4617 != _arg_1)
            {
                _SafeStr_4617 = _arg_1;
                if (((!(_window)) || (!(_SafeStr_4620))))
                {
                    return;
                };
                updateStatusGraphics();
            };
        }

        private function updateStatusGraphics():void
        {
            var _local_1:_SafeStr_3109 = _window.findChildByName("outline");
            if (_local_1 != null)
            {
                _local_1.visible = _SafeStr_4617;
            };
            if (!_SafeStr_4620)
            {
                _SafeStr_4620 = _window.findChildByTag("BG_COLOR");
            };
            _SafeStr_4620.color = ((_isUnseen) ? 10275685 : 0xCCCCCC);
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        public function get data():_SafeStr_1620
        {
            return (_SafeStr_3740);
        }


    }
}//package com.sulake.habbo.inventory.bots

// _SafeStr_1620 = "_-V1f" (String#6472, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)
// _SafeStr_6695 = "_-01l" (String#4823, DoABC#4)
// _SafeStr_6890 = "_-Iz" (String#8356, DoABC#4)


