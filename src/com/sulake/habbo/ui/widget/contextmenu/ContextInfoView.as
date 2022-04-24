// by nota

//com.sulake.habbo.ui.widget.contextmenu.ContextInfoView

package com.sulake.habbo.ui.widget.contextmenu
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.utils.FixedSizeStack;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3216;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;

    public class ContextInfoView implements _SafeStr_13 
    {

        protected static const CONTEXT_INFO_DELAY:uint = 3000;
        protected static const BUTTON_COLOR_DEFAULT:uint = 4281149991;
        protected static const BUTTON_COLOR_HOVER:uint = 4282950861;
        protected static const _SafeStr_8967:uint = 0xFF993300;
        protected static const LINK_COLOR_ACTIONS_DEFAULT:uint = 0xFFFFFF;
        protected static const LINK_COLOR_ACTIONS_HOVER:uint = 9552639;
        protected static const _SafeStr_8968:uint = 0xFFFFFF;
        protected static const _SafeStr_8969:uint = 5789011;
        protected static const ICON_COLOR_ENABLED:uint = 13947341;
        protected static const ICON_COLOR_DISABLED:uint = 5789011;
        private static const _SafeStr_8970:int = 25;
        private static const _SafeStr_8971:int = 3;

        protected static var _SafeStr_5538:Boolean = false;

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_5529:_SafeStr_3133;
        protected var _SafeStr_5531:_SafeStr_3133;
        private var _forcedPositionUpdate:Boolean;
        protected var _SafeStr_4981:_SafeStr_3149;
        protected var _lockPosition:Boolean;
        protected var _SafeStr_5534:FixedSizeStack = new FixedSizeStack(25);
        protected var _SafeStr_5535:int = -1000000;
        protected var _disposed:Boolean = false;
        private var _forceActivateOnUpdate:Boolean = true;
        protected var _SafeStr_5530:Timer;
        protected var _SafeStr_8960:int = 3000;
        protected var _SafeStr_5532:Boolean;
        protected var _SafeStr_5533:Boolean;
        protected var _SafeStr_4427:Number;
        protected var _fadeTime:int;
        protected var _fadeLength:int = 500;
        protected var _SafeStr_8948:Boolean;

        public function ContextInfoView(_arg_1:_SafeStr_3149)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_8948 = true;
            _SafeStr_5532 = false;
            _SafeStr_5533 = false;
        }

        public static function setupContext(_arg_1:ContextInfoView):void
        {
            _arg_1._SafeStr_5532 = false;
            _arg_1._fadeLength = 500;
            _arg_1._SafeStr_5533 = false;
            _arg_1._SafeStr_4427 = 1;
            if (_arg_1._SafeStr_8948)
            {
                if (!_arg_1._SafeStr_5530)
                {
                    _arg_1._SafeStr_5530 = new Timer(_arg_1._SafeStr_8960, 1);
                    _arg_1._SafeStr_5530.addEventListener("timerComplete", _arg_1.onTimerComplete);
                };
                _arg_1._SafeStr_5530.reset();
                _arg_1._SafeStr_5530.start();
            };
            _arg_1.updateWindow();
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get maximumBlend():Number
        {
            return (1);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            _SafeStr_5531 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_5529)
            {
                _SafeStr_5529.dispose();
                _SafeStr_5529 = null;
            };
            if (_SafeStr_5530)
            {
                _SafeStr_5530.removeEventListener("timerComplete", onTimerComplete);
                _SafeStr_5530.reset();
                _SafeStr_5530 = null;
            };
            _disposed = true;
        }

        private function onTimerComplete(_arg_1:TimerEvent):void
        {
            _SafeStr_5533 = true;
            _fadeTime = 0;
            hide(true);
        }

        protected function addMouseClickListener(_arg_1:_SafeStr_3109, _arg_2:Function):void
        {
            if (_arg_1 != null)
            {
                _arg_1.addEventListener("WME_CLICK", _arg_2);
            };
        }

        protected function updateWindow():void
        {
        }

        protected function clickHandler(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage("RWUAM_START_NAME_CHANGE"));
            _SafeStr_4981.removeView(this, false);
        }

        public function setImageAsset(_arg_1:_SafeStr_3264, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_6:* = null;
            if ((((!(_arg_1)) || (!(_SafeStr_4981))) || (!(_SafeStr_4981.assets))))
            {
                return;
            };
            var _local_5:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (!_local_5)
            {
                return;
            };
            var _local_4:BitmapData = (_local_5.content as BitmapData);
            if (!_local_4)
            {
                return;
            };
            if (_arg_1.bitmap)
            {
                _arg_1.bitmap.fillRect(_arg_1.bitmap.rect, 0);
            }
            else
            {
                _arg_1.bitmap = new BitmapData(_arg_1.width, _arg_1.height, true, 0);
            };
            if (_arg_3)
            {
                _local_6 = new Point(((_arg_1.bitmap.width - _local_4.width) / 2), ((_arg_1.bitmap.height - _local_4.height) / 2));
            }
            else
            {
                _local_6 = new Point(0, 0);
            };
            _arg_1.bitmap.copyPixels(_local_4, _local_4.rect, _local_6, null, null, true);
            _arg_1.invalidate();
        }

        public function show():void
        {
            if (_SafeStr_5531 != null)
            {
                _SafeStr_5531.visible = true;
                if (!(_SafeStr_5531.parent is _SafeStr_3216))
                {
                    _SafeStr_4981.windowManager.getDesktop(0).addChild(_SafeStr_5531);
                };
                if (_forceActivateOnUpdate)
                {
                    _SafeStr_5531.activate();
                };
            };
        }

        public function hide(_arg_1:Boolean):void
        {
            if (_SafeStr_5531 != null)
            {
                if (((!(_SafeStr_5532)) && (_arg_1)))
                {
                    _SafeStr_5532 = true;
                    _SafeStr_5530.start();
                }
                else
                {
                    _SafeStr_5531.visible = false;
                    _SafeStr_5531.parent = null;
                };
            };
        }

        protected function getOffset(_arg_1:Rectangle):int
        {
            var _local_2:int = -(_SafeStr_5531.height);
            return (_local_2 - 4);
        }

        public function update(_arg_1:Rectangle, _arg_2:Point, _arg_3:uint):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (!_arg_1)
            {
                return;
            };
            if (!_SafeStr_5531)
            {
                updateWindow();
            };
            if (_SafeStr_5533)
            {
                _fadeTime = (_fadeTime + _arg_3);
                _SafeStr_4427 = ((1 - (_fadeTime / _fadeLength)) * maximumBlend);
            }
            else
            {
                _SafeStr_4427 = maximumBlend;
            };
            if (_SafeStr_4427 <= 0)
            {
                _SafeStr_4981.removeView(this, false);
                return;
            };
            if (((!(_lockPosition)) || (_forcedPositionUpdate)))
            {
                _local_4 = getOffset(_arg_1);
                _local_5 = (_arg_2.y - _arg_1.top);
                _SafeStr_5534.addValue(_local_5);
                _local_6 = _SafeStr_5534.getMax();
                if (_local_6 < (_SafeStr_5535 - 3))
                {
                    _local_6 = (_SafeStr_5535 - 3);
                };
                _local_7 = (_arg_2.y - _local_6);
                _SafeStr_5535 = _local_6;
                _SafeStr_5531.x = (_arg_2.x - (_SafeStr_5531.width / 2));
                _SafeStr_5531.y = (_local_7 + _local_4);
                _forcedPositionUpdate = false;
            };
            _SafeStr_5531.blend = _SafeStr_4427;
            show();
        }

        protected function onMouseHoverEvent(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.type == "WME_OVER")
            {
                _lockPosition = true;
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    if (!_arg_1.window.hitTestGlobalPoint(new Point(_arg_1.stageX, _arg_1.stageY)))
                    {
                        _lockPosition = false;
                    };
                };
            };
        }

        protected function setMinimized(_arg_1:Boolean):void
        {
            _SafeStr_5538 = _arg_1;
            _forcedPositionUpdate = true;
            updateWindow();
        }

        protected function getMinimizedView():_SafeStr_3133
        {
            var _local_1:* = null;
            if (!_SafeStr_5529)
            {
                _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("minimized_menu")).content as XML);
                _SafeStr_5529 = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                _SafeStr_5529.findChildByName("minimize").addEventListener("WME_CLICK", onMaximize);
                _SafeStr_5529.findChildByName("minimize").addEventListener("WME_OVER", onMinimizeHover);
                _SafeStr_5529.findChildByName("minimize").addEventListener("WME_OUT", onMinimizeHover);
                _SafeStr_5529.addEventListener("WME_OVER", onMouseHoverEvent);
                _SafeStr_5529.addEventListener("WME_OUT", onMouseHoverEvent);
            };
            return (_SafeStr_5529);
        }

        private function onMaximize(_arg_1:WindowMouseEvent):void
        {
            setMinimized(false);
        }

        protected function set activeView(_arg_1:_SafeStr_3133):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_SafeStr_5531)
            {
                _SafeStr_5531.parent = null;
            };
            _SafeStr_5531 = _arg_1;
        }

        protected function onMinimize(_arg_1:WindowMouseEvent):void
        {
            setMinimized(true);
        }

        protected function onMinimizeHover(_arg_1:WindowMouseEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3133 = (_arg_1.window as _SafeStr_3133);
            if (_local_2)
            {
                _local_3 = _local_2.findChildByName("icon");
                if (_local_3)
                {
                    if (_arg_1.type == "WME_OVER")
                    {
                        _local_3.color = 4282950861;
                    }
                    else
                    {
                        _local_3.color = 0xFFFFFF;
                    };
                };
            };
        }

        public function set forceActivateOnUpdate(_arg_1:Boolean):void
        {
            _forceActivateOnUpdate = _arg_1;
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.ui.widget.contextmenu

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4427 = "_-x1" (String#2030, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5529 = "_-21K" (String#5493, DoABC#4)
// _SafeStr_5530 = "_-f1o" (String#6436, DoABC#4)
// _SafeStr_5531 = "_-V14" (String#2652, DoABC#4)
// _SafeStr_5532 = "_-H1X" (String#11489, DoABC#4)
// _SafeStr_5533 = "_-F7" (String#11126, DoABC#4)
// _SafeStr_5534 = "_-e1c" (String#15402, DoABC#4)
// _SafeStr_5535 = "_-l1X" (String#14798, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)
// _SafeStr_8960 = "_-pq" (String#14751, DoABC#4)
// _SafeStr_8967 = "_-r1q" (String#41006, DoABC#4)
// _SafeStr_8968 = "_-PE" (String#39347, DoABC#4)
// _SafeStr_8969 = "_-r1v" (String#41007, DoABC#4)
// _SafeStr_8970 = "_-Y1t" (String#35992, DoABC#4)
// _SafeStr_8971 = "_-P1E" (String#41276, DoABC#4)


