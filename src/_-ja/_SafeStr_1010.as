// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_1010

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-31H._SafeStr_1105;

    [SecureSWF(rename="true")]
    public class _SafeStr_1010 extends MessageEvent 
    {

        public function _SafeStr_1010(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1105);
        }

        public function get globalId():String
        {
            return ((this._SafeStr_7012 as _SafeStr_1105).globalId);
        }

        public function get convertedId():int
        {
            return ((this._SafeStr_7012 as _SafeStr_1105).convertedId);
        }

        public function getParser():_SafeStr_1105
        {
            return (_SafeStr_7012 as _SafeStr_1105);
        }


    }
}//package _-Ja

// _SafeStr_1010 = "_-PL" (String#8264, DoABC#3)
// _SafeStr_1105 = "_-X6" (String#8790, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


