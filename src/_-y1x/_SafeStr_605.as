// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-y1x._SafeStr_605

package _-y1x
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-l1n._SafeStr_1141;

    [SecureSWF(rename="true")]
    public class _SafeStr_605 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_605(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1141);
        }

        public function getParser():_SafeStr_1141
        {
            return (_SafeStr_7012 as _SafeStr_1141);
        }


    }
}//package _-y1x

// _SafeStr_1141 = "_-qN" (String#10079, DoABC#3)
// _SafeStr_605 = "_-zC" (String#10685, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


