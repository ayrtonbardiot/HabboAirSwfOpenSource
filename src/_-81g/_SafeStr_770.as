﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_770

package _-81g
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1095;

    [SecureSWF(rename="true")]
    public class _SafeStr_770 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_770(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1095);
        }

        public function getParser():_SafeStr_1095
        {
            return (_SafeStr_7012 as _SafeStr_1095);
        }


    }
}//package _-81g

// _SafeStr_1095 = "_-8D" (String#7118, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_770 = "_-d1r" (String#9223, DoABC#3)

