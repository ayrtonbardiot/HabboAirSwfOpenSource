// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController

package com.sulake.habbo.roomevents.userdefinedroomevents.common
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.assets.BitmapDataAsset;

    public class SliderWindowController extends EventDispatcherWrapper 
    {

        private var _SafeStr_6405:Number = 0;
        private var _SafeStr_5880:_SafeStr_3133;
        private var _SafeStr_6406:Boolean = false;
        private var _SafeStr_5881:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _SafeStr_6403:Number = 0;
        private var _SafeStr_6404:Number = 1;
        private var _SafeStr_6407:Number = 0;

        public function SliderWindowController(_arg_1:HabboUserDefinedRoomEvents, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_21, _arg_4:Number=0, _arg_5:Number=1, _arg_6:Number=0)
        {
            _SafeStr_5880 = _SafeStr_3133(_arg_1.getXmlWindow("ude_slider"));
            _arg_2.addChild(_SafeStr_5880);
            _SafeStr_6403 = _arg_4;
            _SafeStr_6404 = _arg_5;
            _SafeStr_6407 = _arg_6;
            _SafeStr_6405 = 0;
            storeAssets(_arg_3);
            displaySlider();
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_5880 = null;
            _SafeStr_5881 = null;
            _sliderButton = null;
        }

        public function setValue(_arg_1:Number, _arg_2:Boolean=true):void
        {
            _arg_1 = Math.max(_SafeStr_6403, _arg_1);
            _arg_1 = Math.min(_SafeStr_6404, _arg_1);
            _SafeStr_6405 = _arg_1;
            if (_arg_2)
            {
                updateSliderPosition();
            };
            dispatchEvent(new Event("change"));
        }

        public function getValue():Number
        {
            return (_SafeStr_6405);
        }

        public function set min(_arg_1:Number):void
        {
            _SafeStr_6403 = _arg_1;
        }

        public function set max(_arg_1:Number):void
        {
            _SafeStr_6404 = _arg_1;
        }

        private function updateSliderPosition():void
        {
            if (_SafeStr_5880 == null)
            {
                return;
            };
            var _local_1:_SafeStr_3109 = _SafeStr_5880.findChildByName("slider_button");
            if (_local_1 != null)
            {
                _local_1.x = getSliderPosition(_SafeStr_6405);
            };
            _local_1.parent.invalidate();
        }

        private function getSliderPosition(_arg_1:Number):int
        {
            return (int((_referenceWidth * ((_arg_1 - _SafeStr_6403) / (_SafeStr_6404 - _SafeStr_6403)))));
        }

        private function getValueAtPosition(_arg_1:Number):Number
        {
            return (((_arg_1 / _referenceWidth) * (_SafeStr_6404 - _SafeStr_6403)) + _SafeStr_6403);
        }

        private function sliderProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:Number;
            var _local_3:Number;
            if (_arg_1.type == "WME_DOWN")
            {
                _SafeStr_6406 = true;
            };
            if (_SafeStr_6406)
            {
                if (((_arg_1.type == "WME_UP") || (_arg_1.type == "WME_UP_OUTSIDE")))
                {
                    _SafeStr_6406 = false;
                };
            };
            if (((!(_SafeStr_6406)) || (!(_arg_1.type == "WE_RELOCATED"))))
            {
                return;
            };
            if (_SafeStr_6407 != 0)
            {
                _local_4 = getValueAtPosition(_arg_2.x);
                _local_3 = (Math.round((_local_4 / _SafeStr_6407)) * _SafeStr_6407);
                setValue(_local_3, false);
            };
        }

        private function sliderButtonRightProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:Number;
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_6406 = false;
                if (_SafeStr_6407 != 0)
                {
                    _local_3 = (_SafeStr_6405 + _SafeStr_6407);
                    setValue(_local_3);
                };
            };
        }

        private function sliderButtonLeftProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:Number;
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_6406 = false;
                if (_SafeStr_6407 != 0)
                {
                    _local_3 = (_SafeStr_6405 - _SafeStr_6407);
                    setValue(_local_3);
                };
            };
        }

        private function displaySlider():void
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            if (_SafeStr_5880 == null)
            {
                return;
            };
            _local_3 = (_SafeStr_5880.findChildByName("slider_base") as _SafeStr_3264);
            if (((!(_local_3 == null)) && (!(_SafeStr_5881 == null))))
            {
                _local_3.bitmap = new BitmapData(_SafeStr_5881.width, _SafeStr_5881.height, true, 0xFFFFFF);
                _local_3.bitmap.copyPixels(_SafeStr_5881, _SafeStr_5881.rect, new Point(0, 0), null, null, true);
            };
            _local_1 = (_SafeStr_5880.findChildByName("slider_movement_area") as _SafeStr_3133);
            if (_local_1 != null)
            {
                _local_3 = (_local_1.findChildByName("slider_button") as _SafeStr_3264);
                if (((!(_local_3 == null)) && (!(_sliderButton == null))))
                {
                    _local_3.bitmap = new BitmapData(_sliderButton.width, _sliderButton.height, true, 0xFFFFFF);
                    _local_3.bitmap.copyPixels(_sliderButton, _sliderButton.rect, new Point(0, 0), null, null, true);
                    _local_3.procedure = sliderProcedure;
                    _referenceWidth = (_local_1.width - _local_3.width);
                };
            };
            _local_2 = (_SafeStr_5880.findChildByName("slider_button_left") as _SafeStr_3240);
            if (_local_2)
            {
                _local_2.procedure = sliderButtonLeftProcedure;
            };
            _local_4 = (_SafeStr_5880.findChildByName("slider_button_right") as _SafeStr_3240);
            if (_local_4)
            {
                _local_4.procedure = sliderButtonRightProcedure;
            };
        }

        private function storeAssets(_arg_1:_SafeStr_21):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("slider_bg_png"));
            _SafeStr_5881 = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("slider_obj_png"));
            _sliderButton = BitmapData(_local_2.content);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.common

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5880 = "_-t1i" (String#1458, DoABC#4)
// _SafeStr_5881 = "_-x1x" (String#1822, DoABC#4)
// _SafeStr_6403 = "_-X1I" (String#2306, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6405 = "_-Io" (String#8341, DoABC#4)
// _SafeStr_6406 = "_-AX" (String#6876, DoABC#4)
// _SafeStr_6407 = "_-2g" (String#7064, DoABC#4)


