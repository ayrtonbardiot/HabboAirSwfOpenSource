// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.communication.wireformat._SafeStr_3394

package com.sulake.core.communication.wireformat
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import flash.utils.ByteArray;
    import com.hurlant.util._SafeStr_23;

    [SecureSWF(rename="true")]
    internal final class _SafeStr_3394 implements IMessageDataWrapper 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_3740:ByteArray;

        public function _SafeStr_3394(_arg_1:int, _arg_2:ByteArray)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_3740 = _arg_2;
        }

        public function getID():int
        {
            return (_SafeStr_3820);
        }

        public function readString():String
        {
            return (_SafeStr_3740.readUTF());
        }

        public function readInteger():int
        {
            return (_SafeStr_3740.readInt());
        }

        public function readBoolean():Boolean
        {
            return (_SafeStr_3740.readBoolean());
        }

        public function readShort():int
        {
            return (_SafeStr_3740.readShort());
        }

        public function readByte():int
        {
            return (_SafeStr_3740.readByte());
        }

        public function readFloat():Number
        {
            return (_SafeStr_3740.readFloat());
        }

        public function readDouble():Number
        {
            return (_SafeStr_3740.readDouble());
        }

        public function get bytesAvailable():uint
        {
            return (_SafeStr_3740.bytesAvailable);
        }

        public function toString():String
        {
            return ((((("id=" + _SafeStr_3820) + ", pos=") + _SafeStr_3740.position) + ", data=") + _SafeStr_23.fromArray(_SafeStr_3740, true));
        }


    }
}//package com.sulake.core.communication.wireformat

// _SafeStr_23 = "_-EC" (String#39670, DoABC#4)
// _SafeStr_3394 = "_-v7" (String#13868, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


