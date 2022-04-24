// by nota

//com.sulake.habbo.help.WelcomeScreenController

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window._SafeStr_3133;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3263;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    public class WelcomeScreenController implements _SafeStr_41 
    {

        private var _habboHelp:HabboHelp;
        private var _disposed:Boolean;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4073:Point = new Point(72, 10);
        private var _SafeStr_5036:String;
        private var _SafeStr_5037:int;
        private var _SafeStr_5038:String;

        public function WelcomeScreenController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_habboHelp)
            {
                _habboHelp.removeUpdateReceiver(this);
                _habboHelp = null;
            };
            if (_window)
            {
                _window.findChildByName("close").removeEventListener("WME_CLICK", onCloseButton);
                _window.findChildByName("click").removeEventListener("WME_CLICK", onRegionClick);
                _window.dispose();
                _window = null;
            };
            _disposed = true;
        }

        public function showWelcomeScreen(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:String):void
        {
            if (_disposed)
            {
                return;
            };
            _SafeStr_5036 = _arg_1;
            _SafeStr_5037 = _arg_3;
            _SafeStr_5038 = _arg_4;
            if (_window == null)
            {
                initializeWindow();
            };
            var _local_5:ITextWindow = ITextWindow(_window.findChildByName("text"));
            _local_5.caption = (("${" + _arg_2) + "}");
            _local_5.height = (_local_5.textHeight + 5);
            updatePosition();
            this.registerUpdates();
            _window.visible = true;
            _window.activate();
        }

        private function initializeWindow():void
        {
            var _local_1:XmlAsset = (_habboHelp.assets.getAssetByName("welcome_screen_xml") as XmlAsset);
            _window = (_habboHelp.windowManager.buildFromXML((_local_1.content as XML), 2) as _SafeStr_3133);
            var _local_3:_SafeStr_3263 = (_window.findChildByName("frame") as _SafeStr_3263);
            _local_3.header.visible = false;
            _local_3.content.y = (_local_3.content.y - 20);
            var _local_2:ITextWindow = (_window.findChildByName("text") as ITextWindow);
            _local_2.height = (_local_2.textHeight + 5);
            _local_3.content.setParamFlag(0x0800, false);
            _local_3.height = (_local_3.height - 20);
            _window.findChildByName("close").addEventListener("WME_CLICK", onCloseButton);
            _window.findChildByName("click").addEventListener("WME_CLICK", onRegionClick);
        }

        private function updatePosition():void
        {
            var _local_1:Rectangle = _habboHelp.toolbar.getIconLocation(_SafeStr_5036);
            var _local_2:_SafeStr_3109 = _window.findChildByName("arrow");
            var _local_3:_SafeStr_3109 = _window.findChildByName("arrow_right");
            if (_local_1 == null)
            {
                _local_1 = new Rectangle(0, 0, _window.width, _window.height);
            };
            if (_SafeStr_5037 == 0)
            {
                _SafeStr_4073.x = 72;
                _window.x = -(_window.width);
                _local_2.y = ((_window.height - _local_2.height) / 2);
                _local_2.visible = true;
                _local_3.visible = false;
            }
            else
            {
                _SafeStr_4073.x = (_local_1.x - _window.width);
                _window.x = ((_local_1.x + _local_1.width) + _window.width);
                _local_3.y = ((_window.height - _local_2.height) / 2);
                _local_3.visible = true;
                _local_2.visible = false;
            };
            if (_local_1 != null)
            {
                _SafeStr_4073.y = ((_local_1.y + (_local_1.height / 2)) - (_window.height / 2));
            }
            else
            {
                _SafeStr_4073.y = 0;
            };
            _window.y = _SafeStr_4073.y;
        }

        private function onCloseButton(_arg_1:WindowMouseEvent):void
        {
            closeWindow();
        }

        private function onRegionClick(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5038 != null)
            {
                _habboHelp.toolbar.toggleWindowVisibility(_SafeStr_5038);
            };
            closeWindow();
        }

        private function closeWindow():void
        {
            if (!_window)
            {
                return;
            };
            _window.visible = false;
            dispose();
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:* = null;
            if (_window == null)
            {
                _habboHelp.removeUpdateReceiver(this);
                return;
            };
            var _local_2:Number = Point.distance(_window.position, _SafeStr_4073);
            if (_local_2 > 5)
            {
                _local_3 = Point.interpolate(_window.position, _SafeStr_4073, 0.5);
                _window.x = _local_3.x;
                _window.y = _local_3.y;
            }
            else
            {
                _window.x = _SafeStr_4073.x;
                _window.y = _SafeStr_4073.y;
                _habboHelp.removeUpdateReceiver(this);
            };
        }

        private function registerUpdates():void
        {
            _habboHelp.removeUpdateReceiver(this);
            _habboHelp.registerUpdateReceiver(this, 10);
        }

        public function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            var _local_2:* = null;
            if (_disposed)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "HTE_RESIZED":
                    if (_habboHelp != null)
                    {
                        _local_2 = _habboHelp.toolbar.getIconLocation(_SafeStr_5036);
                    };
                    if (_local_2 != null)
                    {
                        _SafeStr_4073.y = ((_local_2.y + (_local_2.height / 2)) - (_window.height / 2));
                        _window.y = _SafeStr_4073.y;
                    };
                    return;
                case "HTE_TOOLBAR_CLICK":
                case "HTE_GROUP_ROOM_INFO_CLICK":
                    closeWindow();
                    return;
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4073 = "_-gU" (String#2051, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5036 = "_-l1R" (String#14980, DoABC#4)
// _SafeStr_5037 = "_-O11" (String#4228, DoABC#4)
// _SafeStr_5038 = "_-wJ" (String#14453, DoABC#4)


