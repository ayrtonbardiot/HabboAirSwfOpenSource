// by nota

//com.sulake.habbo.ui.widget.camera.CameraFxStrengthSlider

package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class CameraFxStrengthSlider 
    {

        private var _SafeStr_3882:CameraPhotoLab;
        private var _SafeStr_5880:_SafeStr_3133;
        private var _SafeStr_5881:BitmapData;
        private var _sliderButton:BitmapData;
        private var _activeBaseArea:_SafeStr_3264;
        private var _sliderBaseWidth:int;
        private var _referenceWidth:int;
        private var _SafeStr_6580:int = 0;

        public function CameraFxStrengthSlider(_arg_1:CameraPhotoLab, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_21)
        {
            _SafeStr_3882 = _arg_1;
            _SafeStr_5880 = _arg_2;
            storeAssets(_arg_3);
            displaySlider();
        }

        public function dispose():void
        {
            _SafeStr_3882 = null;
            _SafeStr_5880 = null;
            _SafeStr_5881 = null;
            _sliderButton = null;
        }

        public function disable():void
        {
            _SafeStr_5880.visible = false;
        }

        public function enable():void
        {
            _SafeStr_5880.visible = true;
        }

        public function getScale():int
        {
            return (_referenceWidth);
        }

        public function setValue(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_5880 != null)
            {
                _local_2 = _SafeStr_5880.findChildByName("slider_button");
                if (_local_2 != null)
                {
                    _local_2.x = _arg_1;
                };
            };
        }

        private function buttonProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WE_RELOCATED")
            {
                if (_activeBaseArea)
                {
                    _activeBaseArea.width = ((_arg_2.x / _referenceWidth) * _sliderBaseWidth);
                };
            }
            else
            {
                if (((_arg_1.type == "WME_UP") || (_arg_1.type == "WME_UP_OUTSIDE")))
                {
                    _SafeStr_3882.setSelectedFxValue(_arg_2.x);
                };
            };
        }

        private function shaftProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            if (((_arg_1.type == "WME_DOWN") && (_arg_2.name == "shaft_click_area")))
            {
                _local_3 = (WindowMouseEvent(_arg_1).localX - _SafeStr_6580);
                setValue(_local_3);
                _SafeStr_3882.setSelectedFxValue(_local_3);
            };
        }

        private function displaySlider():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_SafeStr_5880 == null)
            {
                return;
            };
            var _local_1:IRegionWindow = (_SafeStr_5880.findChildByName("shaft_click_area") as IRegionWindow);
            if (_local_1)
            {
                _local_1.procedure = shaftProcedure;
            };
            _local_2 = (_SafeStr_5880.findChildByName("slider_base") as _SafeStr_3264);
            if (((!(_local_2 == null)) && (!(_SafeStr_5881 == null))))
            {
                _sliderBaseWidth = _local_2.width;
                _local_2.bitmap = new BitmapData(_SafeStr_5881.width, _SafeStr_5881.height, true, 0xFFFFFF);
                _local_2.bitmap.copyPixels(_SafeStr_5881, _SafeStr_5881.rect, new Point(0, 0), null, null, true);
                _activeBaseArea = _local_2;
            };
            _local_3 = (_SafeStr_5880.findChildByName("slider_movement_area") as _SafeStr_3133);
            if (_local_3 != null)
            {
                _local_2 = (_local_3.findChildByName("slider_button") as _SafeStr_3264);
                if (((!(_local_2 == null)) && (!(_sliderButton == null))))
                {
                    _local_2.bitmap = new BitmapData(_sliderButton.width, _sliderButton.height, true, 0xFFFFFF);
                    _local_2.bitmap.copyPixels(_sliderButton, _sliderButton.rect, new Point(0, 0), null, null, true);
                    _local_2.procedure = buttonProcedure;
                    _referenceWidth = (_local_3.width - _local_2.width);
                    _SafeStr_6580 = ((_sliderBaseWidth - _referenceWidth) / 2);
                };
            };
        }

        private function storeAssets(_arg_1:_SafeStr_21):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("camera_fx_slider_bottom_active"));
            _SafeStr_5881 = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("camera_fx_slider_button"));
            _sliderButton = BitmapData(_local_2.content);
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_5880 = "_-t1i" (String#1458, DoABC#4)
// _SafeStr_5881 = "_-x1x" (String#1822, DoABC#4)
// _SafeStr_6580 = "_-u1B" (String#13592, DoABC#4)


