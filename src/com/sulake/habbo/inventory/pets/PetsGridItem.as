// by nota

//com.sulake.habbo.inventory.pets.PetsGridItem

package com.sulake.habbo.inventory.pets
{
    import _-Zz._SafeStr_1573;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;

    public class PetsGridItem 
    {

        private static const THUMB_COLOR_NORMAL:int = 0xCCCCCC;
        private static const THUMB_COLOR_UNSEEN:int = 10275685;

        private var _SafeStr_5316:_SafeStr_1573;
        private var _window:_SafeStr_3133;
        private var _assets:_SafeStr_21;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _SafeStr_4617:Boolean;
        private var _SafeStr_6889:PetsView;
        private var _SafeStr_6890:int = -1;
        private var _SafeStr_6695:Boolean;
        private var _isUnseen:Boolean;

        public function PetsGridItem(_arg_1:PetsView, _arg_2:_SafeStr_1573, _arg_3:_SafeStr_1695, _arg_4:_SafeStr_21, _arg_5:Boolean)
        {
            if (((((_arg_1 == null) || (_arg_2 == null)) || (_arg_3 == null)) || (_arg_4 == null)))
            {
                return;
            };
            _assets = _arg_4;
            _SafeStr_6889 = _arg_1;
            _SafeStr_5316 = _arg_2;
            _isUnseen = _arg_5;
            var _local_8:XmlAsset = (_arg_4.getAssetByName("inventory_thumb_xml") as XmlAsset);
            if (((_local_8 == null) || (_local_8.content == null)))
            {
                return;
            };
            _window = (_arg_3.buildFromXML((_local_8.content as XML)) as _SafeStr_3133);
            _window.procedure = eventHandler;
            var _local_7:int = 64;
            var _local_11:int = 3;
            var _local_9:Boolean;
            var _local_6:String;
            if (_arg_2.typeId == 15)
            {
                _local_7 = 32;
                _local_11 = 2;
                _local_9 = true;
            }
            else
            {
                if (_arg_2.typeId == 35)
                {
                    _local_7 = 64;
                    _local_11 = 3;
                    _local_9 = true;
                }
                else
                {
                    if (((_arg_2.typeId == 26) || (_arg_2.typeId == 27)))
                    {
                        _local_7 = 32;
                        _local_11 = 3;
                        _local_9 = true;
                    }
                    else
                    {
                        if (_arg_2.typeId == 16)
                        {
                            _local_7 = 32;
                            _local_11 = 2;
                            _local_9 = true;
                            if (_arg_2.level >= 7)
                            {
                                _local_6 = "std";
                            }
                            else
                            {
                                _local_6 = ("grw" + _arg_2.level);
                            };
                        };
                    };
                };
            };
            var _local_10:BitmapData = _arg_1.getPetImage(_arg_2, _local_11, _local_9, this, _local_7, _local_6);
            setPetImage(_local_10);
            updateStatusGraphics();
        }

        public function dispose():void
        {
            _assets = null;
            _SafeStr_6889 = null;
            _SafeStr_5316 = null;
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
                    _SafeStr_6889.setSelectedGridItem(this);
                    _SafeStr_6695 = true;
                    return;
                case "WME_UP":
                    _SafeStr_6695 = false;
                    return;
                case "WME_OUT":
                    if (_SafeStr_6695)
                    {
                        _SafeStr_6695 = false;
                        _SafeStr_6889.placePetToRoom(_SafeStr_5316.id, true);
                    };
                    return;
            };
        }

        public function setPetImage(_arg_1:BitmapData):void
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

        public function get pet():_SafeStr_1573
        {
            return (_SafeStr_5316);
        }

        public function set imageDownloadId(_arg_1:int):void
        {
            _SafeStr_6890 = _arg_1;
        }

        public function get imageDownloadId():int
        {
            return (_SafeStr_6890);
        }


    }
}//package com.sulake.habbo.inventory.pets

// _SafeStr_1573 = "_-iW" (String#6355, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)
// _SafeStr_5316 = "_-k1l" (String#1416, DoABC#4)
// _SafeStr_6695 = "_-01l" (String#4823, DoABC#4)
// _SafeStr_6889 = "_-y1f" (String#10322, DoABC#4)
// _SafeStr_6890 = "_-Iz" (String#8356, DoABC#4)


