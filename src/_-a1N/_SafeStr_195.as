// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a1N._SafeStr_195

package _-a1N
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-MB._SafeStr_1507;

    [SecureSWF(rename="true")]
    public class _SafeStr_195 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_195(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1507);
        }

        private function getParser():_SafeStr_1507
        {
            return (this._SafeStr_7012 as _SafeStr_1507);
        }

        public function get figure():String
        {
            return ((_SafeStr_7012 as _SafeStr_1507).figure);
        }

        public function get gender():String
        {
            return ((_SafeStr_7012 as _SafeStr_1507).gender);
        }


    }
}//package _-a1N

// _SafeStr_1507 = "_-a1f" (String#8981, DoABC#3)
// _SafeStr_195 = "_-V1N" (String#8612, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


