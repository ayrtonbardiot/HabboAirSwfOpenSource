﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IS._SafeStr_188

package _-IS
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class _SafeStr_188 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_188(_arg_1:Vector.<_SafeStr_1153>)
        {
            _SafeStr_6600.push((_arg_1.length * 3));
            for each (var _local_2:_SafeStr_1153 in _arg_1)
            {
                _SafeStr_6600.push(_local_2.dayIndex);
                _SafeStr_6600.push(_local_2.stepIndex);
                _SafeStr_6600.push(_local_2.giftIndex);
            };
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
}//package _-IS

// _SafeStr_1153 = "_-o1v" (String#9941, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_188 = "_-3y" (String#6793, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


