// by nota

//com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget

package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.components._SafeStr_3263;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler.FurnitureBackgroundColorWidgetHandler;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.room.utils.ColorConverter;
    import _-02a._SafeStr_777;
    import _-j1G._SafeStr_558;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BackgroundColorFurniWidget extends RoomWidgetBase 
    {

        private static const PARAMETER_HUE:String = "hue";
        private static const PARAMETER_SATURATION:String = "saturation";
        private static const PARAMETER_LIGHTNESS:String = "lightness";

        private var _window:_SafeStr_3263;
        private var _SafeStr_4318:int;
        private var _sliders:Vector.<BackgroundColorWidgetSlider> = new Vector.<BackgroundColorWidgetSlider>();
        private var _SafeStr_4609:int;
        private var _saturation:int;
        private var _SafeStr_4610:int;

        public function BackgroundColorFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            this.handler.widget = this;
        }

        public function get handler():FurnitureBackgroundColorWidgetHandler
        {
            return (_SafeStr_3914 as FurnitureBackgroundColorWidgetHandler);
        }

        override public function dispose():void
        {
            destroyWindow();
            super.dispose();
        }

        public function open(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            _SafeStr_4318 = _arg_1;
            _SafeStr_4609 = Math.max(_arg_2, 0);
            _saturation = Math.max(_arg_3, 0);
            _SafeStr_4610 = Math.max(_arg_4, 0);
            createWindow();
        }

        public function setParameterCallback(_arg_1:String, _arg_2:int):void
        {
            switch (_arg_1)
            {
                case "hue":
                    _SafeStr_4609 = _arg_2;
                    break;
                case "saturation":
                    _saturation = _arg_2;
                    break;
                case "lightness":
                    _SafeStr_4610 = _arg_2;
            };
            renderColorPreview();
        }

        private function createWindow():void
        {
            if (!_window)
            {
                _window = _SafeStr_3263(windowManager.buildFromXML((assets.getAssetByName("background_color_ui_xml").content as XML)));
                _window.procedure = windowProcedure;
                _window.center();
                _sliders.push(new BackgroundColorWidgetSlider(this, "hue", _SafeStr_3133(_window.findChildByName("hue_container")), _SafeStr_4609));
                _sliders.push(new BackgroundColorWidgetSlider(this, "saturation", _SafeStr_3133(_window.findChildByName("saturation_container")), _saturation));
                _sliders.push(new BackgroundColorWidgetSlider(this, "lightness", _SafeStr_3133(_window.findChildByName("lightness_container")), _SafeStr_4610));
            };
        }

        private function destroyWindow():void
        {
            for each (var _local_1:BackgroundColorWidgetSlider in _sliders)
            {
                _local_1.dispose();
            };
            _sliders = new Vector.<BackgroundColorWidgetSlider>();
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function renderColorPreview():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName("color_preview_bitmap"));
            var _local_2:BitmapData = new BitmapData(_local_3.width, _local_3.height, false);
            var _local_1:uint = ColorConverter.hslToRGB(((((_SafeStr_4609 & 0xFF) << 16) + ((_saturation & 0xFF) << 8)) + (_SafeStr_4610 & 0xFF)));
            _local_2.fillRect(_local_2.rect, _local_1);
            _local_3.bitmap = _local_2;
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_2 == null)) && (_arg_1.type == "WME_CLICK")))
            {
                switch (_arg_2.name)
                {
                    case "apply_button":
                        handler.container.connection.send(new _SafeStr_777(_SafeStr_4318, _SafeStr_4609, _saturation, _SafeStr_4610));
                        return;
                    case "on_off_button":
                        handler.container.connection.send(new _SafeStr_558(_SafeStr_4318));
                        return;
                    case "header_button_close":
                        destroyWindow();
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.backgroundcolor

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_4609 = "_-K1q" (String#4762, DoABC#4)
// _SafeStr_4610 = "_-M1Z" (String#4638, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_777 = "_-d1H" (String#31007, DoABC#4)


