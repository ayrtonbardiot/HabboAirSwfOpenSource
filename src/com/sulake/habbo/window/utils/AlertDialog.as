// by nota

//com.sulake.habbo.window.utils.AlertDialog

package com.sulake.habbo.window.utils
{
    import com.sulake.core.window.utils.INotify;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class AlertDialog implements _SafeStr_3114, INotify 
    {

        protected static const LIST_BUTTONS:String = "_alert_button_list";
        protected static const _SafeStr_9155:String = "_alert_button_ok";
        protected static const _SafeStr_9156:String = "_alert_button_cancel";
        protected static const BUTTON_CUSTOM:String = "_alert_button_custom";
        protected static const _SafeStr_8574:String = "header_button_close";
        protected static const _SafeStr_9153:String = "_alert_text_summary";

        private static var _SafeStr_4002:uint = 0;

        protected var _SafeStr_4004:String = "";
        protected var _SafeStr_4005:String = "";
        protected var _disposed:Boolean = false;
        protected var _callback:Function = null;
        protected var _window:_SafeStr_3263;
        protected var _SafeStr_4003:IModalDialog;

        public function AlertDialog(_arg_1:_SafeStr_1695, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function, _arg_7:Boolean)
        {
            var _local_8:* = null;
            super();
            _SafeStr_4002++;
            if (_arg_7)
            {
                _SafeStr_4003 = _arg_1.buildModalDialogFromXML(_arg_2);
                _window = (_SafeStr_4003.rootWindow as _SafeStr_3263);
            }
            else
            {
                _window = (_arg_1.buildFromXML(_arg_2, 2) as _SafeStr_3263);
            };
            if (_arg_5 == 0)
            {
                _arg_5 = ((0x10 | 0x01) | 0x02);
            };
            var _local_9:IItemListWindow = (_window.findChildByName("_alert_button_list") as IItemListWindow);
            if (_local_9)
            {
                if (!(_arg_5 & 0x10))
                {
                    _local_8 = _local_9.getListItemByName("_alert_button_ok");
                    _local_8.dispose();
                };
                if (!(_arg_5 & 0x20))
                {
                    _local_8 = _local_9.getListItemByName("_alert_button_cancel");
                    _local_8.dispose();
                };
                if (!(_arg_5 & 0x40))
                {
                    _local_8 = _local_9.getListItemByName("_alert_button_custom");
                    _local_8.dispose();
                };
            };
            _window.procedure = dialogEventProc;
            _window.center();
            this.title = _arg_3;
            this.summary = _arg_4;
            this.callback = _arg_6;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (((_SafeStr_4003) && (!(_SafeStr_4003.disposed))))
                {
                    _SafeStr_4003.dispose();
                    _SafeStr_4003 = null;
                    _window = null;
                };
                if (((_window) && (!(_window.disposed))))
                {
                    _window.dispose();
                    _window = null;
                };
                _callback = null;
                _disposed = true;
            };
        }

        protected function dialogEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "_alert_button_ok":
                        if (_callback != null)
                        {
                            _local_3 = _SafeStr_3116.allocate("WE_OK", null, null);
                            (_callback(this, _local_3));
                            _local_3.recycle();
                        }
                        else
                        {
                            dispose();
                        };
                        return;
                    case "header_button_close":
                    case "_alert_button_cancel":
                        if (_callback != null)
                        {
                            _local_3 = _SafeStr_3116.allocate("WE_CANCEL", null, null);
                            (_callback(this, _local_3));
                            _local_3.recycle();
                        }
                        else
                        {
                            dispose();
                        };
                        return;
                };
            };
        }

        public function getButtonCaption(_arg_1:int):ICaption
        {
            var _local_2:* = null;
            if (!_disposed)
            {
                switch (_arg_1)
                {
                    case 16:
                        _local_2 = (_window.findChildByName("_alert_button_ok") as IInteractiveWindow);
                        break;
                    case 32:
                        _local_2 = (_window.findChildByName("_alert_button_cancel") as IInteractiveWindow);
                        break;
                    case 64:
                        _local_2 = (_window.findChildByName("_alert_button_custom") as IInteractiveWindow);
                };
            };
            return ((_local_2) ? new AlertDialogCaption(_local_2.caption, _local_2.toolTipCaption, _local_2.visible) : null);
        }

        public function setButtonCaption(_arg_1:int, _arg_2:ICaption):void
        {
            var _local_3:* = null;
            if (!_disposed)
            {
                switch (_arg_1)
                {
                    case 16:
                        _local_3 = (_window.findChildByName("_alert_button_ok") as IInteractiveWindow);
                        break;
                    case 32:
                        _local_3 = (_window.findChildByName("_alert_button_cancel") as IInteractiveWindow);
                        break;
                    case 64:
                        _local_3 = (_window.findChildByName("_alert_button_custom") as IInteractiveWindow);
                };
            };
            if (_local_3)
            {
                _local_3.caption = _arg_2.text;
            };
        }

        public function set title(_arg_1:String):void
        {
            _SafeStr_4004 = _arg_1;
            if (_window)
            {
                _window.caption = _SafeStr_4004;
            };
        }

        public function get title():String
        {
            return (_SafeStr_4004);
        }

        public function set summary(_arg_1:String):void
        {
            _SafeStr_4005 = _arg_1;
            if (_window)
            {
                ITextWindow(_window.findChildByTag("DESCRIPTION")).text = _SafeStr_4005;
            };
        }

        public function get summary():String
        {
            return (_SafeStr_4005);
        }

        public function set callback(_arg_1:Function):void
        {
            _callback = _arg_1;
        }

        public function get callback():Function
        {
            return (_callback);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4005 = "_-Rc" (String#5627, DoABC#4)
// _SafeStr_8574 = "_-U1r" (String#14514, DoABC#4)
// _SafeStr_9153 = "_-hF" (String#31554, DoABC#4)
// _SafeStr_9155 = "_-22" (String#29126, DoABC#4)
// _SafeStr_9156 = "_-ys" (String#28937, DoABC#4)


