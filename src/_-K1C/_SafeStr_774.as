﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1C._SafeStr_774

package _-K1C
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_774 implements IMessageComposer 
    {

        private var _SafeStr_7341:int;

        public function _SafeStr_774(_arg_1:int)
        {
            _SafeStr_7341 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7341]);
        }


    }
}//package _-K1C

// _SafeStr_7341 = "_-uC" (String#10341, DoABC#3)
// _SafeStr_774 = "_-YS" (String#8870, DoABC#3)


