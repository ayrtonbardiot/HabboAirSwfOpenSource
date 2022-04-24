// by nota

//com.sulake.habbo.ui.widget.furniture.CustomStackHeightWidget

package com.sulake.habbo.ui.widget.furniture
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.handler._SafeStr_3328;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import _-02a._SafeStr_819;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class CustomStackHeightWidget extends RoomWidgetBase 
    {

        private static const SLIDER_RANGE:int = 10;
        private static const MAX_HEIGHT:int = 40;
        private static const SLIDER_BUTTON_WIDTH:int = 20;

        private var _window:_SafeStr_3133;
        private var _SafeStr_4318:int;

        public function CustomStackHeightWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_3328(_arg_1).widget = this;
        }

        override public function dispose():void
        {
            destroyWindow();
            super.dispose();
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        private function createWindow():void
        {
            if (!_window)
            {
                _window = _SafeStr_3133(windowManager.buildFromXML(XML(assets.getAssetByName("custom_stack_height_xml").content)));
                _window.procedure = windowProcedure;
                _window.center();
            };
        }

        public function open(_arg_1:int, _arg_2:Number):void
        {
            _SafeStr_4318 = _arg_1;
            _arg_2 = Math.min(_arg_2, 40);
            if (_window == null)
            {
                createWindow();
            };
            _window.findChildByName("input_height").caption = _arg_2.toString();
            updateSlider();
            _window.visible = true;
        }

        public function hide():void
        {
            if (_window == null)
            {
                return;
            };
            _window.visible = false;
        }

        private function destroyWindow():void
        {
            if (_window)
            {
                _window.procedure = null;
                _window.dispose();
                _window = null;
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_floor_level":
                        altitude = 0;
                        sendCurrentHeight();
                        break;
                    case "button_above_stack":
                        handler.container.connection.send(new _SafeStr_819(_SafeStr_4318));
                        break;
                    case "header_button_close":
                        destroyWindow();
                        break;
                    case "slider":
                        _window.findChildByName("slider_button").x = WindowMouseEvent(_arg_1).localX;
                        sendCurrentHeight();
                };
            }
            else
            {
                if (((_arg_1.type == "WME_UP") || (_arg_1.type == "WME_UP_OUTSIDE")))
                {
                    switch (_arg_2.name)
                    {
                        case "slider_button":
                            sendCurrentHeight();
                    };
                }
                else
                {
                    if (_arg_1.type == "WME_DOUBLE_CLICK")
                    {
                        switch (_arg_2.name)
                        {
                            case "slider_button":
                                updateHeightSelection(true);
                                sendCurrentHeight();
                        };
                    }
                    else
                    {
                        if (_arg_1.type == "WE_RELOCATED")
                        {
                            switch (_arg_2.name)
                            {
                                case "slider_button":
                                    updateHeightSelection();
                            };
                        }
                        else
                        {
                            if (_arg_1.type == "WKE_KEY_DOWN")
                            {
                                if (_arg_2.name == "input_height")
                                {
                                    if (WindowKeyboardEvent(_arg_1).keyCode == 13)
                                    {
                                        updateSlider();
                                        sendCurrentHeight();
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function sendCurrentHeight():void
        {
            var _local_1:int = (parseFloat(_window.findChildByName("input_height").caption) * 100);
            handler.container.connection.send(new _SafeStr_819(_SafeStr_4318, _local_1));
        }

        private function updateSlider():void
        {
            var _local_3:Number = parseFloat(_window.findChildByName("input_height").caption);
            var _local_1:Number = (_local_3 / 10);
            _local_1 = Math.min(_local_1, 1);
            var _local_2:Number = (_window.findChildByName("slider").width - 20);
            _window.procedure = null;
            _window.findChildByName("slider_button").x = (_local_2 * _local_1);
            _window.procedure = windowProcedure;
        }

        private function updateHeightSelection(_arg_1:Boolean=false):void
        {
            var _local_4:int = ((_arg_1) ? 1 : 100);
            var _local_3:Number = (_window.findChildByName("slider").width - 20);
            var _local_2:Number = (_window.findChildByName("slider_button").x / _local_3);
            var _local_5:Number = ((_local_2 * 10) * _local_4);
            _window.findChildByName("input_height").caption = (_local_5 / (_local_4 * 1)).toString();
        }

        private function get handler():_SafeStr_3328
        {
            return (_SafeStr_3914 as _SafeStr_3328);
        }

        private function set altitude(_arg_1:Number):void
        {
            if (_window != null)
            {
                _window.findChildByName("input_height").caption = _arg_1.toString();
                updateSlider();
            };
        }

        public function updateHeight(_arg_1:int, _arg_2:Number):void
        {
            if (_SafeStr_4318 == _arg_1)
            {
                altitude = _arg_2;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3328 = "_-Hk" (String#9140, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_819 = "_-iR" (String#18105, DoABC#4)


