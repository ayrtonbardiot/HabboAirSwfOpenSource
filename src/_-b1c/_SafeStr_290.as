﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_290

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1359;

    [SecureSWF(rename="true")]
    public class _SafeStr_290 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_290(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1359);
        }

        public function getParser():_SafeStr_1359
        {
            return (_SafeStr_7012 as _SafeStr_1359);
        }


    }
}//package _-b1c

// _SafeStr_1359 = "_-gP" (String#9425, DoABC#3)
// _SafeStr_290 = "_-s1h" (String#10196, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


