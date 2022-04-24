// by nota

//_-yL._SafeStr_218

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1467;

    [SecureSWF(rename="true")]
    public class _SafeStr_218 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_218(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1467);
        }

        private function getParser():_SafeStr_1467
        {
            return (this._SafeStr_7012 as _SafeStr_1467);
        }

        public function get machineID():String
        {
            return (getParser().machineID);
        }


    }
}//package _-yL

// _SafeStr_1467 = "_-m1d" (String#9808, DoABC#3)
// _SafeStr_218 = "_-o1" (String#9921, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


