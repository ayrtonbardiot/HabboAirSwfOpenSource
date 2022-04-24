// by nota

//com.sulake.core.window.utils.TextMargins

package com.sulake.core.window.utils
{
    import com.sulake.core.runtime._SafeStr_13;

    public class TextMargins implements IMargins, _SafeStr_13 
    {

        private var _SafeStr_6111:int;
        private var _SafeStr_6112:int;
        private var _top:int;
        private var _SafeStr_6113:int;
        private var _callback:Function;
        private var _disposed:Boolean = false;

        public function TextMargins(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Function)
        {
            _SafeStr_6111 = _arg_1;
            _top = _arg_2;
            _SafeStr_6112 = _arg_3;
            _SafeStr_6113 = _arg_4;
            _callback = ((_arg_5 != null) ? _arg_5 : nullCallback);
        }

        public function get left():int
        {
            return (_SafeStr_6111);
        }

        public function get right():int
        {
            return (_SafeStr_6112);
        }

        public function get top():int
        {
            return (_top);
        }

        public function get bottom():int
        {
            return (_SafeStr_6113);
        }

        public function set left(_arg_1:int):void
        {
            _SafeStr_6111 = _arg_1;
            _callback(this); //not popped
        }

        public function set right(_arg_1:int):void
        {
            _SafeStr_6112 = _arg_1;
            _callback(this); //not popped
        }

        public function set top(_arg_1:int):void
        {
            _top = _arg_1;
            _callback(this); //not popped
        }

        public function set bottom(_arg_1:int):void
        {
            _SafeStr_6113 = _arg_1;
            _callback(this); //not popped
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get isZeroes():Boolean
        {
            return ((((_SafeStr_6111 == 0) && (_SafeStr_6112 == 0)) && (_top == 0)) && (_SafeStr_6113 == 0));
        }

        public function assign(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Function):void
        {
            _SafeStr_6111 = _arg_1;
            _top = _arg_2;
            _SafeStr_6112 = _arg_3;
            _SafeStr_6113 = _arg_4;
            _callback = ((_arg_5 != null) ? _arg_5 : nullCallback);
        }

        public function clone(_arg_1:Function):TextMargins
        {
            return (new TextMargins(_SafeStr_6111, _top, _SafeStr_6112, _SafeStr_6113, _arg_1));
        }

        public function dispose():void
        {
            _callback = null;
            _disposed = true;
        }

        private function nullCallback(_arg_1:IMargins):void
        {
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_6111 = "_-J1v" (String#7135, DoABC#4)
// _SafeStr_6112 = "_-Rk" (String#7838, DoABC#4)
// _SafeStr_6113 = "_-9z" (String#7188, DoABC#4)


