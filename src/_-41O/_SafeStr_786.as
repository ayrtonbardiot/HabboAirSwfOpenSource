// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-41O._SafeStr_786

package _-41O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-3D._SafeStr_1075;

    [SecureSWF(rename="true")]
    public class _SafeStr_786 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_786(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1075);
        }

        public function getParser():_SafeStr_1075
        {
            return (_SafeStr_7012 as _SafeStr_1075);
        }


    }
}//package _-41O

// _SafeStr_1075 = "_-a12" (String#8957, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_786 = "_-p1g" (String#9991, DoABC#3)


