// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_914

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1288;

    [SecureSWF(rename="true")]
    public class _SafeStr_914 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_914(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1288);
        }

        public function getParser():_SafeStr_1288
        {
            return (this._SafeStr_7012 as _SafeStr_1288);
        }


    }
}//package _-AE

// _SafeStr_1288 = "_-q12" (String#10031, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_914 = "_-61R" (String#6948, DoABC#3)


