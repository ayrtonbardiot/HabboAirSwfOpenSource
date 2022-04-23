// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.runtime.InterfaceStruct

package com.sulake.core.runtime
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import flash.utils.getQualifiedClassName;

    internal final class InterfaceStruct implements _SafeStr_13 
    {

        private var _SafeStr_8061:IID;
        private var _iis:String;
        private var _SafeStr_8025:IUnknown;
        private var _SafeStr_8044:uint;

        public function InterfaceStruct(_arg_1:IID, _arg_2:IUnknown)
        {
            _SafeStr_8061 = _arg_1;
            _iis = getQualifiedClassName(_SafeStr_8061);
            _SafeStr_8025 = _arg_2;
            _SafeStr_8044 = 0;
        }

        public function get iid():IID
        {
            return (_SafeStr_8061);
        }

        public function get iis():String
        {
            return (_iis);
        }

        public function get unknown():IUnknown
        {
            return (_SafeStr_8025);
        }

        public function get references():uint
        {
            return (_SafeStr_8044);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_8025 == null);
        }

        public function dispose():void
        {
            _SafeStr_8061 = null;
            _iis = null;
            _SafeStr_8025 = null;
            _SafeStr_8044 = 0;
        }

        public function reserve():uint
        {
            return (++_SafeStr_8044);
        }

        public function release():uint
        {
            return ((references > 0) ? --_SafeStr_8044 : 0);
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_8025 = "_-AK" (String#7278, DoABC#3)
// _SafeStr_8044 = "_-o1A" (String#9924, DoABC#3)
// _SafeStr_8061 = "_-c1F" (String#9109, DoABC#3)


