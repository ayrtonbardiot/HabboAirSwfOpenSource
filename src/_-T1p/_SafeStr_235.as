﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1p._SafeStr_235

package _-T1p
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-a1U._SafeStr_1455;

    [SecureSWF(rename="true")]
    public class _SafeStr_235 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_235(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1455);
        }

        public function getParser():_SafeStr_1455
        {
            return (_SafeStr_7012 as _SafeStr_1455);
        }


    }
}//package _-T1p

// _SafeStr_1455 = "_-sR" (String#10219, DoABC#3)
// _SafeStr_235 = "_-ib" (String#9564, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


