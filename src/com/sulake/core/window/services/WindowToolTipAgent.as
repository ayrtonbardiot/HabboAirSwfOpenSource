// by nota

//com.sulake.core.window.services.WindowToolTipAgent

package com.sulake.core.window.services
{
    import com.sulake.core.window.components.IToolTipWindow;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.TimerEvent;

    public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService 
    {

        protected var _toolTipCaption:String;
        protected var _SafeStr_6717:IToolTipWindow;
        protected var _SafeStr_6716:Timer;

        protected var _pointerOffset:Point = new Point();
        protected var _toolTipOffset:Point = new Point(20, 20);
        protected var _SafeStr_4455:uint = 500;

        public function WindowToolTipAgent(_arg_1:DisplayObject)
        {
            super(_arg_1);
        }

        override public function begin(_arg_1:_SafeStr_3109, _arg_2:uint=0):_SafeStr_3109
        {
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                if ((_arg_1 is IInteractiveWindow))
                {
                    _toolTipCaption = IInteractiveWindow(_arg_1).toolTipCaption;
                    _SafeStr_4455 = IInteractiveWindow(_arg_1).toolTipDelay;
                }
                else
                {
                    _toolTipCaption = _arg_1.caption;
                    _SafeStr_4455 = 500;
                };
                _mouse.x = _SafeStr_5428.mouseX;
                _mouse.y = _SafeStr_5428.mouseY;
                getMousePositionRelativeTo(_arg_1, _mouse, _pointerOffset);
                if (_SafeStr_6716 == null)
                {
                    _SafeStr_6716 = new Timer(_SafeStr_4455, 1);
                    _SafeStr_6716.addEventListener("timer", showToolTip);
                };
                _SafeStr_6716.reset();
                _SafeStr_6716.start();
            };
            return (super.begin(_arg_1, _arg_2));
        }

        override public function end(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            if (_SafeStr_6716 != null)
            {
                _SafeStr_6716.stop();
                _SafeStr_6716.removeEventListener("timer", showToolTip);
                _SafeStr_6716 = null;
            };
            hideToolTip();
            return (super.end(_arg_1));
        }

        override public function operate(_arg_1:int, _arg_2:int):void
        {
            if (((_window) && (!(_window.disposed))))
            {
                _mouse.x = _arg_1;
                _mouse.y = _arg_2;
                getMousePositionRelativeTo(_window, _mouse, _pointerOffset);
                if (((!(_SafeStr_6717 == null)) && (!(_SafeStr_6717.disposed))))
                {
                    _SafeStr_6717.x = (_arg_1 + _toolTipOffset.x);
                    _SafeStr_6717.y = (_arg_2 + _toolTipOffset.y);
                };
            };
        }

        protected function showToolTip(_arg_1:TimerEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_6716 != null)
            {
                _SafeStr_6716.reset();
            };
            if (((_window) && (!(_window.disposed))))
            {
                if ((_window is IInteractiveWindow))
                {
                    _toolTipCaption = IInteractiveWindow(_window).toolTipCaption;
                }
                else
                {
                    _toolTipCaption = _window.caption;
                };
                if (((_SafeStr_6717 == null) || (_SafeStr_6717.disposed)))
                {
                    _SafeStr_6717 = (_window.context.create((_window.name + "::ToolTip"), _toolTipCaption, 8, _window.style, (0x20 | 0x00), null, null, null, 0, null, null) as IToolTipWindow);
                };
                _local_2 = new Point();
                _window.getGlobalPosition(_local_2);
                _SafeStr_6717.x = ((_local_2.x + _pointerOffset.x) + _toolTipOffset.x);
                _SafeStr_6717.y = ((_local_2.y + _pointerOffset.y) + _toolTipOffset.y);
                _SafeStr_6717.visible = (_SafeStr_6717.caption.length > 0);
            };
        }

        protected function hideToolTip():void
        {
            if (((!(_SafeStr_6717 == null)) && (!(_SafeStr_6717.disposed))))
            {
                _SafeStr_6717.destroy();
                _SafeStr_6717 = null;
            };
        }

        public function updateCaption(_arg_1:_SafeStr_3109):void
        {
            var _local_2:* = null;
            if (((((_arg_1 == null) || (_arg_1.disposed)) || (_SafeStr_6717 == null)) || (_SafeStr_6717.disposed)))
            {
                return;
            };
            if ((_arg_1 is IInteractiveWindow))
            {
                _local_2 = IInteractiveWindow(_arg_1).toolTipCaption;
            }
            else
            {
                _local_2 = _arg_1.caption;
            };
            if (_local_2 != _toolTipCaption)
            {
                _toolTipCaption = _local_2;
                if (((_local_2 == null) || (_local_2.length == 0)))
                {
                    _SafeStr_6717.visible = false;
                }
                else
                {
                    _SafeStr_6717.caption = _local_2;
                    _SafeStr_6717.visible = true;
                };
            };
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_4455 = "_-2h" (String#2981, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_6716 = "_-fL" (String#5485, DoABC#4)
// _SafeStr_6717 = "_-U1N" (String#3493, DoABC#4)


