﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-t14._SafeStr_427

package _-t14
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_427 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_427(_arg_1:int, _arg_2:Array, _arg_3:String, _arg_4:Array, _arg_5:int, _arg_6:int)
        {
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2.length);
            for each (var _local_8:int in _arg_2)
            {
                _SafeStr_6600.push(_local_8);
            };
            _SafeStr_6600.push(_arg_3);
            _SafeStr_6600.push(_arg_4.length);
            for each (var _local_7:int in _arg_4)
            {
                _SafeStr_6600.push(_local_7);
            };
            _SafeStr_6600.push(_arg_5);
            _SafeStr_6600.push(_arg_6);
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-t14

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_427 = "_-rM" (String#10154, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


