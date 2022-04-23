// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_236

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1142;

    [SecureSWF(rename="true")]
    public class _SafeStr_236 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_236(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1142);
        }

        public function get productName():String
        {
            return ((_SafeStr_7012 as _SafeStr_1142).productName);
        }

        public function get productDescription():String
        {
            return ((_SafeStr_7012 as _SafeStr_1142).productDescription);
        }


    }
}//package _-AE

// _SafeStr_1142 = "_-F1x" (String#7558, DoABC#3)
// _SafeStr_236 = "_-fD" (String#9359, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


