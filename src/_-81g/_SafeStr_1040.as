﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_1040

package _-81g
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1412;

    [SecureSWF(rename="true")]
    public class _SafeStr_1040 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1040(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1412);
        }

        public function getParser():_SafeStr_1412
        {
            return (_SafeStr_7012 as _SafeStr_1412);
        }


    }
}//package _-81g

// _SafeStr_1040 = "_-Mu" (String#8044, DoABC#3)
// _SafeStr_1412 = "_-vs" (String#10428, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


