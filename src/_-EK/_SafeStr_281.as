// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_281

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1250;
    import flash.utils.Dictionary;

    [SecureSWF(rename="true")]
    public class _SafeStr_281 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_281(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1250);
        }

        public function get points():Dictionary
        {
            return ((_SafeStr_7012 as _SafeStr_1250).points);
        }


    }
}//package _-EK

// _SafeStr_1250 = "_-4d" (String#6858, DoABC#3)
// _SafeStr_281 = "_-OA" (String#8171, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


