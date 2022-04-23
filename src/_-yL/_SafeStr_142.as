// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_142

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1345;

    [SecureSWF(rename="true")]
    public class _SafeStr_142 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_142(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1345);
        }

        public function get clubLevel():int
        {
            return ((this._SafeStr_7012 as _SafeStr_1345).clubLevel);
        }

        public function get securityLevel():int
        {
            return ((this._SafeStr_7012 as _SafeStr_1345).securityLevel);
        }

        public function get isAmbassador():Boolean
        {
            return ((this._SafeStr_7012 as _SafeStr_1345).isAmbassador);
        }


    }
}//package _-yL

// _SafeStr_1345 = "_-f1r" (String#9348, DoABC#3)
// _SafeStr_142 = "_-Fc" (String#7572, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


