// by nota

//com.sulake.core.window.services.FocusManager

package com.sulake.core.window.services
{
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components._SafeStr_3162;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import com.sulake.core.window.utils.*;

    public class FocusManager implements _SafeStr_3411 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_4845:Stage;
        private var _SafeStr_6600:Vector.<_SafeStr_3162> = new Vector.<_SafeStr_3162>();

        public function FocusManager(_arg_1:DisplayObject)
        {
            _SafeStr_4845 = _arg_1.stage;
            _SafeStr_4845.addEventListener("activate", onActivateEvent);
            _SafeStr_4845.addEventListener("focusOut", onFocusEvent);
            _SafeStr_4845.addEventListener("keyFocusChange", onFocusEvent);
            _SafeStr_4845.addEventListener("mouseFocusChange", onFocusEvent);
            super();
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4845.removeEventListener("activate", onActivateEvent);
                _SafeStr_4845.removeEventListener("focusOut", onFocusEvent);
                _SafeStr_4845.removeEventListener("keyFocusChange", onFocusEvent);
                _SafeStr_4845.removeEventListener("mouseFocusChange", onFocusEvent);
                _SafeStr_4845 = null;
                _disposed = true;
                _SafeStr_6600 = null;
            };
        }

        public function registerFocusWindow(_arg_1:_SafeStr_3162):void
        {
            if (_arg_1 != null)
            {
                if (_SafeStr_6600.indexOf(_arg_1) == -1)
                {
                    _SafeStr_6600.push(_arg_1);
                    if (_SafeStr_4845.focus == null)
                    {
                        _arg_1.focus();
                    };
                };
            };
        }

        public function removeFocusWindow(_arg_1:_SafeStr_3162):void
        {
            var _local_2:int;
            if (_arg_1 != null)
            {
                _local_2 = _SafeStr_6600.indexOf(_arg_1);
                if (_local_2 > -1)
                {
                    _SafeStr_6600.splice(_local_2, 1);
                };
            };
            if (_SafeStr_4845.focus == null)
            {
                resolveNextFocusTarget();
            };
        }

        private function resolveNextFocusTarget():_SafeStr_3162
        {
            var _local_1:* = null;
            var _local_2:uint = _SafeStr_6600.length;
            while (_local_2-- != 0)
            {
                _local_1 = (_SafeStr_6600[_local_2] as _SafeStr_3162);
                if (_local_1.disposed)
                {
                    _SafeStr_6600.splice(_local_2, 1);
                }
                else
                {
                    _local_1.focus();
                    break;
                };
            };
            return (_local_1);
        }

        private function onActivateEvent(_arg_1:Event):void
        {
            if (_SafeStr_4845.focus == null)
            {
                resolveNextFocusTarget();
            };
        }

        private function onFocusEvent(_arg_1:FocusEvent):void
        {
            if (_SafeStr_4845.focus == null)
            {
                resolveNextFocusTarget();
            };
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_3162 = "_-21D" (String#5841, DoABC#4)
// _SafeStr_3411 = "_-61X" (String#11392, DoABC#4)
// _SafeStr_4845 = "_-w1I" (String#1591, DoABC#4)
// _SafeStr_6600 = "_-91h" (String#2329, DoABC#4)


