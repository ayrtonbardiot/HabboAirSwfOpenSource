﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_899

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1247;

    [SecureSWF(rename="true")]
    public class _SafeStr_899 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_899(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1247);
        }

        public function getParser():_SafeStr_1247
        {
            return (_SafeStr_7012 as _SafeStr_1247);
        }


    }
}//package _-EK

// _SafeStr_1247 = "_-a14" (String#8959, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_899 = "_-Up" (String#8595, DoABC#3)

